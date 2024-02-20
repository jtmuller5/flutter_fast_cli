import 'package:flutter/material.dart';
import 'package:flutterfast/app/router.dart';
import 'package:flutterfast/app/services.dart';

class HomeRail extends StatefulWidget {
  const HomeRail({super.key});

  @override
  State<HomeRail> createState() => _HomeRailState();
}

class _HomeRailState extends State<HomeRail> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      destinations: [
        NavigationRailDestination(
          icon: const Icon(Icons.person),
          label: const Text('Profile'),
        ),
        NavigationRailDestination(
          icon: const Icon(Icons.star),
          label: const Text('Subscriptions'),
        ),
        NavigationRailDestination(
          icon: const Icon(Icons.thumb_up),
          label: const Text('Leave Feedback'),
        ),
        NavigationRailDestination(
          icon: const Icon(Icons.visibility),
          label: const Text('View Feedback'),
        ),
        NavigationRailDestination(
          icon: const Icon(Icons.settings),
          label: const Text('Settings'),
        ),
      ],
      selectedIndex: index,
      onDestinationSelected: (value) {
        setState(() {
          index = value;
        });

        if (index == 0) {
          router.popAndPush(const ProfileRoute());
        } else if (index == 1) {
          router.popAndPush(const SubscriptionRoute());
        } else if (index == 2) {
          router.popAndPush(NewFeedbackRoute());
        } else if (index == 3) {
          router.popAndPush(const FeedbackRoute());
        } else if (index == 4) {
          router.popAndPush(const SettingsRoute());
        }
      },
    );
  }
}
