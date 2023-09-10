import 'package:code_on_the_rocks/code_on_the_rocks.dart';
import 'package:flutter/material.dart';
import 'package:webfeed_revised/webfeed_revised.dart';
import 'package:http/http.dart' as http;

class RssViewModelBuilder extends ViewModelBuilder<RssViewModel> {
  const RssViewModelBuilder({
    super.key,
    required super.builder,
  });

  @override
  State<StatefulWidget> createState() => RssViewModel();
}

class RssViewModel extends ViewModel<RssViewModel> {
  ValueNotifier<AtomFeed?> atomFeed = ValueNotifier(null);

  void setAtomFeed(AtomFeed val) {
    atomFeed.value = val;
  }

  ValueNotifier<RssFeed?> rssFeed = ValueNotifier(null);

  void setRssFeed(RssFeed? val) {
    rssFeed.value = val;
  }

  Future<void> getFeed() async {
    bool isAtom = true;
    String feedUrl =
        'https://pub.dev/feed.atom'; //'https://stackoverflow.com/feeds/tag?tagnames=flutter';

    if (isAtom || feedUrl.contains('atom')) {
      try {
        // RSS feed
        http.Response response = await http.get(
          Uri.parse(feedUrl),
        );

        var atomFeed = AtomFeed.parse(response.body);

        setAtomFeed(atomFeed);

        debugPrint('feed: ' + atomFeed.items.toString());
      } catch (e) {
        debugPrint('error: ' + e.toString());
      }
    } else {
      try {
        // RSS feed
        http.Response response = await http.get(
          Uri.parse(feedUrl),
        );

        debugPrint('response.body: ' + response.body.toString());

        var rssFeed = RssFeed.parse(response.body);

        setRssFeed(rssFeed);

        debugPrint('feed: ' + rssFeed.items.toString());
      } catch (e) {
        debugPrint('error: ' + e.toString());
      }
    }
  }

  @override
  void initState() {
    getFeed();
    super.initState();
  }

  static RssViewModel of_(BuildContext context) =>
      getModel<RssViewModel>(context);
}
