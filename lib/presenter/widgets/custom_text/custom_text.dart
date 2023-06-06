import 'package:flutter/material.dart';
import 'package:manda_aquela/presenter/common/text_styles.dart';

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
