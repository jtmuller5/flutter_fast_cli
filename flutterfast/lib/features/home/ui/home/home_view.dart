import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutterfast/app/constants.dart';
import 'package:flutterfast/app/router.dart';
import 'package:flutterfast/app/services.dart';
import 'package:flutterfast/app/theme.dart';
import 'package:flutterfast/features/home/ui/home/widgets/drawer.dart';
import 'package:flutterfast/features/home/ui/home/widgets/rail.dart';
import 'package:flutterfast/modules/chat/ui/chat/chat_view.dart';
import 'package:flutterfast/modules/rss/ui/rss/rss_view.dart';

@RoutePage()
class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int index = 0;

  void setIndex(int val) {
    setState(() => index = val);
  }

  @override
  void initState() {
    userService.getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      bool smallScreen = constraints.maxWidth < Breakpoints.md;
      bool mediumScreen = constraints.maxWidth >= Breakpoints.md;
      bool largeScreen = constraints.maxWidth >= Breakpoints.lg;
      bool xlScreen = constraints.maxWidth >= Breakpoints.xl;

      return DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: mediumScreen ? null : HomeDrawer(wideScreen: largeScreen),
          appBar: !smallScreen ? null : AppBar(),
          body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (xlScreen) ...[const HomeDrawer(), VerticalDivider(width: 2)],
              if (mediumScreen && !xlScreen) ...[HomeRail(), VerticalDivider(width: 2)],
              Flexible(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 1200),
                  child: Column(
                    children: [
                      TabBar(
                        tabs: [
                          const Tab(
                            // icon: Icon(Icons.home),
                            text: 'Chat',
                          ),
                          const Tab(
                            //icon: Icon(Icons.rss_feed),
                            text: 'Feed',
                          ),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: const [
                            ChatView(),
                            RssView(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (mediumScreen && !xlScreen) ...[VerticalDivider(width: 2), SizedBox(width: 200)],
              if (xlScreen) ...[VerticalDivider(width: 2), SizedBox(width: 400)]
            ],
          ),
          /* bottomNavigationBar: BottomNavigationBar(
            currentIndex: index,
            backgroundColor: context.primaryContainer,
            onTap: (index) {
              setIndex(index);
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.rss_feed), label: 'Feed'),
            ],
          ), */
        ),
      );
    });
  }
}
