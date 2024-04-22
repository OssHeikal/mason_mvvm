import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

import '../config/extensions/all_extensions.dart';
import '../resources/resources.dart';

class CustomReadMoreText extends StatelessWidget {
  const CustomReadMoreText(this.text, {super.key});

  final String text;
  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      text,
      trimLines: 3,
      locale: context.locale,
      colorClickableText: context.primaryColor,
      trimExpandedText: LocaleKeys.show_less.tr(),
      trimCollapsedText: LocaleKeys.read_more.tr(),
      isExpandable: true,
      moreStyle: context.titleLarge!.medium.s14,
      lessStyle: context.titleLarge!.medium.s14,
      trimMode: TrimMode.Line,
      style: GoogleFonts.tajawal(fontSize: FontSize.s14, color: context.bodyLarge!.color),
    );
  }
}
