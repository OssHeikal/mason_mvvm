import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/extensions/all_extensions.dart';
import '../../resources/resources.dart';
import 'custom_input_field.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.prefixIcon,
    this.controller,
    this.hint,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onTap,
    this.readOnly = false,
    this.height,
    this.focusNode,
    this.onChanged,
  });
  final String? prefixIcon;
  final TextEditingController? controller;
  final String? hint;
  final bool isPassword;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final bool readOnly;
  final double? height;
  final FocusNode? focusNode;
  final void Function(String)? onChanged;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final FocusNode _focusNode = FocusNode();
  final ValueNotifier<bool> _hasFocus = ValueNotifier<bool>(false);

  @override
  void initState() {
    _focusNode.addListener(() {
      _hasFocus.value = _focusNode.hasFocus;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _hasFocus,
      builder: (context, hasFocus, child) {
        final bool enabled = hasFocus || widget.controller?.text.isNotEmpty == true;
        return FormField(
          validator: (_) {
            if (widget.validator != null) {
              return widget.validator!(widget.controller!.text);
            }
            return null;
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          builder: (FormFieldState<String> formState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedContainer(
                  curve: Curves.easeInOutCubic,
                  duration: 200.milliseconds,
                  padding: AppSize.s1.edgeInsetsAll,
                  decoration: BoxDecoration(
                    gradient: enabled && !formState.hasError ? GradientStyles.primaryGradient : null,
                    borderRadius: AppSize.inputBorderRadius.borderRadius,
                  ),
                  child: CustomInputField.outlined(
                    readOnly: widget.readOnly,
                    height: widget.height,
                    hint: widget.hint,
                    focusNode: widget.focusNode ?? _focusNode,
                    isPassword: widget.isPassword,
                    background: !enabled ? context.primaryContainerColor : null,
                    borderColor: formState.hasError ? context.errorColor : Colors.transparent,
                    controller: widget.controller,
                    keyboardType: widget.keyboardType,
                    prefixIcon: widget.prefixIcon?.toSvg(
                      colorFilter: enabled ? context.iconColor.colorFilter : context.hintTextStyle.color!.colorFilter,
                      width: AppSize.iconNormal,
                      height: AppSize.iconNormal,
                    ),
                    onChanged: (value) {
                      widget.onChanged?.call(value);
                      formState.didChange(value);
                    },
                    onEditingComplete: () {
                      _focusNode.unfocus();
                      widget.focusNode?.unfocus();
                    },
                    onTap: () {
                      _focusNode.requestFocus();
                      widget.onTap?.call();
                    },
                  ),
                ),
                if (formState.hasError) Text(formState.errorText!, style: context.errorStyle).paddingTop(8.sp),
              ],
            );
          },
        );
      },
    );
  }
}
