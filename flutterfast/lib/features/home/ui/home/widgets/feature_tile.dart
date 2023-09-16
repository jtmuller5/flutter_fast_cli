import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutterfast/app/text_theme.dart';
import 'package:flutterfast/app/theme.dart';

class FeatureTile extends StatelessWidget {
  const FeatureTile(
      {Key? key,
      required this.title,
      this.subtitle,
      this.onTap,
      required this.child})
      : super(key: key);

  final String title;
  final String? subtitle;
  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: const [ScaleEffect(begin: Offset(.8, .8))],
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(
            color: context.tertiaryContainer,
            child: InkWell(
              onTap: onTap,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(child: child),
                  ListTile(
                    title: Text(
                      title,
                      style: context.titleMedium.onBackground,
                    ),
                    subtitle: subtitle != null
                        ? Text(
                            subtitle!,
                            style: context.bodyMedium.onBackground,
                          )
                        : null,
                    tileColor: context.background,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
