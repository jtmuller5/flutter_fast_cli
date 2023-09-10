import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutterfast/app/router.dart';
import 'package:flutterfast/app/services.dart';
import 'package:flutterfast/features/home/ui/home/widgets/feature_tile.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 8, crossAxisSpacing: 8),
      children: [
        //* Firebase *//
        FeatureTile(
          title: 'AI Chat',
          subtitle: '(Firebase Only)',
          child: const Icon(
            Icons.chat,
            size: 48,
          ),
          onTap: () {
            router.push(const ChatRoute());
          },
        ),
        //* Firebase *//
        //* RSS *//
        FeatureTile(
          title: 'RSS Feed',
          subtitle: 'All builds',
          child: const Icon(
            Icons.list_alt,
            size: 48,
          ),
          onTap: () {
            router.push(const RssRoute());
          },
        ),
        //* RSS *//
      ],
    );
  }
}
