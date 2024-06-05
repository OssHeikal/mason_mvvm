// Widget Extensions

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../resources/dimensions_manager.dart';
import '../router/page_transition.dart';
import '../theme/light_theme.dart';
import 'all_extensions.dart';

Duration transitionDuration = const Duration(milliseconds: 300);

extension WidgetExtension on Widget {
  /// set container to view
  Container setContainerToView({
    double? height,
    double? width,
    double? margin,
    double? padding,
    double? radius,
    Color? color,
    Color? borderColor,
    AlignmentGeometry? alignment,
    List<BoxShadow>? shadows,
  }) {
    return Container(
      width: width,
      height: height,
      alignment: alignment,
      margin: EdgeInsets.all(margin ?? 0),
      padding: EdgeInsets.all(padding ?? AppSize.s0.r),
      decoration: ShapeDecoration(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius ?? 0)),
          side: borderColor != null ? BorderSide(color: borderColor, width: AppSize.s1.w) : BorderSide.none,
        ),
        shadows: shadows,
      ),
      child: this,
    );
  }

  CircleAvatar circle({
    double radius = AppSize.s24,
    double borderWidth = 0,
    Color? backgroundColor,
    Color? borderColor,
    Widget? child,
  }) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: backgroundColor,
      foregroundColor: borderColor,
      child: child ?? this,
    );
  }

  ClipRRect withGlassEffect({
    double? height,
    double? width,
    Color? color,
    bool hasBorder = true,
    double radius = AppSize.s16,
    double padding = AppSize.s0,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius.r),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 25.0, sigmaY: 25.0),
        child: Container(
          height: height ?? AppSize.s60.h,
          width: width,
          padding: EdgeInsets.all(padding),
          decoration: BoxDecoration(
            color: color ?? Colors.white.withOpacity(0.4),
            borderRadius: BorderRadius.circular(radius.r),
            border: hasBorder ? Border.all(color: color ?? Colors.white.withOpacity(0.6), width: AppSize.s1.w) : null,
          ),
          child: this,
        ),
      ),
    );
  }

  Widget setTitle(
    BuildContext context, {
    String? title,
    Widget? titleIcon,
    double? fontSize,
    TextStyle? titleStyle,
    double gap = AppSize.s12,
    double titlePadding = AppSize.s0,
  }) {
    return title != null
        ? Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(title, style: titleStyle ?? context.titleMedium!.bold.s12).paddingHorizontal(titlePadding),
              titleIcon ?? const SizedBox.shrink()
            ]),
            gap.h.verticalSpace,
            this
          ])
        : this;
  }

  Widget setSvgToView({
    required String svgPath,
    Color? color,
    double size = AppSize.s24,
    double gap = AppSize.s8,
    bool isEnd = false,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (isEnd) this,
        if (isEnd) gap.w.horizontalSpace,
        svgPath.toSvg(color: color, height: size, width: size),
        if (!isEnd) gap.w.horizontalSpace,
        if (!isEnd) this,
      ],
    );
  }

  /// set visibility
  Widget visible(bool visible, {Widget? fallback}) {
    return visible ? this : (fallback ?? const SizedBox.shrink());
  }

  Widget setBorder(
    BuildContext context, {
    double? width,
    Color? color,
    double radius = 0,
    double padding = 0,
  }) {
    return Container(
      padding: padding.edgeInsetsAll.w,
      decoration: BoxDecoration(
        border: Border.all(color: color ?? context.inputFieldBorderColor, width: width ?? 1),
        borderRadius: BorderRadius.circular(radius),
      ),
      child: this,
    );
  }

  Widget setCircleBorder(
    BuildContext context, {
    double? width,
    Color? color,
    double padding = 0,
  }) {
    return Container(
      padding: padding.edgeInsetsAll.w,
      decoration: BoxDecoration(
        border: Border.all(color: color ?? context.inputFieldBorderColor, width: width ?? 1),
        shape: BoxShape.circle,
      ),
      child: this,
    );
  }

  /// add custom corner radius each side
  ClipRRect cornerRadiusWithClipRRectOnly({
    double bottomLeft = 0,
    double bottomRight = 0,
    double topLeft = 0,
    double topRight = 0,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(bottomLeft.toDouble()),
        bottomRight: Radius.circular(bottomRight.toDouble()),
        topLeft: Radius.circular(topLeft.toDouble()),
        topRight: Radius.circular(topRight.toDouble()),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: this,
    );
  }

  /// add corner radius
  ClipRRect cornerRadiusWithClipRRect(double radius) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: this,
    );
  }

  ClipRRect cornerRadiusWithClipRRectTop(double radius) {
    return ClipRRect(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(radius), topRight: Radius.circular(radius)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: this,
    );
  }

  ClipRRect cornerRadiusWithClipRRectBottom(double radius) {
    return ClipRRect(
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(radius), bottomRight: Radius.circular(radius)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: this,
    );
  }

  ClipRRect cornerRadiusWithClipRRectOnlyWithBorder({
    double bottomLeft = 0,
    double bottomRight = 0,
    double topLeft = 0,
    double topRight = 0,
    Color? borderColor,
    double borderWidth = 1,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(bottomLeft.toDouble()),
        bottomRight: Radius.circular(bottomRight.toDouble()),
        topLeft: Radius.circular(topLeft.toDouble()),
        topRight: Radius.circular(topRight.toDouble()),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: borderColor ?? Colors.transparent, width: borderWidth),
        ),
        child: this,
      ),
    );
  }

  /// set parent widget in center
  Widget center({double? heightFactor, double? widthFactor, bool enabled = true}) {
    return enabled ? Center(heightFactor: heightFactor, widthFactor: widthFactor, child: this) : this;
  }

  /// add tap to parent widget
  Widget onTap(
    void Function()? function, {
    Color? splashColor,
    Color? hoverColor,
    Color? highlightColor,
    BorderRadius? borderRadius,
  }) {
    return InkWell(
      onTap: function,
      splashColor: splashColor,
      hoverColor: hoverColor,
      highlightColor: highlightColor,
      borderRadius: borderRadius,
      // overlayColor: MaterialStateProperty.all(Colors.transparent),
      child: this,
    );
  }

  /// Wrap with ShaderMask widget
  Widget withShaderMask(List<Color> colors, {BlendMode blendMode = BlendMode.srcATop}) {
    return withShaderMaskGradient(LinearGradient(colors: colors), blendMode: blendMode);
  }

  /// Wrap with ShaderMask widget Gradient
  Widget withShaderMaskGradient(Gradient gradient, {BlendMode blendMode = BlendMode.srcATop}) {
    return ShaderMask(shaderCallback: (rect) => gradient.createShader(rect), blendMode: blendMode, child: this);
  }

  /// Validate given widget is not null and returns given value if null.
  Widget validate({Widget value = const SizedBox()}) => this;

  Widget buildWhen(bool value) => value ? this : const SizedBox.shrink();

  Widget withTooltip({required String msg}) => Tooltip(message: msg, child: this);

  Widget withSafeArea({EdgeInsets? minimum}) => SafeArea(minimum: minimum ?? EdgeInsets.zero, child: this);

  /// Make your any widget refreshable with RefreshIndicator on top
  // Widget get makeRefreshable => Stack(children: [ListView(), this]);
  RefreshIndicator makeRefreshable(Future<void> Function() onRefresh, {EdgeInsetsGeometry? padding}) {
    return RefreshIndicator(
      displacement: AppSize.s20.sp,
      backgroundColor: LightThemeColors.scaffoldBackground,
      color: LightThemeColors.primary,
      onRefresh: () {
        HapticFeedback.vibrate();
        return onRefresh();
      },
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: padding ?? const EdgeInsets.only(bottom: AppSize.bottomNavBarHeight),
        children: [this],
      ),
    );
  }

  Widget withShimmer({
    Duration duration = const Duration(seconds: 1),
    Color baseColor = Colors.grey,
    Color highlightColor = Colors.grey,
    bool buildWhen = true,
  }) {
    if (!buildWhen) return this;
    if (this is SizedBox) {
      return SizedBox(
        width: (this as SizedBox).width,
        height: (this as SizedBox).height,
        child: Shimmer.fromColors(
          period: duration,
          baseColor: baseColor.withOpacity(0.1),
          highlightColor: highlightColor.withOpacity(0.25),
          child: this,
        ),
      );
    } else if (this is CircleAvatar) {
      return CircleAvatar(
        radius: (this as CircleAvatar).radius,
        backgroundColor: Colors.transparent,
        child: Shimmer.fromColors(
          period: duration,
          baseColor: baseColor.withOpacity(0.1),
          highlightColor: highlightColor.withOpacity(0.25),
          child: this,
        ),
      );
    } else {
      return Shimmer.fromColors(
        period: duration,
        baseColor: baseColor.withOpacity(0.1),
        highlightColor: highlightColor.withOpacity(0.25),
        child: this,
      );
    }
  }
}

extension PaddingExtension on Widget {
  /// return padding top
  Padding paddingTop(double top) {
    return Padding(padding: EdgeInsets.only(top: top), child: this);
  }

  /// return padding left
  Padding paddingLeft(double left) {
    return Padding(padding: EdgeInsets.only(left: left), child: this);
  }

  /// return padding Directional
  Padding paddingStart(double start) {
    return Padding(padding: EdgeInsetsDirectional.only(start: start), child: this);
  }

  Padding paddingEnd(double end) {
    return Padding(padding: EdgeInsetsDirectional.only(end: end), child: this);
  }

  /// return padding right
  Padding paddingRight(double right) {
    return Padding(padding: EdgeInsets.only(right: right), child: this);
  }

  /// return padding bottom
  Padding paddingBottom(double bottom) {
    return Padding(padding: EdgeInsets.only(bottom: bottom), child: this);
  }

  /// return padding all
  Padding paddingAll(double padding) {
    return Padding(padding: EdgeInsets.all(padding), child: this);
  }

  /// return padding Symmetric
  Padding paddingSymmetric(double horizontal, double vertical) {
    return Padding(padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal), child: this);
  }

  Padding paddingVertical(double padding) {
    return Padding(padding: EdgeInsets.symmetric(vertical: padding), child: this);
  }

  Padding paddingHorizontal(double padding) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: padding), child: this);
  }

  /// return custom padding from each side
  Padding paddingOnly({double top = 0.0, double left = 0.0, double bottom = 0.0, double right = 0.0}) {
    return Padding(padding: EdgeInsets.fromLTRB(left, top, right, bottom), child: this);
  }

  Padding paddingDirectionalOnly({double top = 0.0, double start = 0.0, double bottom = 0.0, double end = 0.0}) {
    return Padding(padding: EdgeInsetsDirectional.only(top: top, bottom: bottom, start: start, end: end), child: this);
  }

  Padding paddingDirectionalAll({double padding = 0}) {
    return Padding(padding: EdgeInsetsDirectional.all(padding), child: this);
  }
}

/// Extension on Widget to provide additional functionality related to routing.
extension RouterExtension on Widget {
  /// Builds a page with optional transition and duration.
  ///
  /// - The [transition] parameter specifies the page transition animation to be used.
  /// - The [duration] parameter specifies the duration of the transition animation.
  ///
  /// Returns a [Page] object representing the built page.
  Page<dynamic> buildPage({PageTransitions? transition, Duration? duration}) {
    if (transition != null && transition == PageTransitions.cupertino) {
      return CupertinoPage<dynamic>(child: this);
    } else {
      return customTransitionPage(this, transition, duration);
    }
  }

  Widget withBlocProvider<T extends Cubit<Object>>(T bloc) => BlocProvider<T>.value(value: bloc, child: this);
}

/// Extension on the [Widget] class to provide additional layout-related functionality.
extension LayoutExtensions on Widget {
  /// With custom width
  SizedBox withWidth(double width) => SizedBox(width: width, child: this);

  /// With custom height
  SizedBox withHeight(double height) => SizedBox(height: height, child: this);

  /// With custom height and width
  SizedBox withSize(double width, double height) => SizedBox(width: width, height: height, child: this);

  ///scrollable
  Widget scrollable({
    EdgeInsets? padding,
    bool primary = true,
    bool reverse = false,
    ScrollPhysics? physics,
  }) {
    return SingleChildScrollView(
      primary: primary,
      padding: padding ?? EdgeInsets.symmetric(horizontal: AppSize.screenPadding, vertical: AppSize.s16.h),
      physics: physics ?? const AlwaysScrollableScrollPhysics(),
      reverse: reverse,
      child: this,
    );
  }

  /// add Expanded to parent widget
  Widget expand({flex = 1}) => Expanded(flex: flex, child: this);

  /// add Flexible to parent widget
  Widget flexible({flex = 1, FlexFit? fit, bool buildWhen = true}) {
    return buildWhen ? Flexible(flex: flex, fit: fit ?? FlexFit.loose, child: this) : this;
  }

  /// add FittedBox to parent widget
  Widget fit({BoxFit? fit, AlignmentGeometry? alignment}) {
    return FittedBox(fit: fit ?? BoxFit.contain, alignment: alignment ?? Alignment.center, child: this);
  }

  SliverToBoxAdapter toSliver() => SliverToBoxAdapter(child: this);

  Directionality withDirectionality(TextDirection textDirection) {
    return Directionality(textDirection: textDirection, child: this);
  }
}

extension TransformExtension on Widget {
  /// add rotation to parent widget
  Widget rotate({required double angle, bool transformHitTests = true, Offset? origin}) {
    return Transform.rotate(origin: origin, angle: angle.toRadians, transformHitTests: transformHitTests, child: this);
  }

  //rotate with animation to parent widget
  Widget rotateWithAnimation({required double angle}) {
    return RotationTransition(
      turns: AlwaysStoppedAnimation(angle / 360),
      filterQuality: FilterQuality.high,
      child: this,
    );
  }

  /// add scaling to parent widget
  Widget scale({required double scale, Offset? origin, AlignmentGeometry? alignment, bool transformHitTests = true}) {
    return Transform.scale(
      scale: scale,
      origin: origin,
      alignment: alignment,
      transformHitTests: transformHitTests,
      child: this,
    );
  }

  /// add translate to parent widget
  Widget translate({required Offset offset, bool transformHitTests = true, Key? key}) {
    return Transform.translate(offset: offset, transformHitTests: transformHitTests, key: key, child: this);
  }
}

extension AnimationExtension on Widget {
  Widget setHero(String heroKey) => Hero(tag: heroKey, child: Material(color: Colors.transparent, child: this));

  /// add opacity to parent widget
  Widget opacity({required double opacity, int durationInSecond = 1, Duration? duration}) {
    return AnimatedOpacity(opacity: opacity, duration: duration ?? const Duration(milliseconds: 500), child: this);
  }

  /// Validate given widget is not null and returns given value if null.
  Widget animationSwitch() {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      child: this,
    );
  }

  Widget setAnimatedContainer({Duration? duration, double? width, double? hight}) {
    return AnimatedContainer(
      width: width,
      height: hight,
      curve: Curves.fastOutSlowIn,
      duration: duration ?? const Duration(seconds: 5),
      child: this,
    );
  }
}

extension TextEx on Text {
  /// add tap to text widget
  Widget clickable({
    required void Function() onTap,
    Color splashColor = Colors.transparent,
    Color highlightColor = Colors.transparent,
    BorderRadius? borderRadius,
    EdgeInsets? padding,
    double paddingValue = 0.0,
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.w400,
    Color? color,
    TextStyle? style,
  }) {
    final ValueNotifier<bool> highlighted = ValueNotifier<bool>(false);
    return ValueListenableBuilder(
      valueListenable: highlighted,
      builder: (context, value, child) {
        return InkWell(
          onTap: onTap,
          splashColor: value ? splashColor.withOpacity(0.5) : splashColor,
          highlightColor: value ? highlightColor.withOpacity(0.5) : highlightColor,
          borderRadius: borderRadius,
          onTapDown: (details) => highlighted.value = true,
          onTapUp: (details) => highlighted.value = false,
          onTapCancel: () => highlighted.value = false,
          child: AnimatedDefaultTextStyle(
            curve: Curves.easeInOut,
            duration: const Duration(milliseconds: 100),
            style: style?.copyWith(color: value ? style.color?.withOpacity(0.5) : style.color) ??
                context.displayLarge!.copyWith(
                  fontSize: fontSize.sp,
                  fontWeight: fontWeight,
                  color: value ? context.primaryColor.withOpacity(0.5) : context.primaryColor,
                ),
            child: Padding(
              padding: padding ?? EdgeInsets.all(paddingValue),
              child: this,
            ),
          ),
        );
      },
    );
  }
}

extension ColorEx on Color {
  ColorFilter get colorFilter => ColorFilter.mode(this, BlendMode.srcIn);
}
