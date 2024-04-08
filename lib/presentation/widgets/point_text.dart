import 'package:flutter/material.dart';

import '../utility/app_colors.dart';

class PointText extends StatelessWidget {
  final String text;
  const PointText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            height: 10,
            width: 10,
            margin: const EdgeInsets.only(top: 8),
            decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.primaryColor)),
        const SizedBox(width: 8),
        Flexible(
          child: Text(text, style: Theme.of(context).textTheme.bodyLarge),
        ),
      ],
    );
  }
}
