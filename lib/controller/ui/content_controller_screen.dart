import 'package:flutter/material.dart';

class ContentControllerScreen extends StatefulWidget {
  final Widget child;
  const ContentControllerScreen({super.key, required this.child});

  @override
  State<ContentControllerScreen> createState() =>
      _ContentControllerScreenState();
}

class _ContentControllerScreenState extends State<ContentControllerScreen> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
