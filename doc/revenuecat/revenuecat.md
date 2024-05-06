## Before Generating Your App
Follow the steps here: https://www.revenuecat.com/docs/projects

## After Generating Your App
Once you've setup your Android and iOS apps in RevenuCat, add the following variables to your `config.json` file:
```
"GOOGLE_SDK_KEY": "",
"IOS_SDK_KEY": "",
"AMAZON_SDK_KEY": "",
```
These can be found here:

Projects -> {Your Project} -> Apps -> {Your App} -> Public API Key.

The [Flutter setup steps](https://www.revenuecat.com/docs/flutter) will be completed by the Flutter Fast CLI.

## Remove RevenueCat
You can easily remove all code related to the subscriptions feature by including `--no-subs` in your fast app command:
```
fast app -n my_app --no-subs
```