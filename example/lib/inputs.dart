import 'package:beluga_design_flutter/beluga_design.dart';

class InputField extends StatefulWidget {
  const InputField({super.key});

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool _hasError = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _validateForm() {
    setState(() {
      _hasError = !_formKey.currentState!.validate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: BelugaTextField(
                  hintText: 'Enter your text here',
                  isObscure: false,
                  isSuffix: false,
                  textInputType: TextInputType.text,
                  maxLines: 1,
                  readOnly: false,
                  isEnabled: true,
                  focus: false,
                  //prefixIcon: ,
                  isPrefix: true,
                  prefixSaxIcon: IconsaxPlusLinear.user,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: BelugaTextField(
                    hintText: 'Enter your text here',
                    controller: TextEditingController(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "This field is required";
                      }
                      final emailRegex = RegExp(
                          r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
                      if (!emailRegex.hasMatch(value)) {
                        return "Enter a valid email";
                      }
                      return null; // ✅ No error (Explicitly returning null is correct)
                    },
                    //focus: _hasError, // Trigger red border when error exists

                    //  isObscure: false,
                    // isSuffix: false,
                    textInputType: TextInputType.text,
                    maxLines: 1,
                    readOnly: false,
                    isEnabled: true,
                    enableDecoration: true,
                    focus: true,
                    //prefixIcon: ,
                    isPrefix: true,
                    prefixSaxIcon: IconsaxPlusLinear.finger_scan,
                    isButtonPrefix: false, // Enables the dropdown button
                    dropdownItems: const [
                      "PAK",
                      "USD",
                      "CAD"
                    ], // Dropdown options
                    dropdownValue: "PAK", // Initially selected value
                    onDropdownChanged: (String? newValue) {
                      print("Selected value: $newValue");
                    }),
              ),
            ),
            ElevatedButton(
              onPressed: _validateForm,
              child: Text("Submit"),
            ),
            const SizedBox(
              height: 50,
            ),
            const Center(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your text here',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
