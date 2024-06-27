import 'package:flutter/material.dart';

class HotspotButton extends StatelessWidget{
  const HotspotButton({super.key, this.text, required this.icon, required this.onPressed});

  final String? text;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          style: ButtonStyle(
            shape: WidgetStateProperty.all(const CircleBorder()),
            backgroundColor: WidgetStateProperty.all(Colors.black38),
            foregroundColor: WidgetStateProperty.all(Colors.white),
          ),
          onPressed: onPressed,
          child: Icon(icon),
        ),
        text != null
            ? Container(
          padding: const EdgeInsets.all(2.0),
          decoration: const BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.all(Radius.circular(4))),
          child: Center(child: Text(text!)),
        )
            : Container(),
      ],
    );
  }
}