import 'dart:math';

import 'package:flutter/material.dart';
import 'package:panorama/panorama.dart';

import '../components/hotspot_button.dart';
import '../components/popup_description.dart';

class PanoramaViewScreen extends StatefulWidget {
  const PanoramaViewScreen(
      {super.key, required this.title, required this.panoramaId});

  final String title;
  final int panoramaId;

  @override
  State<PanoramaViewScreen> createState() => PanoramaViewScreenState();
}

class PanoramaViewScreenState extends State<PanoramaViewScreen> {
  double _lon = 0;
  double _lat = 0;
  double _tilt = 0;

  late int _panoramaId;

  List<Hotspot> hotspots = [];

  bool isActive = false;

  @override
  void initState() {
    super.initState();
    _panoramaId = widget.panoramaId;
  }

  void changeActive(bool v) {
    setState(() {
      isActive = v;
    });
  }

  void insertHotspot(Hotspot hs) {
    setState(() {
      hotspots.add(hs);
    });
  }

  void onViewChanged(longitude, latitude, tilt) {
    setState(() {
      _lon = longitude;
      _lat = latitude;
      _tilt = tilt;
    });
  }

  void onTap(double longitude, double latitude, double tilt) {
    Hotspot h = Hotspot(
      latitude: latitude,
      longitude: longitude,
      width: 120.0,
      height: 120.0,
      widget: Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(255, Random().nextInt(255),
                Random().nextInt(255), Random().nextInt(255)),
            borderRadius: const BorderRadius.all(Radius.circular(12))),
      ),
    );

    //insertHotspot(h);
    print("$longitude $latitude");
  }

  @override
  Widget build(BuildContext context) {
    for (var h in hotspots) {
      h.widget = Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(255, Random().nextInt(255),
                Random().nextInt(255), Random().nextInt(255)),
            borderRadius: const BorderRadius.all(Radius.circular(42))),
      );
    }
    Panorama panorama = switch (_panoramaId) {
      0 => Panorama(
          animSpeed: 1.0,
          sensorControl: SensorControl.Orientation,
          onViewChanged: onViewChanged,
          onTap: onTap,
          hotspots: [
            Hotspot(
              latitude: -15.0,
              longitude: -129.0,
              width: 90,
              height: 75,
              widget: HotspotButton(
                  text: "Next scene",
                  icon: Icons.open_in_browser,
                  onPressed: () {
                    setState(() {
                      _panoramaId = 1;
                    });
                  }),
            ),
            Hotspot(
              latitude: -41.0,
              longitude: -47.0,
              width: 60.0,
              height: 60.0,
              widget: HotspotButton(
                  icon: Icons.search,
                  onPressed: () {
                    changeActive(!isActive);
                  }),
            ),
            ...hotspots
          ],
          child: Image.asset("assets/panorama.jpg"),
        ),
      1 => Panorama(
          animSpeed: 1.0,
          sensorControl: SensorControl.Orientation,
          onViewChanged: onViewChanged,
          hotspots: [
            Hotspot(
              latitude: 0.0,
              longitude: 160.0,
              width: 90.0,
              height: 75.0,
              widget: HotspotButton(
                  text: "Next scene",
                  icon: Icons.double_arrow,
                  onPressed: () {
                    setState(() {
                      _panoramaId = 0;
                    });
                  }),
            ),
          ],
          child: Image.asset("assets/panorama2.webp"),
        ),
      _ => Panorama(
          animSpeed: 1.0,
          sensorControl: SensorControl.Orientation,
          onViewChanged: onViewChanged,
          hotspots: const [],
          child: Image.asset("assets/hongkon.jpg"),
        )
    };

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          panorama,
          Text(
              '${_lon.toStringAsFixed(3)}, ${_lat.toStringAsFixed(3)}, ${_tilt.toStringAsFixed(3)}'),
          if (isActive)
            Positioned.fill(
              child: Center(
                child: PopupImage(
                  onPressed: () {
                    changeActive(false);
                  },
                  children: [
                    const Text(
                      "Sun Flower",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.black),
                    ),
                    Image.asset(
                      "assets/sun_flower.png",
                      alignment: Alignment.center,
                      width: 300,
                      height: 150,
                      fit: BoxFit.scaleDown,
                    ),
                    const Text(
                      "The sunflower, with its bright yellow petals and towering height, symbolizes warmth and positivity. "
                      "Facing the sun, it captures the essence of summer. Its large, round face resembles the sun itself, "
                      "bringing joy and light to any garden. Sunflowers are a timeless reminder of nature's beauty and resilience",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                      textDirection: TextDirection.ltr,
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
