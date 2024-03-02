import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class gmap extends StatelessWidget {
  const gmap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  launchmap();
                },
                child: Container(
                  height: 220,
                  width: 300,
                  color: Colors.amber,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  launchmap() async {
    final url = Uri.parse('https://www.youtube.com/');
    await launchUrl(url);
  }
}
