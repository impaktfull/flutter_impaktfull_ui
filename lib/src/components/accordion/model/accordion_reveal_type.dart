import 'package:flutter/widgets.dart';

enum ImpaktfullUiAccordionRevealType {
  expand(AlignmentDirectional(0.0, 0.0)),
  topDown(AlignmentDirectional(-1.0, 1.0)),
  reveal(AlignmentDirectional(-1.0, -1.0));

  final AlignmentGeometry alignment;

  const ImpaktfullUiAccordionRevealType(this.alignment);
}
