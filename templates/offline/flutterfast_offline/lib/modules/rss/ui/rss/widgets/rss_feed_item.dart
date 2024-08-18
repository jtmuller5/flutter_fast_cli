import 'package:flutter/material.dart';
import 'package:flutterfast_offline/app/constants.dart';
import 'package:flutterfast_offline/app/text_theme.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webfeed_revised/domain/rss_item.dart';

class RssFeedItem extends StatelessWidget {
  const RssFeedItem({Key? key, required this.item}) : super(key: key);

  final RssItem item;

  @override
  Widget build(BuildContext context) {
    String? url = item.link;

    return InkWell(
      onTap: url != null
          ? () {
              String? url = item.link;
              launchUrl(Uri.parse(url!));
            }
          : null,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.title ?? '',
              style: context.titleSmall.bold,
            ),
            gap8,
            if (item.dc?.modified != null)
              Row(
                children: [
                  if (item.pubDate != null) ...[
                    Text(
                      MaterialLocalizations.of(context).formatCompactDate(item.pubDate!),
                      style: context.bodySmall,
                    ),
                    if (item.dc?.modified != null) const Text(' - ')
                  ],
                  if (item.dc?.modified != null)
                    Text(
                      'Updated: ${MaterialLocalizations.of(context).formatCompactDate(item.dc!.modified!)}',
                      style: context.bodySmall,
                    ),
                ],
              ),
            gap4,
            Text(
              item.guid ?? '',
              maxLines: 1,
              style: context.bodySmall,
            ),
            gap8,
            if (item.description != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  (item.description ?? '').trim(),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            if (item.content != null) Text(item.content?.value ?? ''),
            if (item.dc != null) Text(item.dc?.rights ?? ''),
            if (item.source?.value != null) Text(item.source?.value ?? ''),
            if (item.dc?.publisher != null) Text(item.dc?.publisher ?? ''),
            gap8,
            Row(
              children: [
                Text(
                  item.dc?.creator ?? '',
                  style: context.bodySmall,
                ),
                Text(
                  item.dc?.contributor ?? '',
                  style: context.bodySmall,
                ),
              ],
            ),
            Wrap(
              spacing: 8,
              children: [
                ...item.categories?.map((e) {
                      return ActionChip(label: Text(e.value ?? ''));
                    }).toList() ??
                    [],
              ],
            ),
            ...item.media?.thumbnails?.map((e) {
                  return Text(e.url ?? '');
                }).toList() ??
                [],
          ],
        ),
      ),
    );
  }
}
