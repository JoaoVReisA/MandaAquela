import 'package:flutter/material.dart';
import 'package:manda_aquela/color_schemes.g.dart';
import 'package:manda_aquela/domain/entities/event.dart';
import 'package:manda_aquela/presenter/common/text_styles.dart';
import 'package:manda_aquela/presenter/widgets/bottom_sheets/opotunity_bottom_sheet.dart';

class EventsDetailPage extends StatefulWidget {
  const EventsDetailPage({super.key, required this.event});

  final Events event;

  @override
  State<EventsDetailPage> createState() => _EventsDetailPageState();
}

class _EventsDetailPageState extends State<EventsDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(widget.event.name,
            style:
                TextStyles.outfit18px700w.copyWith(color: AppColors.textGrey)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16,
            ),
            Text(
              'Um pouco sobre o evento',
              style: TextStyles.outfit18px700w.copyWith(color: Colors.black),
              textAlign: TextAlign.start,
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Container(
                padding: const EdgeInsets.all(24),
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: const LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      AppColors.highlight,
                      AppColors.fadePink,
                    ],
                  ),
                ),
                child: Text(
                  widget.event.description,
                  style:
                      TextStyles.outfit15px400w.copyWith(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Divider(
              color: AppColors.textGrey,
              thickness: 2,
            ),
            Text(
              'Detalhes',
              style: TextStyles.outfit15pxBold.copyWith(color: Colors.black),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                const Icon(
                  Icons.calendar_month,
                  color: AppColors.primary,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  widget.event.date,
                  style:
                      TextStyles.outfit15px400w.copyWith(color: Colors.black),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: AppColors.primary,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  widget.event.locale,
                  style:
                      TextStyles.outfit15px400w.copyWith(color: Colors.black),
                ),
              ],
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  showModalBottomSheet(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    isScrollControlled: true,
                    useRootNavigator: true,
                    context: context,
                    builder: (context) {
                      return OportunityBottomSheet(
                        oportunities: widget.event.oportunities,
                        onPressedInterest: (_) {},
                      );
                    },
                  );
                },
                child: Text(
                  'Oportunidades',
                  style: TextStyles.outfit15pxBold.copyWith(
                      color: AppColors.primary,
                      decoration: TextDecoration.underline),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
