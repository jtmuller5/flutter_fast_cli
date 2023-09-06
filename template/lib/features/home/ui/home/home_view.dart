import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:template/app/router.dart';
import 'package:template/app/services.dart';
import 'package:template/features/home/ui/chat/chat_view.dart';
import 'package:template/features/home/ui/home/widgets/drawer.dart';
import 'home_view_model.dart';

@RoutePage()
class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeViewModelBuilder(
      builder: (context, model) {
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
          body: const ChatView(),
        );
      },
    );
  }
}
