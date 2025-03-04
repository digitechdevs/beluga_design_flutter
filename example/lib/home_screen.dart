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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: CustomTabBar(
          tabs: [
            Tab(
              // text: "Review",
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Review"),
                  const SizedBox(
                    width: 10,
                  ),
                  // Icon(Icons.abc_outlined)
                  // CircleAvatar(
                  //   radius: 10,
                  //   backgroundColor: Colors.red,
                  //   child: Text(
                  //     "3",
                  //     style: TextStyle(color: Colors.white),
                  //   ),
                  // )
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 20,
                      minHeight: 20,
                    ),
                    child: const Center(
                      child: Text(
                        '3',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Tab(text: "Approved"),
            const Tab(text: "Rejected"),
          ],
          tabViews: const [
            Center(child: Text("Review Screen")),
            Center(child: Text("Approved Screen")),
            Center(child: Text("Rejected Screen")),
          ],
        ),
      ),
    );
  }
}
