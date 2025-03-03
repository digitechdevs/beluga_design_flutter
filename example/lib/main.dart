import 'package:beluga_design_flutter/package/components/checkboxes/radio_buttons.dart';
import 'package:beluga_design_flutter/beluga_design.dart';
import 'package:example/check_box_screen.dart';
import 'package:example/radio_button_screen.dart';

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
    return const MaterialApp(
      home: CheckBoxScreen(),
    );
  }
}
