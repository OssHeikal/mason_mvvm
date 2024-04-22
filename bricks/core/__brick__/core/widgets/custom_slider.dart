import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({
    super.key,
    this.height,
    this.controller,
    this.onPageChanged,
    this.viewportFraction = 1,
    this.aspectRatio = 16 / 9,
    this.enableInfiniteScroll = true,
    this.reverse = false,
    this.autoPlay = true,
    this.autoPlayInterval = const Duration(seconds: 3),
    this.autoPlayAnimationDuration = const Duration(milliseconds: 800),
    this.autoPlayCurve = Curves.fastOutSlowIn,
    this.scrollDirection = Axis.horizontal,
    required this.itemCount,
    required this.itemBuilder,
  });

  final int itemCount;
  final double? height;
  final double viewportFraction;
  final double aspectRatio;
  final bool enableInfiniteScroll;
  final bool reverse;
  final bool autoPlay;
  final Duration autoPlayInterval;
  final Duration autoPlayAnimationDuration;
  final Curve autoPlayCurve;
  final CarouselController? controller;
  final Axis scrollDirection;
  final dynamic Function(int, CarouselPageChangedReason)? onPageChanged;
  final Widget Function(BuildContext context, int itemIndex, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: itemCount,
      itemBuilder: itemBuilder,
      carouselController: controller,
      options: CarouselOptions(
        height: height,
        onPageChanged: onPageChanged,
        aspectRatio: aspectRatio,
        viewportFraction: viewportFraction,
        initialPage: 0,
        enableInfiniteScroll: enableInfiniteScroll,
        reverse: reverse,
        autoPlay: autoPlay,
        autoPlayInterval: autoPlayInterval,
        autoPlayAnimationDuration: autoPlayAnimationDuration,
        autoPlayCurve: autoPlayCurve,
        scrollDirection: scrollDirection,
      ),
    );
  }
}
