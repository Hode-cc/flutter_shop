import 'package:flutter/material.dart';

class HomeHot extends StatefulWidget {
  const HomeHot({super.key});

  @override
  State<HomeHot> createState() => _HomeHotState();
}

class _HomeHotState extends State<HomeHot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const Center(child: Text("热门")));
  }
}
