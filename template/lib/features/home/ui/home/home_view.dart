import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
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
          ),
          drawer: const HomeDrawer(),
          body: Center(
            child: Text('Home'),
          ),
        );
      },
    );
  }
}
