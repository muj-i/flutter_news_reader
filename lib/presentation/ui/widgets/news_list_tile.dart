import 'package:flutter/material.dart';
import 'package:flutter_news_reader/data/models/news_article_model.dart';
import 'package:flutter_news_reader/presentation/ui/screens/news_details_screen.dart';
import 'package:flutter_news_reader/presentation/ui/utils/place_holder.dart';
import 'package:flutter_news_reader/presentation/ui/widgets/custom_cached_network_image.dart';

class NewsListTile extends StatefulWidget {
  final ArticlesData articlesData;
  const NewsListTile({
    super.key,
    required this.articlesData,
  });

  @override
  State<NewsListTile> createState() => _NewsListTileState();
}

class _NewsListTileState extends State<NewsListTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsDetailsScreen(
              articlesData: widget.articlesData,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          subtitle: Column(
            children: [
              CustomCachedNetworkImage(
                  url: (widget.articlesData.urlToImage?.toString() ?? '')
                          .isNotEmpty
                      ? widget.articlesData.urlToImage.toString()
                      : PlaceHolderImage().placeHolderImage),
              const SizedBox(
                width: 8,
              ),
              Text(
                widget.articlesData.title.toString(),
                style: const TextStyle(
                    fontSize: 18, overflow: TextOverflow.ellipsis),
              ),
              Text(
                widget.articlesData.description.toString(),
                maxLines: 2,
                style: const TextStyle(
                    fontSize: 12, overflow: TextOverflow.ellipsis),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
