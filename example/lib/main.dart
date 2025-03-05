import 'package:beluga_design_flutter/beluga_design.dart';
import 'package:example/buttons.dart';
import 'package:example/inputs.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      designSize: Size(390, 812),
      minTextAdapt: true,
      child: MaterialApp(
        home: BelugaDesignHome(),
      ),
    );
  }
}

class BelugaDesignHome extends StatefulWidget {
  const BelugaDesignHome({super.key});

  @override
  State<BelugaDesignHome> createState() => _BelugaDesignHomeState();
}

class _BelugaDesignHomeState extends State<BelugaDesignHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CupertinoButton.filled(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const InputField();
                    },
                  ),
                );
              },
              child: const Text("Inputs"),
            ),
            const SizedBox(height: 20),
            CupertinoButton.filled(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const Buttons();
                    },
                  ),
                );
              },
              child: const Text("Buttons"),
            ),
            const SizedBox(height: 20),
            CupertinoButton.filled(
              onPressed: () {},
              child: const Text("Selectors"),
            ),
          ],
        ),
      ),
    );
  }
}
