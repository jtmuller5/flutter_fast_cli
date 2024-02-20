import 'dart:math';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutterfast/modules/rss/ui/rss/widgets/atom_feed_item.dart';
import 'package:flutterfast/modules/rss/ui/rss/widgets/rss_feed_item.dart';
import 'package:webfeed_revised/webfeed_revised.dart';
import 'package:http/http.dart' as http;

@RoutePage()
class RssView extends StatefulWidget {
  const RssView({Key? key}) : super(key: key);

  @override
  State<RssView> createState() => _RssViewState();
}

class _RssViewState extends State<RssView> {
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
    String feedUrl = 'https://pub.dev/feed.atom'; //'https://stackoverflow.com/feeds/tag?tagnames=flutter';

    if (isAtom || feedUrl.contains('atom')) {
      try {
        // RSS feed
        http.Response response = await http.get(
          Uri.parse(feedUrl),
        );

        var atomFeed = AtomFeed.parse(response.body);

        setAtomFeed(atomFeed);

        // debugPrint('feed: ' + atomFeed.items.toString());
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

        // debugPrint('feed: ' + rssFeed.items.toString());
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListenableBuilder(
      listenable: Listenable.merge([atomFeed, rssFeed]),
      builder: (context, child) {
        if (atomFeed.value != null) {
          return RefreshIndicator(
            onRefresh: () async {
              await getFeed();
            },
            child: ListView.separated(
                itemCount: atomFeed.value!.items!.length,
                itemBuilder: (context, index) {
                  AtomItem item = atomFeed.value!.items![index];
                  return Animate(
                    effects: const [
                      ScaleEffect(begin: Offset(.8, .8)),
                    ],
                    delay: Duration(milliseconds: 100 * min(index, 5)),
                    child: AtomFeedItem(item: item),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(height: 2);
                }),
          );
        } else if (rssFeed.value != null) {
          return RefreshIndicator(
            onRefresh: () async {
              await getFeed();
            },
            child: ListView.builder(
              itemCount: rssFeed.value!.items!.length,
              itemBuilder: (context, index) {
                RssItem item = rssFeed.value!.items![index];
                return Animate(effects: const [
                  ScaleEffect(begin: Offset(.8, .8)),
                ], delay: Duration(milliseconds: 100 * min(index, 5)), child: RssFeedItem(item: item));
              },
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    ));
  }
}
