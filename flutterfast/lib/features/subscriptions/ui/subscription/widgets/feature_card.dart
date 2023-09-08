import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class FeatureCard extends StatelessWidget {
  const FeatureCard({Key? key, required this.asset, required this.title, required this.description}) : super(key: key);

  final String asset;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Center(
          child: FadeInImage(
            image: AssetImage(asset),
            height: 300,
            placeholder: MemoryImage(
              kTransparentImage,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text(description, style: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
        ),
      ]),
    );
  }
}
