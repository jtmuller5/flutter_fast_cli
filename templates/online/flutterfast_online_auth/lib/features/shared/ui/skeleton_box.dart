import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutterfast_online_auth/app/theme.dart';

class SkeletonBox extends StatelessWidget {
  const SkeletonBox({super.key, required this.height, required this.width});

  final double height;

  final double width;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: SizedBox(
        height: height,
        width: width,
        child: Align(
          alignment: Alignment.topLeft,
          child: ColoredBox(
            color: context.surface,
            child: SizedBox(height: height, width: width),
          ),
        ).animate(
          onPlay: (controller) => controller.repeat(),
          effects: [
            ShimmerEffect(
              angle: 45,
              size: .8,
              delay: Duration.zero,
              duration: const Duration(seconds: 3),
              blendMode: BlendMode.srcIn,
              color: context.onSurface,
            )
          ],
        ),
      ),
    );
  }
}
