import 'package:flutter/material.dart';

abstract class FastSubscriptionService {

  /// Setup the subscription service
  Future<void> initialize();

  String get premiumId;

  ValueNotifier<bool> premium = ValueNotifier(false);

  void setPremium(bool val) {
    premium.value = val;
  }

  /// Reach out to the server to check if the user has a subscription
  Future<void> checkSubscription();

  /// Show a popup when an unsubscribed user tries to access a premium feature
  Future<void> showPremiumPopup();

  Future<void> purchaseMonthlySubscription();

  Future<void> purchaseAnnualSubscription();

  Future<void> fetchOfferings();
}
