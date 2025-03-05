import 'package:beluga_design_flutter/beluga_design.dart';

class CheckBoxes extends StatefulWidget {
  const CheckBoxes({super.key});

  @override
  State<CheckBoxes> createState() => _CheckBoxesState();
}

class _CheckBoxesState extends State<CheckBoxes> {
  bool isChecked = false;
  bool isChecked1 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
  bool isChecked5 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BelugaCheckbox(
              size: 16,
              value: isChecked,
              onChanged: (value) {
                setState(() {
                  isChecked = value ?? false;
                });
              },

              label: "Remember Me",
              // selectedColor: Colors.purple[400],
            ),
            const SizedBox(height: 20),
            BelugaCheckbox(
              size: 16,
              value: isChecked1,
              onChanged: (value) {
                setState(() {
                  isChecked1 = value ?? false;
                });
              },
              label: "Remember Me",
              selectedBorderColor: AppColors.radiocolor,
              unselectedBorderColor: AppColors.radiocolor,
              backgroundColor: const Color(0xffF4F3FF),
              // selectedColor: Colors.purple[400],
            ),
            const SizedBox(height: 20),
            BelugaCheckbox(
              size: 16,
              value: isChecked3,

              onChanged: (value) {
                setState(() {
                  isChecked3 = value ?? false;
                });
              },
              selectedBorderColor: AppColors.radiocolor,
              unselectedBorderColor: AppColors.radiocolor,
              showOuterGlow: true,
              label: "Remember Me",
              backgroundColor: const Color(0xffF4F3FF),

              // selectedColor: Colors.purple[400],
            ),
            const SizedBox(
              height: 20,
            ),
            BelugaCheckbox(
              size: 16,
              value: isChecked4,

              onChanged: (value) {
                setState(() {
                  isChecked4 = value ?? false;
                });
              },
              isDisabled: true,
              // showShade: true,
              label: "Remember Me",
              backgroundColor: const Color(0xffF4F3FF),

              // selectedColor: Colors.purple[400],
            ),
            const SizedBox(
              height: 20,
            ),
            BelugaCheckbox(
              size: 16,
              value: isChecked5,

              onChanged: (value) {
                setState(() {
                  isChecked5 = value ?? false;
                });
              },
              isDisabled: true,
              // showShade: true,
              label: "Remember Me",

              // selectedColor: Colors.purple[400],
            )
          ],
        ),
      ),
    );
  }
}
