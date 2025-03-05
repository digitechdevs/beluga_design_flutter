import 'package:example/Widget/cutomTabBar.dart';
import 'package:flutter/material.dart';

import 'package:example/Widget/tab_row.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {}); // Updates UI when tab selection changes
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: CustomTabBar(
          tabs: [
            Tab(
              child: TabUtil.myTab(
                text: "Review",
                count: 3,
                isSelected: _tabController.index == 0, // Pass selected state
              ),
            ),
            Tab(
              child: TabUtil.myTab(
                text: "Approved",
                count: 2,
                isSelected: _tabController.index == 1,
              ),
            ),
            Tab(
              child: TabUtil.myTab(
                text: "Rejected",
                count: 2,
                isSelected: _tabController.index == 2,
              ),
            ),
          ],
          tabViews: const [
            Center(child: Text("Review Screen")),
            Center(child: Text("Approved Screen")),
            Center(child: Text("Rejected Screen")),
          ],
          tabController: _tabController, // Pass controller
        ),
      ),
    );
  }
}
