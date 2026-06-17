import 'package:flutter/widgets.dart';
import 'package:rive/rive.dart';

class RiveAsset extends StatefulWidget {
  final String asset;
  final double? width;
  final double? height;
  final BoxFit fit;

  const RiveAsset({
    required this.asset,
    required this.width,
    required this.height,
    required this.fit,
    super.key,
  });

  @override
  State<RiveAsset> createState() => _RiveAssetState();
}

class _RiveAssetState extends State<RiveAsset> {
  late FileLoader _fileLoader;

  @override
  void initState() {
    super.initState();
    _fileLoader = FileLoader.fromAsset("assets/vehicles.riv", riveFactory: Factory.rive);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: RiveWidgetBuilder(
        fileLoader: _fileLoader,
        builder: (context, state) {
          if (state is RiveLoaded) {
            return RiveWidget(
              controller: state.controller,
              fit: _getRiveFit(),
            );
          }
          if (state is RiveFailed) {
            debugPrint(state.error.toString());
          }
          return SizedBox();
        },
      ),
    );
  }

  Fit _getRiveFit() {
    switch (widget.fit) {
      case BoxFit.contain:
        return Fit.contain;
      case BoxFit.cover:
        return Fit.cover;
      case BoxFit.fill:
        return Fit.fill;
      case BoxFit.fitWidth:
        return Fit.fitWidth;
      case BoxFit.fitHeight:
        return Fit.fitHeight;
      case BoxFit.none:
        return Fit.none;
      case BoxFit.scaleDown:
        return Fit.scaleDown;
    }
  }
}
