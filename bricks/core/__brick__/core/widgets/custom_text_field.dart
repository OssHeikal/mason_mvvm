import 'package:flutter/material.dart';

import '../config/extensions/all_extensions.dart';
import '../resources/resources.dart';
import 'custom_input_field.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.label,
    this.hint,
    this.controller,
    this.isPassword = false,
    this.prefix,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.maxLines = 1,
    this.initialValue,
  });

  final bool isPassword;
  final String? label;
  final String? hint;
  final TextEditingController? controller;
  final Widget? prefix;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final int maxLines;
  final String? initialValue;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final FocusNode _focusNode = FocusNode();

  final ValueNotifier<bool> hasFocus = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: hasFocus,
      builder: (context, value, child) {
        final bool focused = hasFocus.value || widget.controller!.text.isNotEmpty;
        return FormField(
          validator: widget.validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          builder: (FormFieldState formState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomInputField(
                  // initialValue: widget.initialValue,
                  maxLines: widget.maxLines,
                  hint: widget.hint,
                  isPassword: widget.isPassword,
                  controller: widget.controller,
                  focusNode: _focusNode,
                  isDense: hasFocus.value || widget.controller!.text.isNotEmpty,
                  label: widget.label,
                  prefixIcon: widget.prefix,
                  keyboardType: widget.keyboardType,
                  onChanged: (value) => formState.didChange(value),
                  onEditingComplete: () {
                    _focusNode.unfocus();
                    hasFocus.value = false;
                  },
                  onTap: () {
                    _focusNode.requestFocus();
                    hasFocus.value = true;
                  },
                  borderColor: Colors.transparent,
                ).paddingTop(focused ? 10 : 0).setContainerToView(
                      borderColor: formState.hasError
                          ? context.errorColor
                          : focused
                              ? context.primaryColor
                              : context.inputFieldBorderColor,
                      radius: AppSize.inputBorderRadius,
                    ),
                if (formState.hasError)
                  Text(
                    formState.errorText!,
                    style: context.errorStyle,
                    textAlign: TextAlign.start,
                  ).paddingTop(AppSize.s4).paddingStart(AppSize.s4),
              ],
            );
          },
        );
      },
    );
  }
}
