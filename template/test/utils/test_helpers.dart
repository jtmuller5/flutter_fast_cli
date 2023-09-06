import 'package:flutter/material.dart';

/// Screen sizes taken from here: https://mediag.com/blog/popular-screen-resolutions-designing-for-all/
class TestingWrapper extends StatelessWidget {
  const TestingWrapper(
    this.child, {
    super.key,
    this.size = const Size(1080, 1920),
  });

  const TestingWrapper.small(
    this.child, {
    super.key,
    this.size = const Size(640, 1136),
  });

  const TestingWrapper.large(
    this.child, {
    super.key,
    this.size = const Size(1536, 2048),
  });

  final Size size;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('en'),
      home: mediaWidget(),
    );
  }

  Widget mediaWidget() {
    return MediaQuery(
      data: MediaQueryData(size: size),
      child: Material(child: child),
    );
  }
}
