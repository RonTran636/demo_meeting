import 'package:flutter/material.dart';

enum AppSpacing {
  zero(0),
  small(8),
  medium(16),
  extraMedium(24),
  large(32),
  extraLarge(40);

  final double space;

  const AppSpacing(this.space);
}

class VerticalSpacer extends StatelessWidget {
  final double space;

  const VerticalSpacer._({
    Key? key,
    required this.space,
  }) : super(key: key);

  factory VerticalSpacer.zero() => VerticalSpacer._(space: AppSpacing.zero.space);

  factory VerticalSpacer.small() => VerticalSpacer._(space: AppSpacing.small.space);

  factory VerticalSpacer.medium() => VerticalSpacer._(space: AppSpacing.medium.space);

  factory VerticalSpacer.extraMedium() =>
      VerticalSpacer._(space: AppSpacing.extraMedium.space);

  factory VerticalSpacer.large() => VerticalSpacer._(space: AppSpacing.large.space);

  factory VerticalSpacer.extraLarge() =>
      VerticalSpacer._(space: AppSpacing.extraLarge.space);

  factory VerticalSpacer.custom({required double height}) =>
      VerticalSpacer._(space: height);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: space);
  }
}

class HorizontalSpacer extends StatelessWidget {
  final double space;

  const HorizontalSpacer._({
    Key? key,
    required this.space,
  }) : super(key: key);

  factory HorizontalSpacer.zero() => HorizontalSpacer._(space: AppSpacing.zero.space);

  factory HorizontalSpacer.small() => HorizontalSpacer._(space: AppSpacing.small.space);

  factory HorizontalSpacer.medium() => HorizontalSpacer._(space: AppSpacing.medium.space);

  factory HorizontalSpacer.extraMedium() =>
      HorizontalSpacer._(space: AppSpacing.extraMedium.space);

  factory HorizontalSpacer.large() => HorizontalSpacer._(space: AppSpacing.large.space);

  factory HorizontalSpacer.extraLarge() =>
      HorizontalSpacer._(space: AppSpacing.extraLarge.space);

  factory HorizontalSpacer.custom({required double width}) =>
      HorizontalSpacer._(space: width);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: space);
  }
}
