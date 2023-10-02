import 'package:flutter/material.dart';
import 'package:flutter_news_reader/view/utils/place_holder.dart';

class InternetAvailableScreen extends StatelessWidget {
  const InternetAvailableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                Image.asset(PlaceHolderImage().internetAvailableImage),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'You are online. 🎉 \nYou will be navigated to this page when you are offline.',
                  style: TextStyle(fontSize: 21),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Go back to the Online News',
                      style: TextStyle(fontSize: 18),
                    )),
                const SizedBox(
                  height: 160,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
