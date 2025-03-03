import 'package:beluga_design_flutter/package/components/checkboxes/radio_buttons.dart';
import 'package:beluga_design_flutter/package/utils/colors.dart';
import 'package:flutter/material.dart';

class RadioButtonScreen extends StatefulWidget {
  const RadioButtonScreen({super.key});

  @override
  State<RadioButtonScreen> createState() => _RadioButtonScreenState();
}

class _RadioButtonScreenState extends State<RadioButtonScreen> {
   String _selectedOption = 'Option 1';
  String selectedOption2 = 'Option 2';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Custom Radio Button')),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BelugaRadioButton(
                    value: 'Default',
                    groupValue: _selectedOption,
                    onChanged: (value) {
                      setState(() => _selectedOption = value!);
                    },
                    // color: Colors.grey,
                    // label: 'Remember Me',
                  ),
                  const SizedBox(height: 10),
                  BelugaRadioButton(
                    value: 'Custom Border',
                    groupValue: _selectedOption,
                    onChanged: (value) {
                      setState(() => _selectedOption = value!);
                    },
                    borderColor: AppColors.radiocolor,
                    // label: 'Custom Border',
                    showUnselectedFill: true,
                    showSelectedFill: true,
                  ),
                  const SizedBox(height: 10),
                  BelugaRadioButton(
                    value: 'Custom Border1',
                    groupValue: _selectedOption,
                    onChanged: (value) {
                      setState(() => _selectedOption = value!);
                    },
                    borderColor: AppColors.radiocolor,
                    // label: 'Custom Border',
                    showUnselectedFill: true,
                    showOuterGlow: true,
                  ),
                  const SizedBox(height: 10),
                  BelugaRadioButton(
                    value: 'Disabled',
                    groupValue: _selectedOption,
                    onChanged: (value) {},
                    isDisabled: true,
                    // label: 'Unselected Disabled',
                  ),
                  const SizedBox(height: 10),
                  BelugaRadioButton(
                    value: 'Selected Disabled',
                    groupValue: 'Selected Disabled',
                    onChanged: (value) {},
                    isDisabled: true,
                    activeColor: Colors.grey,
                    borderColor: Colors.grey,
                    // label: 'Selected Disabled',
                  ),
                ],
              ),
              Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BelugaRadioButton(
                    value: 'Default01',
                    groupValue: selectedOption2,
                    onChanged: (value) {
                      setState(() => selectedOption2 = value!);
                    },
                    // color: Colors.grey,
                    label: 'Remember Me',
                  ),
                  const SizedBox(height: 10),
                  BelugaRadioButton(
                    value: 'Custom Borde02',
                    groupValue: selectedOption2,
                    onChanged: (value) {
                      setState(() => selectedOption2 = value!);
                    },
                    borderColor: AppColors.radiocolor,
                    label: 'Remember Me',
                    showUnselectedFill: true,
                    showSelectedFill: true,
                  ),
                  const SizedBox(height: 10),
                  BelugaRadioButton(
                    value: 'Custom Border03',
                    groupValue: selectedOption2,
                    onChanged: (value) {
                      setState(() => selectedOption2 = value!);
                    },
                    borderColor: AppColors.radiocolor,
                    label: 'Remember Me',
                    showUnselectedFill: true,
                    showOuterGlow: true,
                  ),
                  const SizedBox(height: 10),
                  BelugaRadioButton(
                    value: 'Disabled04',
                    groupValue: selectedOption2,
                    onChanged: (value) {},
                    isDisabled: true,
                    label: 'Remember Me',
                  ),
                  const SizedBox(height: 10),
                  BelugaRadioButton(
                    value: 'Selected Disabled05',
                    groupValue: selectedOption2,
                    onChanged: (value) {},
                    isDisabled: true,
                    activeColor: Colors.grey,
                    borderColor: Colors.grey,
                    label: 'Remember Me',
                  ),
                ],
              ),
            ],
          ),
        ),
      );
  }
}