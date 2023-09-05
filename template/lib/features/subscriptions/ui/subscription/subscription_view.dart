import 'dart:io';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:template/app/constants.dart';
import 'package:template/app/services.dart';
import 'package:template/features/subscriptions/ui/subscription/widgets/feature_card.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:url_launcher/url_launcher.dart';
import 'subscription_view_model.dart';

@RoutePage()
class SubscriptionView extends StatelessWidget {
  const SubscriptionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SubscriptionViewModelBuilder(
      builder: (context, model) {
        return ValueListenableBuilder(
            valueListenable: subscriptionService.premium,
            builder: (context, premium, child) {
              if (premium) {
                return Scaffold(
                  appBar: AppBar(
                    title: const Text('Thanks!'),
                    actions: [
                      IconButton(
                        icon: const Icon(Icons.more_vert),
                        onPressed: () {
                          // Manage subscriptions
                          if (Platform.isIOS) {
                            launchUrl(Uri.parse("https://apps.apple.com/account/subscriptions"));
                          } else {
                            launchUrl(Uri.parse('https://play.google.com/store/account/subscriptions'));
                          }
                        },
                      ),
                    ],
                  ),
                  body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FadeInImage(
                          placeholder: MemoryImage(kTransparentImage),
                          image: const AssetImage('assets/workstation.png'),
                          height: 300,
                        ),
                        gap16,
                        Text(
                          'You are a premium user!',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        gap16,
                      ],
                    ),
                  ),
                );
              }
              return Scaffold(
                appBar: AppBar(title: const Text('Get Premium')),
                body: ListView(
                  padding: const EdgeInsets.all(16.0),
                  children: const [
                    FeatureCard(
                      asset: 'assets/images/logo.png',
                      title: 'Unlimited Benefits',
                      description: 'Get unlimited access to all features',
                    ),
                    FeatureCard(
                      asset: 'assets/images/logo.png',
                      title: 'Unlimited Perks',
                      description: 'Get unlimited access to all perks',
                    ),
                    FeatureCard(
                      asset: 'assets/images/logo.png',
                      title: 'Unlimited Fun',
                      description: 'Get unlimited access to all fun',
                    ),
                    SizedBox(height: 100),
                  ],
                ),
                floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
                floatingActionButton: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: FloatingActionButton.extended(
                            backgroundColor: Theme.of(context).colorScheme.primary,
                            label: Text(
                              'Get Premium',
                              style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                            onPressed: () async {
                              await subscriptionService.purchaseMonthlySubscription();
                            }),
                      ),
                    ],
                  ),
                ),
              );
            });
      },
    );
  }
}
