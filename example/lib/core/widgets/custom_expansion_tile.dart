import 'package:flutter/material.dart';

import '../config/extensions/all_extensions.dart';
import '../resources/resources.dart';

class CustomExpansionTile extends StatelessWidget {
  const CustomExpansionTile({super.key, required this.title, required this.content});

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        maintainState: true,
        tilePadding: EdgeInsets.zero,
        childrenPadding: EdgeInsets.zero.copyWith(bottom: AppSize.s8),
        title: Text(title, style: context.titleLarge!.s16),
        children: [Text(content, style: context.titleMedium!.s14)],
      ),
    );
  }
}
