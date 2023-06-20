import 'package:flutter/material.dart';
import 'package:manda_aquela/color_schemes.g.dart';
import 'package:manda_aquela/presenter/common/font_family.dart';

class TextStyles {
  static const base = FontFamilies.outfit;
  static const roboto = FontFamilies.roboto;
  static const poppins = FontFamilies.poppins;

  static final outfit30px700w = roboto.copyWith(
    fontSize: 30,
    fontWeight: FontWeight.w700,
  );

  static final outfit12px400w = base.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w400,
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

  static final outfit24px700w = base.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );

  static final outfit18px400w = base.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );

  static final roboto12px500w = roboto.copyWith(
    fontSize: 12,
    letterSpacing: 0.5,
    fontWeight: FontWeight.w500,
  );

  static final poppins14px700w = poppins.copyWith(
    fontSize: 14,
    letterSpacing: 0.5,
    fontWeight: FontWeight.w700,
  );

  static final poppins8px500w = poppins.copyWith(
    fontSize: 8,
    fontWeight: FontWeight.w500,
  );

  static final poppins10px500w = poppins.copyWith(
    fontSize: 10,
    letterSpacing: 0.5,
    fontWeight: FontWeight.w500,
  );

  static final poppins10px700w = poppins.copyWith(
    fontSize: 10,
    letterSpacing: 0.5,
    fontWeight: FontWeight.w700,
  );

  static final outfit25px700w = base.copyWith(
    fontSize: 25,
    fontWeight: FontWeight.w700,
  );
  static final outfit64px400wGreen = base.copyWith(
    fontSize: 64,
    fontWeight: FontWeight.w400,
    color: AppColors.success,
  );
}
