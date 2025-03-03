import 'package:beluga_design_flutter/package/components/checkboxes/checkboxes.dart';
import 'package:beluga_design_flutter/package/utils/colors.dart';
import 'package:flutter/material.dart';

class CheckBoxScreen extends StatefulWidget {
  const CheckBoxScreen({super.key});

  @override
  State<CheckBoxScreen> createState() => _CheckBoxScreenState();
}

class _CheckBoxScreenState extends State<CheckBoxScreen> {
  bool isChecked = false;
  bool isChecked1 = false;
  bool isChecked3 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BelugaCheckbox(
              value: isChecked,
              onChanged: (value) {
                setState(() {
                  isChecked = value ?? false;
                });
              },
              showLabel: true,
              label: "Remember Me",
              borderColor: AppColors.radiocolor,
              // selectedColor: Colors.purple[400],
            ),
            const SizedBox(height: 20),
            BelugaCheckbox(
              value: isChecked1,
              onChanged: (value) {
                setState(() {
                  isChecked1 = value ?? false;
                });
              },
              showLabel: true,
              label: "Remember Me",
              borderColor: Colors.grey[300],
              // selectedColor: Colors.purple[400],
            ),
            const SizedBox(height: 20),
            // BelugaCheckbox(
            //   value: isChecked3,
            //   hasGlow: true,
            //   onChanged: (value) {
            //     setState(() {
            //       isChecked3 = value ?? false;
            //     });
            //   },
            //   showLabel: true,
            //   label: "Remember Me",
            //   borderColor: Colors.grey[300],
            //   // selectedColor: Colors.purple[400],
            // )
          ],
        ),
      ),
    );
  }
}
