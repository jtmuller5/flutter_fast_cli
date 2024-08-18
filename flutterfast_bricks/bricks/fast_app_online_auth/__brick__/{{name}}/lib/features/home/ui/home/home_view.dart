import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:{{ name }}/app/constants.dart';
import 'package:{{ name }}/app/services.dart';
import 'package:{{ name }}/features/home/ui/home/widgets/drawer.dart';
import 'package:{{ name }}/features/home/ui/home/widgets/rail.dart';
import 'package:{{ name }}/modules/chat/ui/chat/chat_view.dart';

@RoutePage()
class HomeView extends StatefulWidget {
  const HomeView({super.key});

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

      return Scaffold(
        drawer: xsmallScreen ? const HomeDrawer() : null,
        appBar: xsmallScreen ? AppBar() : null,
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (largeScreen || xlargeScreen) ...[
              const HomeDrawer(),
              const VerticalDivider(width: 2),
            ],
            if (smallScreen || mediumScreen) ...[
              const HomeRail(),
              const VerticalDivider(width: 2),
            ],
            Flexible(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: const Column(
                  children: [
                    Expanded(
                      child: ChatView(),
                    ),
                  ],
                ),
              ),
            ),
            if (smallScreen || mediumScreen) ...[
              const VerticalDivider(width: 2),
              const SizedBox(width: 200),
            ],
            if (largeScreen || xlargeScreen) ...[
              const VerticalDivider(width: 2),
              const SizedBox(width: 400),
            ]
          ],
        ),
      );
    });
  }
}
