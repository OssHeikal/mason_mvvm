import 'package:flutter/material.dart';

import '../../config/extensions/all_extensions.dart';

class HorizontalDataView extends StatelessWidget {
  const HorizontalDataView({
    super.key,
    required this.title,
    required this.subtitle,
    this.titleStyle,
    this.subtitleStyle,
  });
  final String title;
  final String subtitle;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: titleStyle ?? context.bodySmall.s12.regular),
        Text(subtitle, style: subtitleStyle ?? context.titleMedium.s12.medium),
      ],
    );
  }
}
