import 'package:flutter/rendering.dart';

extension EdgeInsetsGeometryExtension on EdgeInsetsGeometry {
  double get start {
    if (this is EdgeInsetsDirectional) {
      return (this as EdgeInsetsDirectional).start;
    }
    return (this as EdgeInsets).left;
  }

  double get end {
    if (this is EdgeInsetsDirectional) {
      return (this as EdgeInsetsDirectional).end;
    }
    return (this as EdgeInsets).right;
  }

  double get top {
    if (this is EdgeInsetsDirectional) {
      return (this as EdgeInsetsDirectional).top;
    }
    return (this as EdgeInsets).top;
  }

  double get bottom {
    if (this is EdgeInsetsDirectional) {
      return (this as EdgeInsetsDirectional).bottom;
    }
    return (this as EdgeInsets).bottom;
  }
}
