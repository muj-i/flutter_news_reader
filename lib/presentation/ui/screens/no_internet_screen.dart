import 'package:flutter/material.dart';
import 'package:flutter_news_reader/presentation/ui/utils/place_holder.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(
            height: 200,
          ),
          Image.asset(PlaceHolderImage().noInternetImage),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Turn on the Internet for latest news',
            style: TextStyle(fontSize: 21),
          ),

          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Go back to the Offline News',
                style: TextStyle(fontSize: 18),
              )),
          const SizedBox(
            height: 160,
          ),
        ],
      )),
    );
  }
}
