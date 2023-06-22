import 'package:flutter/material.dart';
import 'package:manda_aquela/color_schemes.g.dart';

class SuccessSnackBar extends StatelessWidget {
  const SuccessSnackBar({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        color: AppColors.success,
        child: Center(
          child: Text(
            'Sucesso! $message',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ));
  }
}
