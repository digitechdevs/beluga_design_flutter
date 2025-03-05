import 'package:beluga_design_flutter/package/utils/colors.dart';
import 'package:flutter/material.dart';

class BelugaRadioButton<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final ValueChanged<T?> onChanged;
  final double size;
  final Color activeColor;
  final Color borderColor;
  final double borderWidth;
  final bool isDisabledUnselected;
  final bool isDisabledSelected;
  final String? label;
  final bool showShadow;
  final bool showUnselectedFill;
  final bool showSelectedFill;
  final Color fillColor;
  final bool showOuterGlow;

  const BelugaRadioButton({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.fillColor = const Color(0xffF4F3FF),
    this.size = 20.0,
    this.activeColor = AppColors.radiocolor,
    this.borderColor = Colors.grey,
    this.borderWidth = 2.0,
    this.isDisabledUnselected = false,
    this.isDisabledSelected = false,
    this.label,
    this.showShadow = false,
    this.showUnselectedFill = false,
    this.showSelectedFill = false,
    this.showOuterGlow = false,
  });

  @override
  // Widget build(BuildContext context) {
  //   final bool isSelected = value == groupValue;
  //   print("isSelected: $isSelected");

  //   return GestureDetector(
  //     onTap: isDisabled ? null : () => onChanged(value),
  //     child: Row(
  //       mainAxisSize: MainAxisSize.min,
  //       // crossAxisAlignment: CrossAxisAlignment.end,
  //       // mainAxisAlignment: MainAxisAlignment.start,

  //       children: [
  //         Stack(
  //           alignment: Alignment.center,
  //           children: [
  //             if (isSelected && showOuterGlow)
  //               Container(
  //                 width: size * 2,
  //                 height: size * 2,
  //                 decoration: BoxDecoration(
  //                   shape: BoxShape.circle,
  //                   color: activeColor.withOpacity(0.1),
  //                 ),
  //               ),
  //             Container(
  //               width: size * 1.5,
  //               height: size * 1.5,
  //               decoration: BoxDecoration(
  //                 shape: BoxShape.circle,
  //                 border: Border.all(
  //                   color: isDisabled
  //                       ? Colors.grey
  //                       : (isSelected ? activeColor : borderColor),
  //                   width: borderWidth,
  //                 ),
  //                 color: !isSelected && showUnselectedFill
  //                     ? borderColor.withOpacity(0.1)
  //                     : (isSelected && showSelectedFill
  //                         ? activeColor.withOpacity(0.1)
  //                         : Colors.transparent),
  //                 boxShadow: showShadow && isSelected
  //                     ? [
  //                         BoxShadow(
  //                           color: activeColor.withOpacity(0.1),
  //                           blurRadius: 4.0,
  //                           spreadRadius: 2.0,
  //                         ),
  //                       ]
  //                     : [],
  //               ),
  //               child: isSelected
  //                   ? Center(
  //                       child: Container(
  //                         width: size * 0.5,
  //                         height: size * 0.5,
  //                         decoration: BoxDecoration(
  //                           shape: BoxShape.circle,
  //                           color: isDisabled ? Colors.grey : activeColor,
  //                         ),
  //                       ),
  //                     )
  //                   : null,
  //             ),
  //           ],
  //         ),
  //         if (label != null) ...[
  //           const SizedBox(width: 8.0),
  //           Text(
  //             label!,
  //             style: TextStyle(
  //               color: isDisabled ? Colors.grey : Colors.black,
  //               fontSize: 16.0,
  //             ),
  //           ),
  //         ],
  //       ],
  //     ),
  //   );
  // }
  Widget build(BuildContext context) {
    final bool isSelected = value == groupValue;
    final double responsiveSize = MediaQuery.of(context).size.width * 0.05;
    final bool isDisabled = isDisabledUnselected || isDisabledSelected;

    return InkWell(
      onTap: isDisabled ? null : () => onChanged(value),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              if (isSelected && showOuterGlow)
                Container(
                  width: responsiveSize * 1.5,
                  height: responsiveSize * 1.5,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: activeColor.withOpacity(0.2),
                  ),
                ),
              Container(
                width: responsiveSize * 1.2,
                height: responsiveSize * 1.2,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isDisabled
                        ? Colors.grey.shade300
                        : (isSelected ? activeColor : borderColor),
                    width: borderWidth,
                  ),
                  color: isDisabled
                      ? Colors.grey.shade300
                      : (!isSelected && showUnselectedFill
                          ? fillColor
                          : (isSelected && showSelectedFill
                              ? fillColor
                              : Colors.transparent)),
                  boxShadow: showShadow && isSelected
                      ? [
                          BoxShadow(
                            color: activeColor.withOpacity(0.5),
                            blurRadius: 4.0,
                            spreadRadius: 2.0,
                          ),
                        ]
                      : [],
                ),
                child: isDisabledSelected || isSelected
                    ? Center(
                        child: Container(
                          width: responsiveSize * 0.5,
                          height: responsiveSize * 0.5,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isDisabledSelected
                                ? Colors.grey.shade400
                                : activeColor,
                          ),
                        ),
                      )
                    : null,
              ),
            ],
          ),
          if (label != null) ...[
            const SizedBox(width: 8.0),
            Text(
              label!,
              style: TextStyle(
                  color: isDisabled ? Colors.grey : Colors.black,
                  fontSize: responsiveSize * 0.75,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ],
      ),
    );
  }
}
