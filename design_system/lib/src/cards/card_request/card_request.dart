import 'package:core_module/core_module.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class CardRequest extends StatelessWidget {
  final double value;
  final String title, helpedName, localName, dateString;
  const CardRequest({
    super.key,
    required this.value,
    required this.title,
    required this.helpedName,
    required this.localName,
    required this.dateString,
  });

  @override
  Widget build(BuildContext context) {
    final colors = CoopartilharColors.of(context);
    final texts = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        color: colors.lightGrey.withOpacity(0.4),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: colors.middleGrey),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: colors.primary.withOpacity(.1),
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  child: Text(
                    value.toString(),
                    style: TextStyle(
                      color: colors.primary,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Icon(
                UIcons.regularStraight.arrow_small_right,
                size: 30,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(title, style: texts.displayMedium),
          const SizedBox(height: 8),
          Text(
            'Bairro: $localName',
            style: texts.bodyMedium?.copyWith(color: colors.textColor),
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            height: 1,
            color: colors.grey,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.access_time,
                    color: colors.textColor,
                  ),
                  const SizedBox(width: 6),
                  Text(dateString, style: texts.bodyMedium?.copyWith(color: colors.textColor)),
                ],
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Por: $helpedName',
                  overflow: TextOverflow.ellipsis,
                  style: texts.bodyMedium?.copyWith(color: colors.textColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
