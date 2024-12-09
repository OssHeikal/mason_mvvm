import 'package:evently/core/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/extensions/all_extensions.dart';

class CustomSwitchField extends StatefulWidget {
  const CustomSwitchField({super.key, this.title, required this.value, this.onChanged});

  final String? title;
  final bool value;
  final void Function(bool)? onChanged;

  @override
  State<CustomSwitchField> createState() => _CustomSwitchFieldState();
}

class _CustomSwitchFieldState extends State<CustomSwitchField> {
  late final ValueNotifier<bool> _value;
  @override
  void initState() {
    _value = ValueNotifier<bool>(widget.value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.title ?? "", style: context.bodyLarge.regular.s12)
            .setSvgToView(
              gap: 12,
              svgPath: Assets.icons.truckFill.path,
              color: context.iconColorDisabled,
              size: 20.sp,
            )
            .flexible(),
        ValueListenableBuilder<bool>(
          valueListenable: _value,
          builder: (context, value, __) {
            return Switch.adaptive(
              value: value,
              activeColor: context.successColor,
              onChanged: (value) {
                _value.value = value;
                widget.onChanged?.call(value);
              },
            );
          },
        ),
      ],
    ).paddingHorizontal(14).setBorder(color: context.inputFieldBorderColor, radius: AppSize.inputBorderRadius);
  }
}
