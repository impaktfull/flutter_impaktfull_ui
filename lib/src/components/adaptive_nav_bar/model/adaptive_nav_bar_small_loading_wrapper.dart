import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

class ImpaktfullUiNavBarSmallLoadingWrapper extends StatefulWidget {
  final VoidCallback? onTap;
  final AsyncCallback? onAsyncTap;
  final ImpaktfullUiAsset asset;
  final String toolTip;

  const ImpaktfullUiNavBarSmallLoadingWrapper({
    required this.onTap,
    required this.onAsyncTap,
    required this.asset,
    required this.toolTip,
    super.key,
  });

  @override
  State<ImpaktfullUiNavBarSmallLoadingWrapper> createState() =>
      _ImpaktfullUiNavBarSmallLoadingWrapperState();
}

class _ImpaktfullUiNavBarSmallLoadingWrapperState
    extends State<ImpaktfullUiNavBarSmallLoadingWrapper> {
  var _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Visibility.maintain(
          visible: !_isLoading,
          child: ImpaktfullUiIconButton(
            onTap: _onTap,
            asset: widget.asset,
            tooltip: widget.toolTip,
          ),
        ),
        if (_isLoading) ...[
          const SizedBox(
            width: 24,
            height: 24,
            child: ImpaktfullUiLoadingIndicator(),
          ),
        ],
      ],
    );
  }

  Future<void> _onTap() async {
    if (widget.onTap != null) {
      widget.onTap!();
      return;
    } else {
      setState(() => _isLoading = true);
      try {
        await widget.onAsyncTap!();
        setState(() => _isLoading = false);
      } catch (e) {
        setState(() => _isLoading = false);
        rethrow;
      }
    }
  }
}
