import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutterfast_offline/app/router.dart';
import 'package:flutterfast_offline/app/services.dart';
import 'package:flutterfast_offline/features/home/ui/home/widgets/drawer.dart';
import 'package:flutterfast_offline/features/home/ui/home/widgets/home.dart';
import 'package:flutterfast_offline/modules/rss/ui/rss/rss_view.dart';

@RoutePage()
class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    if (!(sharedPrefs.getBool('onboarded') ?? false)) {
      router.replace(const OnboardingRoute());
    }
    super.initState();
  }

  int index = 0;

  void setIndex(int val) {
    setState(() => index = val);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              router.push(const SettingsRoute());
            },
          ),
        ],
      ),
      drawer: const HomeDrawer(),
      body: IndexedStack(
        index: index,
        children: const [
          Home(),
          RssView(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (index) {
          setIndex(index);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.rss_feed), label: 'Feed'),
        ],
      ),
    );
  }
}
