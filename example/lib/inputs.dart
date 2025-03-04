import 'package:beluga_design_flutter/beluga_design.dart';

class InputField extends StatefulWidget {
  const InputField({super.key});

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
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
                  prefixSaxIcon: IconsaxPlusLinear.airdrop,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Center(
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
