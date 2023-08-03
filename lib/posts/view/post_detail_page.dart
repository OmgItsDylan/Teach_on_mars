import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:teach_on_mars_test/data/models/post/post_model.dart';
import 'package:teach_on_mars_test/l10n/l10n.dart';
import 'package:teach_on_mars_test/posts/widgets/button/core.dart';
import 'package:teach_on_mars_test/posts/widgets/loader_widge/core.dart';
import 'package:teach_on_mars_test/theme/app_textstyle.dart';

class PostDetailPage extends StatelessWidget {
  const PostDetailPage({
    required this.model,
    super.key,
  });

  final PostModel model;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final title = model.type == 1 ? l10n.postsArticleTitle : l10n.postsImageTitle;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Row(
          children: [
            Button.back(
              onPressed: () async => Navigator.of(context).pop(),
            ),
            const SizedBox(width: 8),
            Text(title, style: AppTextStyle.appBarTextStyle),
          ],
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: model.type == 1 ? CrossAxisAlignment.start : CrossAxisAlignment.center,
            children: [
              if (model.type == 2) ...[
                CachedNetworkImage(
                  imageUrl: model.picture?.url ?? 'https://static.thenounproject.com/png/504708-200.png',
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  placeholder: (context, url) => const Center(
                    child: LoaderWidget(size: 30),
                  ),
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 16),
              ],
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  model.title ?? l10n.postTitleError,
                  style: AppTextStyle.postCardTitleTextStyle,
                ),
              ),
              if (model.type == 1) ...[
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    model.text ?? '',
                    style: AppTextStyle.postDetail1BodyTextStyle,
                  ),
                ),
              ],
              if (model.type == 2) ...[
                const SizedBox(height: 5),
                Text(
                  model.author ?? '',
                  style: AppTextStyle.postDetail2BodyTextStyle,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
