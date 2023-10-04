import 'dart:async';

import 'package:flutter/material.dart';

class IconWithCollapsingText extends StatefulWidget {
  final IconData iconData;
  final IconData alternativeIconData;
  final String text;
  final Duration collapseDuration;
  final Duration toggleDuration;
  final Color containerColor;

  const IconWithCollapsingText({
    Key? key,
    required this.iconData,
    required this.alternativeIconData,
    required this.text,
    this.collapseDuration = const Duration(seconds: 5),
    this.toggleDuration = const Duration(seconds: 5),
    required this.containerColor,
  }) : super(key: key);

  @override
  IconWithCollapsingTextState createState() => IconWithCollapsingTextState();
}

class IconWithCollapsingTextState extends State<IconWithCollapsingText> {
  bool _showText = true;

  @override
  void initState() {
    super.initState();

    Timer(widget.collapseDuration, () {
      if (mounted) {
        toggleTextVisibility();
      }
    });
  }

  void toggleTextVisibility() {
    setState(() {
      _showText = !_showText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        toggleTextVisibility();
        Timer(widget.toggleDuration, () {
          if (mounted) {
            toggleTextVisibility();
          }
        });
      },
      child: Visibility(
        visible: _showText,
        replacement: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: widget.containerColor,
            ),
            child: Row(
              children: [
                Icon(widget.alternativeIconData, color: Colors.green,),
              ],
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: widget.containerColor,
            ),
            child: Row(
              children: [
                Icon(widget.iconData,  color: Colors.green,),
                const SizedBox(width: 8.0),
                AnimatedOpacity(
                  duration: widget.toggleDuration,
                  opacity: _showText ? 1.0 : 0.0,
                  child: Text(
                    widget.text,
                    style: const TextStyle(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
