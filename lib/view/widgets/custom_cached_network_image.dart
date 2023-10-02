import 'package:flutter/material.dart';
import 'package:flutter_news_reader/view/widgets/shimmer_list_item.dart';

class CustomNetworkImage extends StatelessWidget {
  final String url;

  const CustomNetworkImage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.network(
          url,
          height: 250,
          width: double.infinity,
          fit: BoxFit.fitWidth,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) {
              return child;
            } else {
              return SizedBox(
                height: 200,
                child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return const ShimmerListItem();
                    }),
              );
            }
          },
        ),
      ],
    );
  }
}
