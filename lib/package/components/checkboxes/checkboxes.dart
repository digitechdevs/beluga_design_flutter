// import 'package:beluga_design_flutter/package/utils/colors.dart';
// import 'package:flutter/material.dart';

// class BelugaCheckbox extends StatelessWidget {
//   final bool value;
//   final ValueChanged<bool?> onChanged;
//   final String? label;

//   const BelugaCheckbox({
//     super.key,
//     required this.value,
//     required this.onChanged,
//     this.label,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         GestureDetector(
//             onTap: () => onChanged(!value),
//             child:  Checkbox(
//               value: value,
//               checkColor: AppColors.radiocolor,
//               activeColor: AppColors.radiocolor.withOpacity(0.15),
//               side: BorderSide(
//               color: value ? AppColors.radiocolor : Colors.transparent,
//               width: 2,
//             ),
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)), // Rounded corn

//               // side:  OutlinedBorder(
//               //   color: AppColors.radiocolor,

//               // ),
//               // focusColor: Colors.purple.shade100,
//               onChanged: (value) => onChanged(value!),
//             )),
//         if (label != null) ...[
//           const SizedBox(width: 8),
//           Text(label!, style: const TextStyle(fontSize: 16)),
//         ],
//       ],
//     );
//   }
// }

import 'package:beluga_design_flutter/beluga_design.dart';

// class BelugaCheckbox extends StatelessWidget {
//   final bool value;
//   final ValueChanged<bool?>? onChanged;
//   final bool showLabel;
//   final String label;
//   final Color? borderColor;
//   final Color? selectedColor;
//   final bool hasGlow;
//   final double size;

//   const BelugaCheckbox({
//     super.key,
//     required this.value,
//     required this.onChanged,
//     this.showLabel = false,
//     this.label = '',
//     this.borderColor,
//     this.selectedColor,
//     this.hasGlow = false,
//     this.size = 24.0,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final isDisabled = onChanged == null;
//     final Color actualBorderColor =
//         isDisabled ? Colors.grey[300]! : borderColor ?? Colors.grey[300]!;
//     final Color actualSelectedColor =
//         isDisabled ? Colors.grey[300]! : selectedColor ?? AppColors.radiocolor;

//     return GestureDetector(
//       onTap: isDisabled ? null : () => onChanged?.call(!value),
//       // borderRadius: BorderRadius.circular(8),
//       child: Opacity(
//         opacity: isDisabled ? 0.5 : 1.0,
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Container(
//               decoration: hasGlow
//                   ? BoxDecoration(
//                       borderRadius: BorderRadius.circular(6),
//                       color: actualSelectedColor.withOpacity(0.1),
//                       // boxShadow: [
//                       //   BoxShadow(
//                       //     color: actualSelectedColor.withOpacity(0.3),
//                       //     blurRadius: 5,
//                       //     spreadRadius: 1,
//                       //   ),
//                       // ],
//                     )
//                   : null,
//               padding: hasGlow ? const EdgeInsets.all(3) : EdgeInsets.zero,
//               child: Container(
//                 width: size,
//                 height: size,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(6),
//                   border: Border.all(
//                     color: value ? actualSelectedColor : actualBorderColor,
//                     width: 1.5,
//                   ),
//                   color: value
//                       ? actualSelectedColor.withOpacity(0.1)
//                       : Colors.transparent,
//                 ),
//                 child: value
//                     ? Icon(
//                         Icons.check,
//                         size: size * 0.6,
//                         weight: 16,
//                         color: actualSelectedColor,
//                       )
//                     : null,
//               ),
//             ),
//             if (showLabel)
//               Padding(
//                 padding: const EdgeInsets.only(left: 8.0),
//                 child: Text(
//                   label,
//                   style: TextStyle(
//                     color: isDisabled ? Colors.grey[400] : Colors.black87,
//                     fontSize: 16,
//                   ),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class BelugaCheckbox extends StatelessWidget {
//   final bool isChecked;
//   final ValueChanged<bool?>? onChanged;
//   final Color unselectedColor;
//   final Color selectedColor;
//   final bool hasLabel;
//   final Color? backgroundColor;
//   final String label;
//   final Color? labelColor;
//   // final Color? color;
//   final bool hasShadow;
//   final Color? shadowColor;

//   const BelugaCheckbox({
//     super.key,
//     required this.isChecked,
//     required this.onChanged,
//     required this.unselectedColor,
//     required this.selectedColor,
//     this.backgroundColor = Colors.transparent,
//     this.hasLabel = false,
//     this.label = "",
//     this.labelColor,
//     this.hasShadow = false,
//     this.shadowColor,
//   });

//   @override
//   Widget build(BuildContext context) {
//     // Determine if checkbox is disabled
//     final bool isDisabled = onChanged == null;

//     return InkWell(
//       onTap: isDisabled ? null : () => onChanged?.call(!isChecked),
//       borderRadius: BorderRadius.circular(8),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Container(
//             decoration: hasShadow
//                 ? BoxDecoration(
//                     color: shadowColor ?? selectedColor.withOpacity(0.1),
//                     borderRadius: BorderRadius.circular(8),
//                   )
//                 : null,
//             padding: hasShadow ? const EdgeInsets.all(4) : EdgeInsets.zero,
//             child: Container(
//               width: 24,
//               height: 24,
//               decoration: BoxDecoration(
//                 color: isChecked
//                     ? selectedColor.withOpacity(0.1)
//                     : Colors.transparent,
//                 border: Border.all(
//                   color: isChecked ? selectedColor : unselectedColor,
//                   width: 2,
//                 ),
//                 borderRadius: BorderRadius.circular(6),
//               ),
//               child: isChecked
//                   ? Icon(
//                       Icons.check,
//                       size: 16,
//                       color: selectedColor,
//                     )
//                   : null,
//             ),
//           ),
//           if (hasLabel) ...[
//             const SizedBox(width: 8),
//             Text(
//               label,
//               style: TextStyle(
//                 color: isDisabled ? labelColor : Colors.black87,
//                 fontSize: 16,
//               ),
//             ),
//           ],
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class BelugaCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final String? label;
  final Color selectedBorderColor;
  final Color unselectedBorderColor;
  final Color backgroundColor;
  final bool showOuterGlow;
  final bool isDisabled;
  final Color shadeColor;
  final double size;

  const BelugaCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.label,
    this.selectedBorderColor = AppColors.radiocolor,
    this.unselectedBorderColor = const Color(0xffD0D5DD),
    this.backgroundColor = Colors.white,
    this.showOuterGlow = false,
    this.shadeColor = const Color(0xFFE2CFFF), // Light purple shade
    this.isDisabled = false,
    this.size = 16,
  });

  @override
  Widget build(BuildContext context) {
    Color borderColor = isDisabled
        ? const Color(0xFFD1D5DB) // Light Grey (Disabled)
        : (value ? selectedBorderColor : unselectedBorderColor);

    Color checkColor = isDisabled
        ? const Color(0xFFD1D5DB) // Light Grey (Disabled Check)
        : selectedBorderColor;

    Color bgColor = isDisabled
        ? const Color(0xFFF9FAFB)
        : backgroundColor; // Updated background

    return Opacity(
      opacity: 1.0, // Ensuring no transparency
      child: InkWell(
        onTap: isDisabled ? null : () => onChanged.call(!value),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                if (showOuterGlow) // Outer thick border (shade effect)
                  Container(
                    width: size * 1.4, // Making shade dynamically larger
                    height: size * 1.4,
                    decoration: BoxDecoration(
                      color: shadeColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(size * 0.5),
                    ),
                  ),
                Container(
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(size * 0.25),
                    border: Border.all(
                      color: borderColor,
                      width: size * 0.08, // Scaling border width
                    ),
                  ),
                  child: value
                      ? Icon(
                          Icons.check,
                          color: checkColor,
                          size: size * 0.75,
                          weight: 8,
                        )
                      : null,
                ),
              ],
            ),
            if (label != null) ...[
              const SizedBox(width: 8),
              Text(
                label!,
                style: TextStyle(
                  fontSize: size * 0.9,
                  color: isDisabled ? const Color(0xFFD1D5DB) : Colors.black,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
