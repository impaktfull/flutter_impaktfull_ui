import 'dart:math';
import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/confetti/confetti.dart';
import 'package:impaktfull_ui_2/src/components/confetti/model/confetti_particle.dart';
import 'package:impaktfull_ui_2/src/components/confetti/painter/asset_painter.dart';
import 'package:impaktfull_ui_2/src/components/confetti/painter/confetti_painter.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/models/asset.dart';
import 'package:impaktfull_ui_2/src/util/after_layout/after_layout.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';

export 'confetti_style.dart';
export 'model/confetti_type.dart';

part 'confetti.describe.dart';

class ImpaktfullUiConfetti extends StatefulWidget
    with ComponentDescriptorMixin {
  final ImpaktfullUiAsset? asset;

  /// The type of confetti to display. If not provided, a random type will be used.
  final ImpaktfullUiConfettiType? type;
  final Color? color;
  final List<Color>? randomColors;
  final bool repeat;
  final Duration initialDelay;
  final Duration duration;
  final double initialYOffset;
  final List<ImpaktfullUiConfettiType>? excludedTypesWithRandom;
  final ImpaktfullUiConfettiTheme? theme;

  const ImpaktfullUiConfetti({
    this.asset,
    this.color,
    this.type,
    this.repeat = true,
    this.randomColors,
    this.duration = const Duration(seconds: 5),
    this.initialDelay = Duration.zero,
    this.initialYOffset = 100,
    this.excludedTypesWithRandom,
    this.theme,
    super.key,
  });

  @override
  State<ImpaktfullUiConfetti> createState() => _ImpaktfullUiConfettiState();

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}

class _ImpaktfullUiConfettiState extends State<ImpaktfullUiConfetti>
    with SingleTickerProviderStateMixin, AfterLayout {
  final _key = GlobalKey();
  late AnimationController _controller;
  final _particles = <ImpaktfullUiConfettiParticle>[];
  final _random = Random();
  final _assetPainter = AssetPainter();

  DateTime? _dateTimeToStopAddingParticles;
  var _frameCount = 0;
  var _isAddingParticles = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration + const Duration(seconds: 20),
    )..addListener(() => _updateParticles());
  }

  @override
  void didUpdateWidget(covariant ImpaktfullUiConfetti oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.type != widget.type) {
      _controller.reset();
      _isAddingParticles = true;
      _setupParticles();
    }
  }

  @override
  void afterFirstLayout(BuildContext context) => _setupParticles();

  Future<void> _setupParticles() async {
    final componentTheme =
        widget.theme ?? ImpaktfullUiConfettiTheme.of(context);
    if (widget.asset != null) {
      await _assetPainter.load(widget.asset);
    } else if (widget.type == ImpaktfullUiConfettiType.leaf) {
      final asset = componentTheme.assets.leaf;
      await _assetPainter.load(asset);
    }

    _initializeParticles(componentTheme);
    await Future.delayed(widget.initialDelay);
    if (widget.duration != Duration.zero) {
      _dateTimeToStopAddingParticles = DateTime.now().add(widget.duration);
    }
    if (widget.repeat) {
      _controller.repeat();
    } else {
      _controller.forward();
    }
  }

  void _initializeParticles(ImpaktfullUiConfettiTheme componentTheme) {
    final renderBox = _key.currentContext?.findRenderObject() as RenderBox;
    final size = renderBox.size;
    _particles.clear();
    for (var i = 0; i < 10; i++) {
      _addParticle(componentTheme, size);
    }
  }

  void _addParticle(ImpaktfullUiConfettiTheme componentTheme, Size size) {
    Color color;
    if (widget.randomColors == null) {
      color = widget.color ?? componentTheme.colors.particleColor;
    } else {
      final randomColors = widget.randomColors ?? Colors.primaries;
      color = randomColors[_random.nextInt(randomColors.length)];
    }
    _particles.add(ImpaktfullUiConfettiParticle(
      type: widget.type ??
          ImpaktfullUiConfettiType.random(widget.excludedTypesWithRandom ?? []),
      position:
          Offset(_random.nextDouble() * size.width, -widget.initialYOffset),
      color: color,
      size: _random.nextDouble() * 8 + 4,
      speed: _random.nextDouble() * 4 + 2,
      angle: _random.nextDouble() * pi / 2 + pi / 4,
      rotation: _random.nextDouble() * pi / 2,
    ));
  }

  void _updateParticles() {
    if (!mounted) return;
    final renderBox = _key.currentContext?.findRenderObject();
    if (renderBox == null || !renderBox.attached) return;
    final size = (renderBox as RenderBox).size;
    final componentTheme =
        widget.theme ?? ImpaktfullUiConfettiTheme.of(context);

    _frameCount++;
    // Add new particles every few frames if we're still adding particles
    if (_frameCount % 3 == 0 && _isAddingParticles) {
      _addParticle(componentTheme, size);
    }

    // Update existing particles
    for (var i = _particles.length - 1; i >= 0; i--) {
      final particle = _particles[i];

      if (particle.type == ImpaktfullUiConfettiType.leaf) {
        final time = DateTime.now().millisecondsSinceEpoch / 1000;
        final swayFrequency = 2 + (particle.speed * 0.2);
        final swayAmplitude = 1.5 + (particle.size * 0.1);
        final swayAmount = sin(time * swayFrequency) * swayAmplitude;
        final fallSpeed = particle.speed * 0.5;

        particle.position = Offset(
          particle.position.dx + swayAmount,
          particle.position.dy + fallSpeed,
        );
        particle.rotation += 0.015 + (particle.speed * 0.002);
      } else {
        particle.position = Offset(
          particle.position.dx + cos(particle.angle) * particle.speed,
          particle.position.dy + sin(particle.angle) * particle.speed + 1,
        );
        particle.rotation += 0.015 + (particle.speed * 0.002);
      }

      // Remove particles that are out of view
      if (particle.position.dy > size.height) {
        _particles.removeAt(i);
      }
    }

    // If not repeating and controller is at end, stop adding new particles
    final dateTimeToStopAddingParticles = _dateTimeToStopAddingParticles;
    if (!widget.repeat &&
        dateTimeToStopAddingParticles != null &&
        DateTime.now().isAfter(dateTimeToStopAddingParticles)) {
      _isAddingParticles = false;
    }

    // If not repeating and no particles left, stop the animation
    if (!widget.repeat && _particles.isEmpty && !_isAddingParticles) {
      _controller.stop();
    }

    // Limit total number of particles
    while (_particles.length > 200) {
      _particles.removeAt(0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuilder<ImpaktfullUiConfettiTheme>(
      overrideComponentTheme: widget.theme,
      builder: (context, componentTheme) => CustomPaint(
        key: _key,
        size: Size.infinite,
        painter: ImpaktfullUiConfettiPainter(
          particles: _particles,
          assetPainter: _assetPainter,
          repaint: _controller,
        ),
        foregroundPainter: null,
        isComplex: true,
        willChange: true,
        child: null,
      ),
    );
  }
}
