import 'package:flutterfast_offline/app/constants.dart';
import 'package:flutterfast_offline/app/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Find the flutter_fast_cli on pub.dev',
              textAlign: TextAlign.center,
              style: context.headlineSmall,
            ).animate(effects: [const FadeEffect(delay: Duration(milliseconds: 300))]),
            gap16,
            const Text('💙')
          ],
        ),
      ),
    );
  }
}
