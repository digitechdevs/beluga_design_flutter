import 'package:beluga_design_flutter/beluga_design.dart';

class BelugaTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? labelText;
  final TextStyle? labelStyle;
  final String? hintText;
  final bool isButtonPrefix;
  final bool isButtonSuffix;
  final bool? isEnabled;
  bool isObscure;
  final bool isSuffix;
  final bool isPrefix;
  final VoidCallback? onTapSuffix;
  final TextInputType textInputType;
  final IconData? suffixIcon;
  final String? prefixIcon;
  final IconData prefixSaxIcon; // Dynamic prefix icon
  final IconData? suffixSaxIcon; // Dynamic prefix icon
  final String? Function(String?)? validator;
  final int maxLines;
  final bool readOnly;
  final VoidCallback? onTap;
  final void Function(String)? onChanged;
  final bool focus;
  final bool isLast;
  final Widget? prefixButton;
  final Widget? suffixButton;
  final List<String>? dropdownItems; // Dropdown options
  final String? dropdownValue; // Currently selected value
  final ValueChanged<String?>? onDropdownChanged; // Callback when changed
  final bool enableDecoration;

  BelugaTextField({
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
    this.focus = true,
    this.onChanged,
    this.validator,
    this.isLast = false,
    this.isButtonPrefix = false,
    this.prefixButton,
    this.prefixSaxIcon = IconsaxPlusLinear.user, // Default icon
    this.dropdownItems,
    this.dropdownValue,
    this.onDropdownChanged,
    this.enableDecoration = true,
    this.isButtonSuffix = false,
    this.suffixButton,
    this.suffixSaxIcon,
    this.labelText,
    this.labelStyle,
  });

  @override
  State<BelugaTextField> createState() => _BelugaTextFieldState();
}

class _BelugaTextFieldState extends State<BelugaTextField> {
  final FocusNode _focusNode = FocusNode();
  bool focused = false;
  bool hasError = false;

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Align items to the start
      children: [
        if (widget.labelText != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Text(
              widget.labelText!,
              style: widget.labelStyle ??
                  TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.gray400,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Inter'),
            ),
          ),

        // Container with BoxDecoration for the TextFormField
        Container(
          decoration: widget.enableDecoration
              ? BoxDecoration(
                  color:
                      hasError && focused ? AppColors.error100 : Colors.white,
                  // Red background only on error + focus
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: hasError && focused
                      ? [
                          BoxShadow(
                            color: AppColors.error500
                                .withOpacity(0.3), // Red shadow
                            blurRadius: 0,
                            spreadRadius: 2,
                            offset: const Offset(0, 0),
                          ),
                        ]
                      : focused
                          ? [
                              BoxShadow(
                                color: AppColors.purple400.withOpacity(0.3),
                                blurRadius: 0,
                                spreadRadius: 2,
                                offset: const Offset(0, 0),
                              ),
                            ]
                          : [],
                )
              : null,
          //clipBehavior: Clip.hardEdge,
          child: TextFormField(
            enabled: widget.isEnabled,
            focusNode: _focusNode,
            onChanged: (value) {
              final error = widget.validator?.call(value);
              if (hasError != (error != null)) {
                setState(() {
                  hasError = error != null; // Update error state
                });
              }
              widget.onChanged
                  ?.call(value); // Call the external onChanged callback
            },
            validator: widget.validator,
            textInputAction:
                widget.isLast ? TextInputAction.done : TextInputAction.next,
            onTap: widget.onTap,
            keyboardType: widget.textInputType,
            enableSuggestions: false,
            autocorrect: false,
            readOnly: widget.readOnly,
            controller: widget.controller,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            textAlign: TextAlign.start,
            cursorColor: AppColors.purple900,
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.textPrimary,
                fontFamily: 'Inter'),
            obscureText: widget.isObscure,
            maxLines: widget.maxLines,
            decoration: InputDecoration(
              fillColor: widget.isEnabled! ? Colors.white : AppColors.gray50,
              prefixIcon: widget.isPrefix
                  ? (widget.isButtonPrefix
                      ? Padding(
                          padding: const EdgeInsets.only(left: 13.0, right: 10),
                          child: widget.prefixButton ??
                              DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  icon: const Padding(
                                    padding:
                                        EdgeInsets.only(left: 3, bottom: 3),
                                    child: Icon(IconsaxPlusLinear.arrow_down,
                                        size: 22, color: AppColors.purple400),
                                  ),
                                  value: widget.dropdownValue,
                                  onChanged: widget.onDropdownChanged,
                                  items:
                                      widget.dropdownItems?.map((String item) {
                                    return DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(item),
                                    );
                                  }).toList(),
                                ),
                              ),
                        )
                      : (widget.prefixIcon != null
                          ? Icon(
                              IconsaxPlusLinear.user,
                              size: 24,
                              color: widget.isEnabled!
                                  ? AppColors.purple400
                                  : AppColors.gray400,
                            )
                          : Icon(
                              widget.prefixSaxIcon,
                              color: widget.isEnabled!
                                  ? AppColors.purple400
                                  : AppColors.gray400,
                            )))
                  : null,
              suffixIcon: widget.isSuffix
                  ? (widget.isButtonSuffix
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: widget.suffixButton ??
                              DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  icon: const Padding(
                                    padding: EdgeInsets.only(left: 2.0),
                                    child: Icon(IconsaxPlusLinear.arrow_down,
                                        size: 22, color: AppColors.purple400),
                                  ),
                                  value: widget.dropdownValue,
                                  onChanged: widget.onDropdownChanged,
                                  items:
                                      widget.dropdownItems?.map((String item) {
                                    return DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(item),
                                    );
                                  }).toList(),
                                ),
                              ),
                        )
                      : IconButton(
                          splashRadius: 25.r,
                          onPressed: widget.isEnabled!
                              ? () {
                                  setState(() {
                                    widget.isObscure = !widget.isObscure;
                                  });
                                }
                              : null,
                          icon: widget.suffixSaxIcon != null
                              ? Icon(
                                  widget.suffixSaxIcon!,
                                  color: widget.isEnabled!
                                      ? AppColors.purple400
                                      : AppColors.gray400,
                                )
                              : Icon(
                                  widget.isObscure
                                      ? IconsaxPlusLinear.eye_slash
                                      : IconsaxPlusLinear.eye,
                                  color: widget.isEnabled!
                                      ? AppColors.purple400
                                      : AppColors.gray400,
                                ),
                        ))
                  : null,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color:
                        widget.focus ? AppColors.gray400 : AppColors.gray400),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color:
                        widget.focus ? AppColors.purple400 : AppColors.gray400),
                borderRadius: BorderRadius.circular(10),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color:
                        widget.focus ? AppColors.gray300 : AppColors.gray300),
                borderRadius: BorderRadius.circular(10),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: hasError && focused
                        ? AppColors.error500
                        : AppColors
                            .error500), // Red border only on error + focus
                borderRadius: BorderRadius.circular(10),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: hasError && focused
                        ? AppColors.error500
                        : AppColors
                            .gray400), // Red border only on error + focus
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: widget.hintText ?? '',
              hintStyle: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.gray400,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Inter'),
              errorStyle: const TextStyle(height: -1, fontSize: 0),
            ),
          ),
        ),

        // Error message (placed outside the Container)
        if (hasError) // Only show if there's an error
          Padding(
            padding: EdgeInsets.only(
                top: 5.h), // Add spacing between field and error
            child: Text(
              widget.validator != null
                  ? widget.validator!(widget.controller?.text) ??
                      '' // Display error if any
                  : '', // Show empty text if no validator
              style: TextStyle(
                color: AppColors.error500,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                fontFamily: 'Inter',
              ),
            ),
          ),
      ],
    );
  }
}
