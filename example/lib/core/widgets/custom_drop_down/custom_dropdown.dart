library animated_custom_dropdown;

import 'dart:async';

import 'package:al_sadeem_app/core/config/extensions/all_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../config/theme/light_theme.dart';
import '../../resources/resources.dart';

export 'custom_dropdown.dart';

part 'animated_section.dart';
part 'dropdown_field.dart';
part 'dropdown_overlay/dropdown_overlay.dart';
part 'dropdown_overlay/widgets/items_list.dart';
part 'dropdown_overlay/widgets/search_field.dart';
part 'overlay_builder.dart';

enum _SearchType { onListData, onRequestData }

const _defaultFillColor = Colors.white;
const _defaultErrorColor = LightThemeColors.error;

mixin CustomDropdownListFilter {
  /// Used to filter elements against query on
  /// [CustomDropdown<T>.search] or [CustomDropdown<T>.searchRequest]
  bool filter(String query);
}

const _defaultBorderRadius = BorderRadius.all(Radius.circular(AppSize.s8));

final Border _defaultErrorBorder = Border.all(color: _defaultErrorColor, width: 1);

final Border _defaultBorder = Border.all(color: LightThemeColors.border, width: 1);

const _defaultErrorStyle = TextStyle(color: _defaultErrorColor, fontSize: 14, height: 0.5);

const _defaultHintValue = 'Select value';

typedef _ListItemBuilder<T> = Widget Function(
  BuildContext context,
  T item,
);
typedef _HeaderBuilder<T> = Widget Function(
  BuildContext context,
  T selectedItem,
);
typedef _HintBuilder = Widget Function(
  BuildContext context,
  String hint,
);
typedef _NoResultFoundBuilder = Widget Function(
  BuildContext context,
  String text,
);

class CustomDropdown<T> extends StatefulWidget {
  /// The list of items the user can select.
  final List<T>? items;

  /// Initial selected item from the list of [items].
  final T? initialItem;

  /// Text that suggests what sort of data the dropdown represents.
  final String? hintText;

  /// Text that suggests what to search in the search field.
  final String? searchHintText;

  /// Border for closed state of [CustomDropdown].
  final BoxBorder? closedBorder;

  /// Border radius for closed state of [CustomDropdown].
  final BorderRadius? closedBorderRadius;

  /// Border for opened/expanded state of [CustomDropdown].
  final BoxBorder? expandedBorder;

  /// Border radius for opened/expanded state of [CustomDropdown].
  final BorderRadius? expandedBorderRadius;

  /// A method that validates the selected item.
  /// Returns an error string to display as per the validation, or null otherwise.
  final String? Function(T?)? validator;

  /// Error border for closed state of [CustomDropdown].
  final BoxBorder? closedErrorBorder;

  /// Error border radius for closed state of [CustomDropdown].
  final BorderRadius? closedErrorBorderRadius;

  /// The style to use for the string returning from [validator].
  final TextStyle? errorStyle;

  /// Enable the validation listener on item change.
  /// This implies to [validator] everytime when the item change.
  final bool validateOnChange;

  /// Suffix icon for closed state of [CustomDropdown].
  final Widget? closedSuffixIcon;

  /// Suffix icon for opened/expanded state of [CustomDropdown].
  final Widget? expandedSuffixIcon;

  /// Called when the item of the [CustomDropdown] should change.
  final Function(T)? onChanged;

  /// Hide the selected item from the [items] list.
  final bool excludeSelected;

  /// [CustomDropdown] field color (closed state).
  final Color? closedFillColor;

  /// [CustomDropdown] overlay color (opened/expanded state).
  final Color? expandedFillColor;

  /// Can close [CustomDropdown] overlay by tapping outside.
  /// Here "outside" covers the entire screen.
  final bool canCloseOutsideBounds;

  /// Hide the selected item field when [CustomDropdown] overlay opened/expanded.
  final bool hideSelectedFieldWhenExpanded;

  /// The asynchronous computation from which the items list returns.
  final Future<List<T>> Function(String)? futureRequest;

  /// Text that notify there's no search results match.
  final String? noResultFoundText;

  /// Duration after which the [futureRequest] is to be executed.
  final Duration? futureRequestDelay;

  /// Text maxlines for header and list item text.
  /// Useless if any or both [headerBuilder] and [listItemBuilder] provided.
  final int maxlines;

  /// The [listItemBuilder] that will be used to build item on demand.
  // ignore: library_private_types_in_public_api
  final _ListItemBuilder<T>? listItemBuilder;

  /// The [headerBuilder] that will be used to build [CustomDropdown] header field.
  // ignore: library_private_types_in_public_api
  final _HeaderBuilder<T>? headerBuilder;

  /// The [hintBuilder] that will be used to build [CustomDropdown] hint of header field.
  // ignore: library_private_types_in_public_api
  final _HintBuilder? hintBuilder;

  /// The [noResultFoundBuilder] that will be used to build area when there's no search results match.
  // ignore: library_private_types_in_public_api
  final _NoResultFoundBuilder? noResultFoundBuilder;

  final _SearchType? _searchType;

  final bool isLoading, enable;

  final String? label;

  const CustomDropdown({
    super.key,
    required this.items,
    this.initialItem,
    this.hintText,
    this.searchHintText,
    this.noResultFoundText,
    this.errorStyle,
    this.closedErrorBorder,
    this.closedErrorBorderRadius,
    this.validator,
    this.validateOnChange = true,
    this.closedBorder,
    this.closedBorderRadius,
    this.expandedBorder,
    this.expandedBorderRadius,
    this.closedSuffixIcon,
    this.expandedSuffixIcon,
    this.listItemBuilder,
    this.headerBuilder,
    this.hintBuilder,
    this.onChanged,
    this.isLoading = false,
    this.maxlines = 1,
    this.canCloseOutsideBounds = true,
    this.hideSelectedFieldWhenExpanded = false,
    this.excludeSelected = false,
    this.closedFillColor = Colors.white,
    this.expandedFillColor = Colors.white,
    this.enable = true,
    this.label,
  })  : /*assert(
          items!.isNotEmpty,
          'Items list must contain at least one item.',
        ),*/
        /* assert(
          initialItem == null || items!.contains(initialItem),
          'Initial item must match with one of the item in items list.',
        ),*/
        _searchType = null,
        futureRequest = null,
        futureRequestDelay = null,
        noResultFoundBuilder = null;

  const CustomDropdown.search({
    super.key,
    required this.items,
    this.initialItem,
    this.hintText,
    this.searchHintText,
    this.noResultFoundText,
    this.listItemBuilder,
    this.headerBuilder,
    this.hintBuilder,
    this.noResultFoundBuilder,
    this.errorStyle,
    this.closedErrorBorder,
    this.closedErrorBorderRadius,
    this.validator,
    this.validateOnChange = true,
    this.closedBorder,
    this.closedBorderRadius,
    this.closedSuffixIcon,
    this.expandedSuffixIcon,
    this.expandedBorder,
    this.expandedBorderRadius,
    this.onChanged,
    this.isLoading = false,
    this.maxlines = 1,
    this.excludeSelected = true,
    this.canCloseOutsideBounds = true,
    this.hideSelectedFieldWhenExpanded = false,
    this.closedFillColor = Colors.white,
    this.expandedFillColor = Colors.white,
    this.enable = true,
    this.label,
  })  :
        /* assert(
          items!.isNotEmpty,
          'Items list must contain at least one item.',
        ),*/
        /* assert(
          initialItem == null || items!.contains(initialItem),
          'Initial item must match with one of the item in items list.',
        ),*/
        _searchType = _SearchType.onListData,
        futureRequest = null,
        futureRequestDelay = null;

  const CustomDropdown.searchRequest({
    super.key,
    required this.futureRequest,
    this.futureRequestDelay,
    this.initialItem,
    this.items,
    this.hintText,
    this.searchHintText,
    this.noResultFoundText,
    this.listItemBuilder,
    this.headerBuilder,
    this.hintBuilder,
    this.noResultFoundBuilder,
    this.errorStyle,
    this.closedErrorBorder,
    this.closedErrorBorderRadius,
    this.validator,
    this.validateOnChange = true,
    this.closedBorder,
    this.closedBorderRadius,
    this.expandedBorder,
    this.expandedBorderRadius,
    this.closedSuffixIcon,
    this.expandedSuffixIcon,
    this.onChanged,
    this.isLoading = false,
    this.maxlines = 1,
    this.excludeSelected = true,
    this.canCloseOutsideBounds = true,
    this.hideSelectedFieldWhenExpanded = false,
    this.closedFillColor = Colors.white,
    this.expandedFillColor = Colors.white,
    this.enable = true,
    this.label,
  }) : _searchType = _SearchType.onRequestData;

  @override
  State<CustomDropdown<T>> createState() => _CustomDropdownState<T>();
}

class _CustomDropdownState<T> extends State<CustomDropdown<T>> {
  final layerLink = LayerLink();
  late ValueNotifier<T?> selectedItemNotifier;

  @override
  void initState() {
    super.initState();
    // bool containInit = widget.initialItem != null && widget.items!.contains(widget.initialItem);
    selectedItemNotifier = ValueNotifier(widget.initialItem);
  }

  @override
  void dispose() {
    selectedItemNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final safeHintText = widget.hintText ?? _defaultHintValue;

    return FormField<T>(
      initialValue: selectedItemNotifier.value,
      validator: (val) {
        if (widget.validator != null) {
          return widget.validator!(val);
        }
        return null;
      },
      builder: (FormFieldState<T> formFieldState) {
        return InputDecorator(
          decoration: InputDecoration(
              fillColor: widget.closedFillColor,
              errorStyle: widget.errorStyle ?? _defaultErrorStyle,
              errorText: formFieldState.errorText,
              hintStyle: context.hintTextStyle,
              border: InputBorder.none,
              errorBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              contentPadding: const EdgeInsets.all(2)),
          child: Center(
            child: _OverlayBuilder(
              overlay: (size, hideCallback) {
                return _DropdownOverlay<T>(
                  isLoading: widget.isLoading,
                  onItemSelect: (T value) {
                    selectedItemNotifier.value = value;

                    if (widget.onChanged != null) {
                      widget.onChanged!(value);
                    }

                    formFieldState.didChange(value);

                    if (widget.validateOnChange) {
                      formFieldState.validate();
                    }
                  },
                  noResultFoundText: widget.noResultFoundText ?? LocaleKeys.not_available.tr(),
                  noResultFoundBuilder: widget.noResultFoundBuilder,
                  items: widget.items ?? [],
                  selectedItemNotifier: selectedItemNotifier,
                  size: size,
                  listItemBuilder: widget.listItemBuilder,
                  layerLink: layerLink,
                  hideOverlay: hideCallback,
                  headerBuilder: widget.headerBuilder,
                  hintText: safeHintText,
                  searchHintText: widget.searchHintText ?? 'البحث',
                  hintBuilder: widget.hintBuilder,
                  excludeSelected: widget.excludeSelected,
                  canCloseOutsideBounds: widget.canCloseOutsideBounds,
                  searchType: widget._searchType,
                  border: widget.expandedBorder,
                  borderRadius: widget.expandedBorderRadius,
                  futureRequest: widget.futureRequest,
                  futureRequestDelay: widget.futureRequestDelay,
                  hideSelectedFieldWhenOpen: widget.hideSelectedFieldWhenExpanded,
                  fillColor: widget.expandedFillColor,
                  suffixIcon: widget.expandedSuffixIcon,
                  maxlines: widget.maxlines,
                );
              },
              child: (showCallback) {
                return CompositedTransformTarget(
                  link: layerLink,
                  child: _DropDownField<T>(
                    onTap: showCallback,
                    enable: widget.enable,
                    errorBorderSide: BorderSide.none,
                    selectedItemNotifier: selectedItemNotifier,
                    border: formFieldState.hasError
                        ? widget.closedErrorBorder ?? _defaultErrorBorder
                        : widget.closedBorder ?? _defaultBorder,
                    borderRadius: formFieldState.hasError ? widget.closedErrorBorderRadius : widget.closedBorderRadius,
                    hintText: safeHintText,
                    hintBuilder: widget.hintBuilder,
                    headerBuilder: widget.headerBuilder,
                    suffixIcon: widget.closedSuffixIcon,
                    fillColor: !widget.enable ? Colors.white : widget.closedFillColor,
                    maxlines: widget.maxlines,
                  ),
                );
              },
            ),
          ),
        ).setTitle(context, title: widget.label, titleStyle: context.titleLarge!.s16);
      },
    );
  }
}
