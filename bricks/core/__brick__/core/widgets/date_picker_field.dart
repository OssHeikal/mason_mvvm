import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../config/extensions/all_extensions.dart';
import '../resources/resources.dart';
import 'custom_text_field.dart';

class DatePickerField extends StatefulWidget {
  const DatePickerField({
    super.key,
    this.hint,
    this.title,
    this.initialValue,
    this.minDate,
    this.maxDate,
    this.onChanged,
  });

  final String? hint;
  final String? title;
  final DateTime? initialValue;
  final DateTime? minDate;
  final DateTime? maxDate;
  final void Function(DateTime)? onChanged;

  @override
  State<DatePickerField> createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  late final ValueNotifier<DateTime?> _date;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    _date = ValueNotifier<DateTime?>(widget.initialValue);
    _date.addListener(() => _controller.text = dateText ?? '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _date,
      builder: (context, dateTime, child) {
        return FormField<DateTime?>(
          validator: (_) {
            if (_date.value == null) {
              return LocaleKeys.validator_required.tr();
            }
            return null;
          },
          builder: (FormFieldState<DateTime?> formState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(
                  controller: _controller,
                  title: widget.title ?? LocaleKeys.details_date_time_date.tr(),
                  hint: widget.hint ?? LocaleKeys.details_date_time_date.tr().selectHint,
                  readOnly: true,
                  prefixIcon: Assets.icons.calendarFill.path,
                  onTap: () async {
                    if (!context.isAndroid) {
                      _date.value = await showDatePicker(
                        context: context,
                        initialDate: _date.value ?? DateTime.now(),
                        firstDate: widget.minDate ?? DateTime.now().subtract(const Duration(days: 365 * 18)),
                        lastDate: widget.maxDate ?? DateTime.now().add(const Duration(days: 365 * 18)),
                      ).then((value) {
                        if (value != null) {
                          formState.didChange(value);

                          _controller.text = dateText ?? '';
                          return value;
                        } else {
                          return _date.value;
                        }
                      });
                    } else {
                      showCupertinoModalPopup(
                        context: context,
                        builder: (context) {
                          dateTime = _date.value ?? DateTime.now().startOfDay;
                          return Container(
                            color: context.scaffoldBackgroundColor,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Material(
                                      color: context.scaffoldBackgroundColor,
                                      child: Text(LocaleKeys.actions_done.tr()).clickable(
                                        style: context.titleLarge.bold.s14,
                                        padding: 16.edgeInsetsAll.copyWith(bottom: 0),
                                        onTap: () {
                                          context.pop();
                                          _date.value = dateTime;
                                          _controller.text = dateText ?? '';
                                          widget.onChanged?.call(dateTime!);
                                          formState.didChange(dateTime);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                CupertinoDatePicker(
                                  mode: CupertinoDatePickerMode.date,
                                  maximumYear: widget.maxDate?.year,
                                  minimumYear: widget.minDate?.year ?? 1900,
                                  maximumDate: widget.maxDate,
                                  minimumDate: widget.minDate,
                                  initialDateTime: _date.value,
                                  onDateTimeChanged: (value) => dateTime = value,
                                ).withHeight(240.h),
                              ],
                            ),
                          );
                        },
                      );
                    }
                    widget.onChanged?.call(_date.value!);
                  },
                ),
                if (formState.hasError)
                  Text(formState.errorText!, style: context.errorStyle).paddingHorizontal(16.sp).paddingTop(8.sp),
              ],
            );
          },
        );
      },
    );
  }

  TextStyle? get dateStyle {
    if (_date.value == null) {
      return context.hintTextStyle;
    } else {
      return context.textTheme.bodyLarge?.regular.s12;
    }
  }

  String? get dateText => _date.value?.format();

  DateTime? get minimumDate => widget.minDate ?? DateTime.now().subtract(const Duration(days: 365 * 18));

  DateTime? get maximumDate => widget.maxDate ?? DateTime.now().add(const Duration(days: 365 * 18));
}
