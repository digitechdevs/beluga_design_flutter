import 'package:beluga_design_flutter/package/components/buttons/main_button_filled.dart';
import 'package:beluga_design_flutter/package/components/buttons/main_button_outlined.dart';
import 'package:beluga_design_flutter/package/components/buttons/onboarding_main_button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomMainFillButton(
              onPressed: () {},
              width: 120,
              height: 36,
              borderRadius: 100,
              backgroundColor: const Color(0xff6938EF),
              text: 'Button CTA',
              textColor: const Color(0xffFFFFFF),
              fontWeight: 500,
              fontSize: 14,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomMainFillButton(
              onPressed: () {},
              width: 120,
              height: 36,
              borderRadius: 100,
              backgroundColor: const Color(0xff7A5AF8),
              text: 'Button CTA',
              textColor: const Color(0xffFFFFFF),
              fontSize: 14,
              fontWeight: 500,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomMainFillButton(
              onPressed: () {},
              width: 120,
              height: 36,
              borderRadius: 100,
              backgroundColor: const Color(0xff6938EF),
              text: 'Button CTA',
              textColor: const Color(0xffFFFFFF),
              fontSize: 14,
              fontWeight: 500,
              showOuterBorder: true,
              outerBorderWidth: 2,
              outerBorderColor: const Color(0xff6938EF).withOpacity(0.3),
            ),
            const SizedBox(
              height: 25,
            ),
            CustomMainFillButton(
              onPressed: () {},
              width: 120,
              height: 36,
              borderRadius: 100,
              backgroundColor: const Color(0xffD9D6FE),
              text: 'Button ',
              textColor: const Color(0xffFFFFFF),
              fontSize: 14,
              fontWeight: 500,
              icon: Icons.add_ic_call_rounded,
            ),
            const SizedBox(
              height: 25,
            ),
            CustomOutlinedButton(
              borderRadius: 100,
              borderColor: const Color(0xff6938EF),
              borderWidth: 1,
              onPressed: () {},
              icon: Icons.insert_chart_outlined_sharp,
              text: "sign in with google",
              // autofocus: true,
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
