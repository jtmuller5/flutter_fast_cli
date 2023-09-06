import 'dart:io';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:template/app/constants.dart';
import 'package:template/app/services.dart';
import 'package:template/features/subscriptions/ui/subscription/widgets/feature_card.dart';
import 'package:template/features/subscriptions/ui/subscription/widgets/plan_card.dart';
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
                  children:  [
                    ValueListenableBuilder<Package?>(
                      valueListenable: subscriptionService.monthly,
                      builder: (context, monthly, child) {
                        return PlanCard(
                          name: 'Monthly',
                          price: monthly?.storeProduct.price ?? 999,
                          benefits: [
                            'Unlimited access to all features',
                            'Unlimited access to all features',
                            'Unlimited access to all features',
                          ],
                          onTap: () async {
                            await subscriptionService.purchaseMonthlySubscription();
                          },
                          buttonText: 'Get Flutter Fast',
                          buttonSubText: 'Pay once. Build forever.',
                        );
                      }
                    ),
                    gap24,
                    ValueListenableBuilder<Package?>(
                      valueListenable: subscriptionService.annual,
                      builder: (context, annual, child) {
                        return PlanCard(
                          name: 'Annual',
                          price: annual?.storeProduct.price ?? 999,
                          featured: true,
                          benefits: [
                            'Unlimited access to all features',
                            'Unlimited access to all features',
                            'Unlimited access to all features',
                          ],
                          onTap: () async {
                            await subscriptionService.purchaseAnnualSubscription();
                          },
                          buttonText: 'Get Flutter Fast',
                          buttonSubText: 'Pay once. Build forever.',
                        );
                      }
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              );
            });
      },
    );
  }
}
