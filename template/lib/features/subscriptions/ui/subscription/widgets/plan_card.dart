import 'package:flutter/material.dart';
import 'package:template/app/constants.dart';
import 'package:template/app/text_theme.dart';

class PlanCard extends StatelessWidget {
  const PlanCard({
    Key? key,
    required this.name,
    required this.buttonSubText,
    required this.price,
    required this.benefits,
    this.featured = false, required this.onTap,
    this.buttonText,
  }) : super(key: key);

  final String name;
  final String buttonSubText;
  final double price;
  final List<String> benefits;
  final bool featured;
  final Function onTap;
  final String? buttonText;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: featured ? Theme.of(context).colorScheme.primary : Colors.grey, width: featured ? 2 : 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(name, style: context.headlineSmall.onBackground),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('\$$price', style: context.displaySmall),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('USD', style: context.titleSmall.outline),
                  ),
                ],
              ),
              gap16,
              ...benefits
                  .map((e) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.check, size: 20),
                            gap8,
                            Expanded(
                              child: Text(
                                e,
                                style: context.titleMedium,
                              ),
                            ),
                          ],
                        ),
                      ))
                  .toList(),
              gap16,
              ElevatedButton(
                onPressed: () {
                  onTap();
                },
                child:  Text('Get Premium',
                style: context.titleLarge.onPrimary.bold,),
              ),
              Center(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(buttonSubText),
              ))
            ],
          ),
        ));
  }
}