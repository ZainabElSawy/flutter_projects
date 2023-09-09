import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/views/article_view.dart';

// cached network image
class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.articleModel});

  final ArticleModel articleModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WebViewApp(
            url: articleModel.url ?? '',
          ),
        ),
      ),
      child: Card(
        color: Colors.grey.shade200,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CachedNetworkImage(
              imageUrl: articleModel.image ?? '',
              imageBuilder: (context, imageProvider) => ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image(
                    image: imageProvider,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )),
              placeholder: (context, url) => const Padding(
                padding: EdgeInsets.only(top: 25),
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.network(
                  'https://f4.bcbits.com/img/a3756316213_65',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
              child: Text(
                articleModel.title ?? '',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 20, left: 10, right: 10, top: 10),
              child: Text(
                articleModel.subTitle ?? '',
                maxLines: 2,
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
            )
          ],
        ),
      ),
    );
  }
}
