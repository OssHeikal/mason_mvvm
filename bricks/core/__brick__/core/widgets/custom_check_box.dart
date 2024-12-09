import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/extensions/all_extensions.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({
    super.key,
    this.initialValue = false,
    this.isRequired = false,
    required this.label,
  });

  final bool initialValue;
  final Widget label;
  final bool isRequired;

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  late final ValueNotifier<bool> _checkValueNotifier;
  @override
  void initState() {
    _checkValueNotifier = ValueNotifier(widget.initialValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _checkValueNotifier,
      builder: (context, checked, child) {
        return FormField(
          validator: (value) => widget.isRequired && !_checkValueNotifier.value ? 'required' : null,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          builder: (FormFieldState<bool> formState) {
            return Row(
              children: [
                Checkbox.adaptive(
                  value: checked,
                  activeColor: Colors.transparent,
                  isError: formState.hasError,
                  checkColor: context.primaryColor,
                  shape: RoundedRectangleBorder(borderRadius: 4.borderRadius.r),
                  side: BorderSide(width: 1.w, color: _getBorderColor(checked, formState.hasError, context)),
                  materialTapTargetSize: MaterialTapTargetSize.padded,
                  visualDensity: const VisualDensity(
                    horizontal: VisualDensity.minimumDensity,
                    vertical: VisualDensity.minimumDensity,
                  ),
                  onChanged: (value) {
                    _checkValueNotifier.value = value!;
                    formState.didChange(value);
                  },
                ),
                widget.label,
              ],
            );
          },
        );
      },
    );
  }

  Color _getBorderColor(bool checked, bool hasError, BuildContext context) {
    if (hasError) {
      return context.errorColor;
    } else if (checked) {
      return context.primaryColor;
    } else {
      return context.inputFieldBorderColor;
    }
  }
}
