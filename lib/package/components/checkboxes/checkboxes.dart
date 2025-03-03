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

class BelugaCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?>? onChanged;
  final bool showLabel;
  final String label;
  final Color? borderColor;
  final Color? selectedColor;
  final bool hasGlow;
  final double size;

  const BelugaCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.showLabel = false,
    this.label = '',
    this.borderColor,
    this.selectedColor,
    this.hasGlow = false,
    this.size = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    final isDisabled = onChanged == null;
    final Color actualBorderColor =
        isDisabled ? Colors.grey[300]! : borderColor ?? Colors.grey[300]!;
    final Color actualSelectedColor =
        isDisabled ? Colors.grey[300]! : selectedColor ?? AppColors.radiocolor;

    return GestureDetector(
      onTap: isDisabled ? null : () => onChanged?.call(!value),
      // borderRadius: BorderRadius.circular(8),
      child: Opacity(
        opacity: isDisabled ? 0.5 : 1.0,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: hasGlow
                  ? BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: actualSelectedColor.withOpacity(0.3),
                      boxShadow: [
                        BoxShadow(
                          color: actualSelectedColor.withOpacity(0.3),
                          blurRadius: 5,
                          spreadRadius: 1,
                        ),
                      ],
                    )
                  : null,
              child: Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: value ? actualSelectedColor : actualBorderColor,
                    width: 1.5,
                  ),
                  color: value
                      ? actualSelectedColor.withOpacity(0.1)
                      : Colors.transparent,
                ),
                child: value
                    ? Icon(
                        Icons.check,
                        size: size * 0.6,
                        weight: 16,
                        color: actualSelectedColor,
                      )
                    : null,
              ),
            ),
            if (showLabel)
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  label,
                  style: TextStyle(
                    color: isDisabled ? Colors.grey[400] : Colors.black87,
                    fontSize: 16,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
