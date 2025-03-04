import 'package:beluga_design_flutter/beluga_design.dart';

class BelugaTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool isButtonPrefix;
  final bool? isEnabled;
  final bool isObscure;
  final bool isSuffix;
  final bool isPrefix;
  final VoidCallback? onTapSuffix;
  final TextInputType textInputType;
  final String? suffixIcon;
  final String? prefixIcon;
  final IconData prefixSaxIcon; // Dynamic prefix icon
  final String? Function(String?)? validator;
  final int maxLines;
  final bool readOnly;
  final VoidCallback? onTap;
  final void Function(String)? onChanged;
  final bool focus;
  final bool isLast;
  final Widget? prefixButton;
  final List<String>? dropdownItems; // Dropdown options
  final String? dropdownValue; // Currently selected value
  final ValueChanged<String?>? onDropdownChanged; // Callback when changed

  const BelugaTextField({
    super.key,
    this.controller,
    this.isEnabled = true,
    this.hintText,
    this.isObscure = false,
    this.isSuffix = false,
    this.isPrefix = false,
    this.prefixIcon,
    this.onTapSuffix,
    this.textInputType = TextInputType.text,
    this.suffixIcon,
    this.maxLines = 1,
    this.readOnly = false,
    this.onTap,
    this.focus = false,
    this.onChanged,
    this.validator,
    this.isLast = false,
    this.isButtonPrefix = false,
    this.prefixButton,
    this.prefixSaxIcon =
        false ? IconsaxPlusLinear.user : IconsaxPlusLinear.user, // Default icon
    this.dropdownItems,
    this.dropdownValue,
    this.onDropdownChanged,
  });

  @override
  State<BelugaTextField> createState() => _BelugaTextFieldState();
}

class _BelugaTextFieldState extends State<BelugaTextField> {
  final FocusNode _focusNode = FocusNode();
  bool focused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        focused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: focused
            ? [
                BoxShadow(
                  color: AppColors.purple400.withOpacity(0.2),
                  blurRadius: 0,
                  spreadRadius: 2,
                  offset: const Offset(0, 0),
                ),
              ]
            : [],
      ),
      child: TextFormField(
        enabled: widget.isEnabled,
        focusNode: _focusNode,
        validator: widget.validator,
        textInputAction:
            widget.isLast ? TextInputAction.done : TextInputAction.next,
        onTap: widget.onTap,
        onChanged: widget.onChanged,
        keyboardType: widget.textInputType,
        enableSuggestions: false,
        autocorrect: false,
        readOnly: widget.readOnly,
        controller: widget.controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        textAlign: TextAlign.start,
        cursorColor: AppColors.purple900,
        // style: AppTextTheme.bodyLabelBlack,
        obscureText: widget.isObscure,
        maxLines: widget.maxLines,
        decoration: InputDecoration(
          fillColor: widget.isEnabled! ? Colors.white : AppColors.gray50,
          prefixIcon: widget.isPrefix
              ? (widget.prefixIcon != null
                  ? const Icon(IconsaxPlusLinear.user,
                      size:
                          24) // Use user-defined icon (note: fixed from prefixSaxIcon)
                  : Icon(widget.prefixSaxIcon)) // Default icon
              : widget.isButtonPrefix
                  ? widget.prefixButton ?? // Allow user to provide a button widget
                      DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          icon: const Icon(Icons.keyboard_arrow_down),
                          value: widget.dropdownValue,
                          onChanged: widget.onDropdownChanged,
                          items: widget.dropdownItems?.map((String item) {
                            return DropdownMenuItem<String>(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                        ),
                      )
                  : null,

          // prefixIcon: Padding(
          //   padding: const EdgeInsets.all(12.0),
          //   child: Object.prefixIcon != null
          //       ? IconsaxPlusLinear(Object.prefixIcon!) // User-provided icon
          //       : const Icon(IconsaxPlusLinear.user,
          //           color: AppColors.purple400), // Default icon
          // ),
          // suffixIcon: widget.isSuffix
          //     ? IconButton(
          //         splashRadius: 25.r,
          //         onPressed: widget.onTapSuffix,
          //         icon: widget.suffixIcon == null
          //             ? Icon(!widget.isObscure
          //                 ? IconsaxPlusBold.eye_slash
          //                 : IconsaxPlusBold.eye)
          //             : SvgPicture.asset(widget.suffixIcon!))
          //     : null,
          // Dynamic color change

          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: widget.focus ? AppColors.gray400 : AppColors.gray400),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: widget.focus ? AppColors.gray400 : AppColors.purple400),
            borderRadius: BorderRadius.circular(10),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: widget.focus ? AppColors.gray300 : AppColors.gray300),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: widget.focus ? AppColors.error500 : AppColors.error500),
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: widget.hintText ?? '',
          hintStyle: TextStyle(
            fontSize: 14.sp,
            color: AppColors.gray400,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
