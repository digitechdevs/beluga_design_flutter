import 'package:beluga_design_flutter/beluga_design.dart';
import 'package:example/check_box_screen.dart';
import 'package:example/home_screen.dart';
import 'package:example/radio_button_screen.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844), // Base screen size (example: iPhone X)
      minTextAdapt: true, // Ensures text scaling
      splitScreenMode: true, // Supports split-screen mode
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          // home: CheckBoxScreen(),
          home: const HomeScreen(),
        );
      },
    );
  }
}
