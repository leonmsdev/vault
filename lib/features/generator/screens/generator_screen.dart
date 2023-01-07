import 'package:flutter/material.dart';

import '../../../widgets/design_bottom_navigation.dart';

class GeneratorScreen extends StatefulWidget {
  const GeneratorScreen({super.key});

  @override
  State<GeneratorScreen> createState() => _GeneratorScreenState();
}

class _GeneratorScreenState extends State<GeneratorScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: BottomNavigationWidget(),
      body: SafeArea(
        child: Center(
          child: Text('Generator Screen'),
        ),
      ),
    );
  }
}
