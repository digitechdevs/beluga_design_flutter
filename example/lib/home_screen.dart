import 'package:example/Widget/cutomTabBar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 50),
        child: CustomTabBar(
          tabs: [
            Tab(text: "Review"),
            Tab(text: "Approved"),
            Tab(text: "Rejected"),
          ],
          tabViews: [
            Center(child: Text("Review Screen")),
            Center(child: Text("Approved Screen")),
            Center(child: Text("Rejected Screen")),
          ],
        ),
      ),
    );
  }
}
