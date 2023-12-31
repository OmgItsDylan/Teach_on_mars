import 'package:flutter/material.dart';
import 'package:teach_on_mars_test/data/models/post/post_model.dart';
import 'package:teach_on_mars_test/l10n/l10n.dart';
import 'package:teach_on_mars_test/posts/widgets/button/core.dart';
import 'package:teach_on_mars_test/posts/widgets/post_card/components/image_container.dart';

class PostCard extends StatelessWidget {
  const PostCard({required this.model, super.key, this.onPressed});
  final PostModel model;
  final Future<void> Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              model.title ?? l10n.postTitleError,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 10),
            contentBody(context, model.type ?? 0),
          ],
        ),
      ),
    );
  }

  Widget contentBody(BuildContext context, int type) {
    final l10n = context.l10n;
    switch (type) {
      case 1:
        return Column(
          children: [
            Text(
              model.excerpt ?? '',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 10),
            Button.primary(
              label: l10n.seeMoreButton,
              onPressed: onPressed,
            ),
          ],
        );
      case 2:
        return Column(
          children: [
            ImageContainer(url: model.picture?.url),
            const SizedBox(height: 10),
            Text(
              model.author ?? '',
              style: Theme.of(context).textTheme.bodySmall,
              maxLines: 1,
            ),
          ],
        );
    }
    return const SizedBox();
  }
}
