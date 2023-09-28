
import 'package:flutter/material.dart';
import 'package:flutter_news_reader/data/models/news_article_model.dart';
import 'package:flutter_news_reader/ui/utils/place_holder.dart';
import 'package:flutter_news_reader/ui/widgets/custom_cached_network_image.dart';

class NewsDetailsScreen extends StatefulWidget {
  final ArticlesData articlesData;
  const NewsDetailsScreen({super.key, required this.articlesData});

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.articlesData.source?.name ?? ''),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomCachedNetworkImage(
                  url: (widget.articlesData.urlToImage?.toString() ?? '')
                          .isNotEmpty
                      ? widget.articlesData.urlToImage.toString()
                      : PlaceHolderImage().placeHolderImage),
              Row(
                children: [
                  const Spacer(),
                  FittedBox(
                    child: Text(
                      "Date: ${widget.articlesData.publishedAt ?? ''}",
                      style: const TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                widget.articlesData.title ?? '',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                  widget.articlesData.description ?? ''),
              const SizedBox(
                height: 8,
              ),
              Text(widget.articlesData.content ?? ''), const SizedBox(
                height: 8,
              ),
               Text(
                 
                 "Author: ${widget.articlesData.author ?? ''}",
                 style: const TextStyle(fontSize: 14,),
                 
               ),
            ],
          ),
        ),
      ),
    );
  }
}
