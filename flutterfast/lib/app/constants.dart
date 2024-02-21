import 'package:flutter/widgets.dart';

SizedBox gap(double size) => SizedBox(height: size, width: size);

SizedBox hgap(double size) => SizedBox(width: size);

SizedBox vgap(double size) => SizedBox(height: size);

const SizedBox gap4 = SizedBox(height: 4, width: 4);
const SizedBox gap8 = SizedBox(height: 8, width: 8);
const SizedBox gap12 = SizedBox(height: 12, width: 12);
const SizedBox gap16 = SizedBox(height: 16, width: 16);
const SizedBox gap24 = SizedBox(height: 24, width: 24);
const SizedBox gap32 = SizedBox(height: 32, width: 32);
const SizedBox gap48 = SizedBox(height: 48, width: 48);

const EdgeInsets p4 = EdgeInsets.all(4);
const EdgeInsets p8 = EdgeInsets.all(8);
const EdgeInsets p12 = EdgeInsets.all(12);
const EdgeInsets p16 = EdgeInsets.all(16);
const EdgeInsets p24 = EdgeInsets.all(24);
const EdgeInsets p32 = EdgeInsets.all(32);
const EdgeInsets p48 = EdgeInsets.all(48);

const EdgeInsets px4 = EdgeInsets.symmetric(horizontal: 4);
const EdgeInsets px8 = EdgeInsets.symmetric(horizontal: 8);
const EdgeInsets px12 = EdgeInsets.symmetric(horizontal: 12);
const EdgeInsets px16 = EdgeInsets.symmetric(horizontal: 16);
const EdgeInsets px24 = EdgeInsets.symmetric(horizontal: 24);
const EdgeInsets px32 = EdgeInsets.symmetric(horizontal: 32);
const EdgeInsets px48 = EdgeInsets.symmetric(horizontal: 48);

const EdgeInsets py4 = EdgeInsets.symmetric(vertical: 4);
const EdgeInsets py8 = EdgeInsets.symmetric(vertical: 8);
const EdgeInsets py12 = EdgeInsets.symmetric(vertical: 12);
const EdgeInsets py16 = EdgeInsets.symmetric(vertical: 16);
const EdgeInsets py24 = EdgeInsets.symmetric(vertical: 24);
const EdgeInsets py32 = EdgeInsets.symmetric(vertical: 32);
const EdgeInsets py48 = EdgeInsets.symmetric(vertical: 48);

extension SliverExtension on Widget {
  Widget sliver() => SliverToBoxAdapter(child: this);
}

// https://m2.material.io/design/layout/responsive-layout-grid.html#breakpoints
class Breakpoints {
  static const double xs = 600.0; // Extra-small (phone)
  static const double sm = 905.0; // Small (tablet)
  static const double md = 1240.0; // Medium (laptop)
  static const double lg = 1440.0; // Large (desktop)
  static const double xl = 1920.0; // Extra-large (large desktop)
}

extension Margins on BuildContext {
  double get margin {
    final dpr = MediaQuery.of(this).devicePixelRatio;
    final width = MediaQuery.of(this).size.width / dpr;
    if (width < Breakpoints.xs) {
      return 16;
    } else if (width < Breakpoints.sm) {
      return 32;
    } else if (width < Breakpoints.md) {
      return 32;
    } else if (width < Breakpoints.lg) {
      return 200;
    } else {
      return 0;
    }
  }

  Widget marginBox(Widget child) {
    return Padding(
      padding: EdgeInsets.all(margin),
      child: child,
    );
  }
}