import 'package:flutter/material.dart';

class PopupImage extends StatefulWidget {

  final List<Widget> children;

  final VoidCallback onPressed;

  const PopupImage({super.key, required this.children, required this.onPressed});

  @override
  State<PopupImage> createState() => _PopupImageState();
}

class _PopupImageState extends State<PopupImage> {
  double dx = 0, dy = 0;

  void _changeOffset(double x, double y) {
    setState(() {dx = x; dy = y; });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            left: dx,
            top: dy,
            child: GestureDetector(
              onPanUpdate: (details) {
                _changeOffset(dx + details.delta.dx, dy + details.delta.dy);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                ),
                width: 300,
                height: 500,
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: widget.onPressed,
                            icon: const Icon(Icons.cancel))
                      ],
                    ),
                    ...widget.children
                  ],
                ),
              ),
            ))
      ],
    );
  }
}