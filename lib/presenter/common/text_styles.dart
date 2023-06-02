import 'package:flutter/material.dart';
import 'package:manda_aquela/presenter/common/font_family.dart';

class TextStyles {
  static const base = FontFamilies.outfit;

  static final outfit30px700w = base.copyWith(
    fontSize: 30,
    fontWeight: FontWeight.w700,
  );

  static final outfit15px400w = base.copyWith(
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );

  static final outfit15pxBold = base.copyWith(
    fontSize: 15,
    fontWeight: FontWeight.bold,
  );

  static final outfit18px700w = base.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );
}
