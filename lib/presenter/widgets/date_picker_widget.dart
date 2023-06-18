import 'package:flutter/material.dart';
import 'package:manda_aquela/core/extensions/date_time_extensions.dart';
import 'package:manda_aquela/presenter/common/text_styles.dart';

class DatePickerWidget extends StatelessWidget {
  const DatePickerWidget(
      {super.key, required this.onTap, required this.dateTime});
  final VoidCallback onTap;
  final DateTime? dateTime;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              dateTime?.toFormattedString ?? 'Selecione a data',
              style: TextStyles.outfit15px400w.copyWith(
                color: Colors.black,
              ),
            ),
            const Icon(
              Icons.calendar_today_outlined,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
