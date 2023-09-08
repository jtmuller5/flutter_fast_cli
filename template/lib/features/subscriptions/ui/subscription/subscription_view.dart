import 'dart:io';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:template/app/constants.dart';
import 'package:template/app/services.dart';
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
                          image: const AssetImage('assets/images/logo.png'),
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
                body: ValueListenableBuilder(
                    valueListenable: subscriptionService.offering,
                    builder: (context, offerings, child) {
                      if (offerings == null) return const Center(child: CircularProgressIndicator());

                      if (offerings.availablePackages.isEmpty) return const Center(child: Text('No subscriptions available'));

                      return ListView.builder(
                        itemCount: offerings.availablePackages.length,
                        padding: const EdgeInsets.all(16.0),
                        itemBuilder: (context, index) {
                          final package = offerings.availablePackages[index];

                          return PlanCard(
                            name: package.identifier, // Monthly, Annual, etc.
                            description: package.storeProduct.description,
                            price: package.storeProduct.priceString,
                            benefits: const [
                              'Unlimited access to all features',
                              'Unlimited access to all features',
                              'Unlimited access to all features',
                            ],
                            onTap: () async {
                              await subscriptionService.purchaseSubscription(package);
                            },
                            buttonText: 'Get ${package.identifier.substring(0,1).toUpperCase()}${package.identifier.substring(1)}',
                            buttonSubText: package.packageType == PackageType.lifetime ? 'One time purchase' : 'Monthly subscription',
                          );
                        },
                      );
                    }),
              );
            });
      },
    );
  }
}
