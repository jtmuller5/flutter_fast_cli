import 'package:flutter/material.dart';
import 'package:flutterfast/app/constants.dart';
import 'package:flutterfast/app/text_theme.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webfeed_revised/domain/atom_item.dart';
import 'package:collection/collection.dart';

class AtomFeedItem extends StatelessWidget {
  const AtomFeedItem({Key? key, required this.item}) : super(key: key);

  final AtomItem item;

  @override
  Widget build(BuildContext context) {
    String? url =
        item.links?.firstWhereOrNull((element) => element.href != null)?.href;

    return InkWell(
      onTap: url != null
          ? () {
              String? url = item.links
                  ?.firstWhereOrNull((element) => element.href != null)
                  ?.href;
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
            if (item.updated != null)
              Row(
                children: [
                  if (item.published != null) ...[
                    Text(
                      MaterialLocalizations.of(context)
                          .formatCompactDate(DateTime.parse(item.published!)),
                      style: context.bodySmall,
                    ),
                    if (item.updated != null) const Text(' - ')
                  ],
                  if (item.updated != null)
                    Text(
                      'Updated: ${MaterialLocalizations.of(context).formatCompactDate(item.updated!)}',
                      style: context.bodySmall,
                    ),
                ],
              ),
            gap4,
            Text(
              item.id ?? '',
              maxLines: 1,
              style: context.bodySmall,
            ),
            gap8,
            if (item.summary != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  (item.summary ?? '').trim(),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            if (item.content != null) Text(item.content ?? ''),
            if (item.rights != null) Text(item.rights ?? ''),
            if (item.source?.title != null) Text(item.source?.title ?? ''),
            if (item.source?.id != null) Text(item.source?.id ?? ''),
            ...item.contributors?.map((e) {
                  return Text(e.name ?? '');
                }).toList() ??
                [],
            gap8,
            Row(
              children: [
                ...item.authors?.map((e) {
                      return Text(
                        e.name ?? '',
                        style: context.bodySmall,
                      );
                    }).toList() ??
                    [],
              ],
            ),
            ...item.links?.map((e) {
                  return Text(
                    e.href ?? '',
                    style: context.bodySmall.italic,
                  );
                }).toList() ??
                [],
            Wrap(
              spacing: 8,
              children: [
                ...item.categories?.map((e) {
                      return ActionChip(label: Text(e.term ?? ''));
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
