import 'package:flutter/material.dart';
import 'package:flutterfast/app/router.dart';
import 'package:flutterfast/app/services.dart';
import 'package:flutterfast/features/home/ui/home/widgets/feature_tile.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2
      , mainAxisSpacing: 8, crossAxisSpacing: 8),
      children: [
        //* Firebase *//
        FeatureTile(
          title: 'AI Chat',
          subtitle: '(Firebase Only)',
          child: const Icon(Icons.chat, size: 48,),
          onTap: () {
            router.push(const ChatRoute());
          },
        ),
        //* Firebase *//
      ],
    );
  }
}
