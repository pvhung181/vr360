import 'package:flutter/material.dart';
import 'package:vr360/screens/panorama_view_screen.dart';

class HomeScreen extends StatelessWidget {
  final String title;

  const HomeScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        padding: const EdgeInsets.all(4),
        decoration: const BoxDecoration(color: Colors.white),
        child: ListView(
          children: [
            GestureDetector(
              onTapDown: (TapDownDetails details) {
                Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PanoramaViewScreen(title: title, panoramaId: 0,)
                    )
                );
              },
              child: Container(
                margin: const EdgeInsets.all(4),
                child: Image.asset(
                  "assets/panorama.jpg",
                  fit: BoxFit.fill,
                  height: 100,
                ),
              ),
            ),
            GestureDetector(
              onTapDown: (TapDownDetails details) {
                Navigator.of(context).push(
                    MaterialPageRoute(
                    builder: (context) => PanoramaViewScreen(title: title, panoramaId: 1,))
                );
              },
              child: Container(
                margin: const EdgeInsets.all(4),
                child: Image.asset(
                  "assets/panorama2.webp",
                  fit: BoxFit.fill,
                  height: 100,
                ),
              ),
            ),
            GestureDetector(
              onTapDown: (TapDownDetails details) {
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => PanoramaViewScreen(title: title, panoramaId: 2,))
                );
              },
              child: Container(
                margin: const EdgeInsets.all(4),
                child: Image.asset(
                  "assets/hongkon.jpg",
                  fit: BoxFit.fill,
                  height: 100,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
