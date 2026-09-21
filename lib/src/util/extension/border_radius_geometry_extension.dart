import 'package:flutter/rendering.dart';

extension BorderRadiusGeometryExtension on BorderRadiusGeometry {
  Radius get topStart {
    if (this is BorderRadiusDirectional) {
      return (this as BorderRadiusDirectional).topStart;
    }
    return (this as BorderRadius).topLeft;
  }

  Radius get topEnd {
    if (this is BorderRadiusDirectional) {
      return (this as BorderRadiusDirectional).topEnd;
    }
    return (this as BorderRadius).topRight;
  }

  Radius get bottomStart {
    if (this is BorderRadiusDirectional) {
      return (this as BorderRadiusDirectional).bottomStart;
    }
    return (this as BorderRadius).bottomLeft;
  }

  Radius get bottomEnd {
    if (this is BorderRadiusDirectional) {
      return (this as BorderRadiusDirectional).bottomEnd;
    }
    return (this as BorderRadius).bottomRight;
  }

  BorderRadius get value {
    if (this is BorderRadiusDirectional) {
      return BorderRadius.only(
        topLeft: topStart,
        topRight: topEnd,
        bottomLeft: bottomStart,
        bottomRight: bottomEnd,
      );
    }
    return (this as BorderRadius);
  }

  BorderRadiusGeometry copyWith({
    Radius? topStart,
    Radius? topEnd,
    Radius? bottomStart,
    Radius? bottomEnd,
  }) {
    if (this is BorderRadiusDirectional) {
      return BorderRadiusDirectional.only(
        topStart: topStart ?? this.topStart,
        topEnd: topEnd ?? this.topEnd,
        bottomStart: bottomStart ?? this.bottomStart,
        bottomEnd: bottomEnd ?? this.bottomEnd,
      );
    }
    // A physical BorderRadius becomes directional (left is start, right is
    // end): identical in a left-to-right layout, and the corners passed as
    // start/end mirror in a right-to-left layout, as their names promise.
    return BorderRadiusDirectional.only(
      topStart: topStart ?? this.topStart,
      topEnd: topEnd ?? this.topEnd,
      bottomStart: bottomStart ?? this.bottomStart,
      bottomEnd: bottomEnd ?? this.bottomEnd,
    );
  }
}
