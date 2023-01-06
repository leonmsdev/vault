import 'package:flutter/material.dart';

import '../../../widgets/design_bottom_navigation.dart';

class GeneratorScreen extends StatefulWidget {
  final Widget child;
  const GeneratorScreen({super.key, required this.child});

  @override
  State<GeneratorScreen> createState() => _GeneratorScreenState();
}

class _GeneratorScreenState extends State<GeneratorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const BottomNavigationWidget(),
        body: SafeArea(child: widget.child));
  }
}

class GeneratorContent extends StatelessWidget {
  const GeneratorContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Generator'),
    );
  }
}
