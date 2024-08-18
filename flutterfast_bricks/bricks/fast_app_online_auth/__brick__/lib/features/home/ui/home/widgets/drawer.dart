import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:{{ name }}/app/config.dart';
import 'package:{{ name }}/app/constants.dart';
import 'package:{{ name }}/app/text_theme.dart';
import 'package:{{ name }}/app/theme.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:{{ name }}/app/router.dart';
import 'package:{{ name }}/app/services.dart';
import 'package:{{ name }}/features/shared/ui/app_logo.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key, this.wideScreen = false}) : super(key: key);

  final bool wideScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: wideScreen ? Colors.transparent : context.background,
      elevation: 0,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(
                children: [
                  DrawerHeader(
                    child: Center(
                      child: Image.asset('assets/logo.png'),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text('Profile'),
                    onTap: () {
                      router.popAndPush(const ProfileRoute());
                    },
                  ),
                  //* Subscriptions *//
                  ListTile(
                    leading: const Icon(Icons.star),
                    title: const Text('Subscriptions'),
                    onTap: () {
                      router.popAndPush(const SubscriptionRoute());
                    },
                  ),
                  //* Subscriptions *//
                  ListTile(
                    leading: const Icon(Icons.thumb_up),
                    title: const Text('Leave Feedback'),
                    onTap: () {
                      router.popAndPush(NewFeedbackRoute());
                    },
                  ),
                  if (kDebugMode)
                    ListTile(
                      leading: const Icon(Icons.visibility),
                      title: const Text('View Feedback'),
                      subtitle: const Text('Debug only'),
                      onTap: () {
                        router.popAndPush(const FeedbackRoute());
                      },
                    ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Settings'),
                    onTap: () {
                      router.push(const SettingsRoute());
                    },
                  ),
                ],
              ),
            ),
            const AboutListTile(
              applicationName: '{{ name }}',
              dense: true,
              applicationIcon: AppLogo(sideLength: 48),
              aboutBoxChildren: [
                Text('{{ name }} is a Flutter application.'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      launchUrl(Uri.parse(Config.privacyPolicy));
                    },
                    child: Text(
                      'Privacy Policy',
                      style: context.bodySmall,
                    ),
                  ),
                  gap8,
                  GestureDetector(
                    onTap: () {
                      launchUrl(Uri.parse(Config.termsOfService));
                    },
                    child: Text(
                      'Terms of Service',
                      style: context.bodySmall,
                    ),
                  ),
                  gap8,
                  FutureBuilder(
                    future: PackageInfo.fromPlatform(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text(
                          'Version: ${snapshot.data!.version}',
                          style: context.bodySmall,
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
