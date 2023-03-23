import 'package:flutter/material.dart';

import '../../text_styles.dart';

class CustomText extends StatelessWidget {
  CustomText(this.data, {this.style, super.key});
  final String data;
  TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: style ?? TextStyles.base,
    );
  }
}
