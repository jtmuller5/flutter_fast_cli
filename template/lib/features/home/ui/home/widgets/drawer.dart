import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:template/app/router.dart';
import 'package:template/app/services.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                DrawerHeader(child: Center(child: Image.asset('assets/images/logo.png'),)),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('Home'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.star),
                  title: const Text('Profile'),
                  onTap: () {
                    router.push(const ProfileRoute());
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.star),
                  title: const Text('Subscriptions'),
                  onTap: () {
                    router.push(const SubscriptionRoute());
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
          FutureBuilder(future: PackageInfo.fromPlatform(), builder: (context, snapshot) {
            if(snapshot.hasData) {
              return Text('Version: ${snapshot.data!.version}');
            } else {
              return const SizedBox();
            }
          },)
        ],
      ),
    );
  }
}
