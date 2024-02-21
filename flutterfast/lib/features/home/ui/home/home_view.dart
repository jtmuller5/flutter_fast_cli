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
      bool xsmallScreen = constraints.maxWidth <= Breakpoints.xs;
      bool smallScreen = constraints.maxWidth >= Breakpoints.xs && constraints.maxWidth < Breakpoints.sm;
      bool mediumScreen = constraints.maxWidth >= Breakpoints.sm && constraints.maxWidth < Breakpoints.md;
      bool largeScreen = constraints.maxWidth >= Breakpoints.md && constraints.maxWidth < Breakpoints.lg;
      bool xlargeScreen = constraints.maxWidth >= Breakpoints.lg;

      return DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: xsmallScreen ? HomeDrawer() : null,
          appBar: xsmallScreen ? AppBar() : null,
          body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (largeScreen || xlargeScreen) ...[const HomeDrawer(), VerticalDivider(width: 2)],
              if (smallScreen || mediumScreen) ...[HomeRail(), VerticalDivider(width: 2)],
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
              if (smallScreen || mediumScreen) ...[VerticalDivider(width: 2), SizedBox(width: 200)],
              if (largeScreen || xlargeScreen) ...[VerticalDivider(width: 2), SizedBox(width: 400)]
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
