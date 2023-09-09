import 'dart:math';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutterfast/modules/rss/ui/rss/widgets/atom_feed_item.dart';
import 'package:flutterfast/modules/rss/ui/rss/widgets/rss_feed_item.dart';
import 'package:webfeed_revised/domain/atom_item.dart';
import 'package:webfeed_revised/domain/rss_item.dart';
import 'rss_view_model.dart';

@RoutePage()
class RssView extends StatelessWidget {
  const RssView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RssViewModelBuilder(
      builder: (context, model) {
        return Scaffold(
            appBar: AppBar(title: const Text('RSS Feed')),
            body: ListenableBuilder(
              listenable: Listenable.merge([model.atomFeed, model.rssFeed]),
              builder: (context, child) {
                if (model.atomFeed.value != null) {
                  return RefreshIndicator(
                    onRefresh: () async {
                      await model.getFeed();
                    },
                    child: ListView.separated(
                        itemCount: model.atomFeed.value!.items!.length,
                        itemBuilder: (context, index) {
                          AtomItem item = model.atomFeed.value!.items![index];
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
                } else if (model.rssFeed.value != null) {
                  return RefreshIndicator(
                    onRefresh: () async {
                      await model.getFeed();
                    },
                    child: ListView.builder(
                      itemCount: model.rssFeed.value!.items!.length,
                      itemBuilder: (context, index) {
                        RssItem item = model.rssFeed.value!.items![index];
                        return Animate(
                            effects: const [
                              ScaleEffect(begin: Offset(.8, .8)),
                            ],
                            delay: Duration(milliseconds: 100 * min(index, 5)),
                            child: RssFeedItem(item: item));
                      },
                    ),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ));
      },
    );
  }
}
