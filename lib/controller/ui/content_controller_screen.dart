import 'package:flutter/material.dart';

import '../../widgets/design_bottom_navigation.dart';

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
    return Scaffold(
      bottomNavigationBar: const BottomNavigationWidget(),
      body: widget.child,
    );
  }
}
