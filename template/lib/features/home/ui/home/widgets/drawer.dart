import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:template/app/router.dart';
import 'package:template/app/services.dart';
import 'package:template/features/shared/ui/app_logo.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              children: [
                DrawerHeader(
                    child: Center(
                  child: Image.asset('assets/images/logo.png'),
                )),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('Home'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('Profile'),
                  onTap: () {
                    router.popAndPush(const ProfileRoute());
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.star),
                  title: const Text('Subscriptions'),
                  onTap: () {
                    router.popAndPush(const SubscriptionRoute());
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.thumb_up),
                  title: const Text('Leave Feedback'),
                  onTap: () {
                    router.popAndPush(const NewFeedbackRoute());
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
              ],
            ),
          ),
          const AboutListTile(
            applicationName: 'Template',
            applicationIcon: AppLogo(),
            aboutBoxChildren: [
              Text('Template is a Flutter template.'),
            ],
          ),
          FutureBuilder(
            future: PackageInfo.fromPlatform(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('Version: ${snapshot.data!.version}'),
                );
              } else {
                return const SizedBox();
              }
            },
          )
        ],
      ),
    );
  }
}
