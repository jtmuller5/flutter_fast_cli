import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutterfast_online_auth/app/router.dart';
import 'package:flutterfast_online_auth/app/services.dart';

class HomeRail extends StatefulWidget {
  const HomeRail({super.key});

  @override
  State<HomeRail> createState() => _HomeRailState();
}

class _HomeRailState extends State<HomeRail> {
  int index = 0;

  final List<Map<String, dynamic>> destinations = [
    {
      'icon': const Icon(Icons.person),
      'label': const Text('Profile'),
      'route': const ProfileRoute(),
    },
    {
      'icon': const Icon(Icons.thumb_up),
      'label': const Text('Leave Feedback'),
      'route': NewFeedbackRoute(),
    },
    {
      'icon': const Icon(Icons.visibility),
      'label': const Text('View Feedback'),
      'route': const FeedbackRoute(),
    },
    {
      'icon': const Icon(Icons.settings),
      'label': const Text('Settings'),
      'route': const SettingsRoute(),
    },
    //* Subscriptions *//
    {
      'icon': const Icon(Icons.star),
      'label': const Text('Subscriptions'),
      'route': const SubscriptionRoute(),
    }
    //* Subscriptions *//
  ];

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      destinations: destinations
          .map((e) => NavigationRailDestination(
                icon: e['icon'],
                label: e['label'],
              ))
          .toList(),
      selectedIndex: index,
      onDestinationSelected: (value) {
        setState(() {
          index = value;
        });

        router.popAndPush(destinations[index]['route'] as PageRouteInfo);
      },
    );
  }
}
