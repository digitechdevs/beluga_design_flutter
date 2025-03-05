// import 'package:flutter/material.dart';

// class CustomMainFillButton extends StatelessWidget {
//   final String text;
//   final VoidCallback? onPressed;
//   final Color backgroundColor;
//   final Color textColor;
//   final double fontSize;
//   final double fontWeight;
//   final double borderRadius;
//   final EdgeInsetsGeometry padding;
//   final IconData? icon;
//   final double iconSize;
//   final double elevation;
//   final Color shadowColor;
//   final BorderSide? borderSide;
//   final double? width;
//   final double? height;
//   final Widget? child;
//   final ButtonStyle? style;
//   final bool autofocus;
//   final OutlinedBorder? shape;
//   final TextStyle? textStyle;
//   // New parameters
//   final bool showOuterBorder;
//   final Color? outerBorderColor;
//   final double outerBorderWidth;
//   final bool showOuterShadow;
//   final Color? outerShadowColor;
//   final double outerShadowBlurRadius;
//   final double outerShadowSpreadRadius;

//   const CustomMainFillButton({
//     super.key,
//     this.text = "Button",
//     this.onPressed,
//     this.backgroundColor = Colors.blue,
//     this.textColor = Colors.white,
//     this.fontSize = 16.0,
//     this.borderRadius = 8.0,
//     this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//     this.borderSide,
//     this.icon,
//     this.iconSize = 20.0,
//     this.elevation = 0,
//     this.shadowColor = Colors.black45,
//     this.width,
//     this.height,
//     this.child,
//     this.style,
//     this.autofocus = false,
//     this.shape,
//     this.textStyle,
//     this.fontWeight = 200,
//     // New parameter defaults
//     this.showOuterBorder = false,
//     this.outerBorderColor,
//     this.outerBorderWidth = 2.0,
//     this.showOuterShadow = false,
//     this.outerShadowColor,
//     this.outerShadowBlurRadius = 10.0,
//     this.outerShadowSpreadRadius = 2.0,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: width,
//       height: height,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(
//             borderRadius + (showOuterBorder ? outerBorderWidth : 0)),
//         border: showOuterBorder
//             ? Border.all(
//                 color: outerBorderColor ?? backgroundColor.withOpacity(0.2),
//                 width: outerBorderWidth,
//               )
//             : null,
//         boxShadow: [
//           if (showOuterShadow)
//             BoxShadow(
//               color: outerShadowColor ?? backgroundColor.withOpacity(0.3),
//               blurRadius: outerShadowBlurRadius,
//               spreadRadius: outerShadowSpreadRadius,
//               offset: const Offset(0, 0),
//             ),
//           if (elevation > 0)
//             BoxShadow(
//               color: shadowColor.withOpacity(0.3),
//               blurRadius: elevation,
//               offset: const Offset(0, 2),
//             ),
//         ],
//       ),
//       child: ElevatedButton(
//         onPressed: onPressed ?? () {},
//         style: style ??
//             ElevatedButton.styleFrom(
//               padding: padding,
//               backgroundColor: backgroundColor,
//               elevation: 0,
//               shape: shape ??
//                   RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(borderRadius),
//                     side: borderSide ?? BorderSide.none,
//                   ),
//             ),
//         autofocus: autofocus,
//         child: child ??
//             Row(
//               mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 if (icon != null) ...[
//                   Icon(icon, color: textColor, size: iconSize),
//                   const SizedBox(width: 8),
//                 ],
//                 Text(
//                   text,
//                   style: textStyle ??
//                       TextStyle(
//                         fontSize: fontSize,
//                         color: textColor,
//                         fontWeight: FontWeight.w500,
//                       ),
//                 ),
//               ],
//             ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class CustomMainFillButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;
  final double fontWeight;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final IconData? icon;
  final double iconSize;
  final Color shadowColor;
  final BorderSide? borderSide;
  final double? width;
  final double? height;
  final Widget? child;
  final ButtonStyle? style;
  final bool autofocus;
  final OutlinedBorder? shape;
  final TextStyle? textStyle;
  // New parameters
  final bool showOuterBorder;
  final Color? outerBorderColor;
  final double outerBorderWidth;
  final bool showOuterShadow;
  final Color? outerShadowColor;
  final double outerShadowBlurRadius;
  final double outerShadowSpreadRadius;

  const CustomMainFillButton({
    super.key,
    this.text = "Button",
    this.onPressed,
    this.backgroundColor = Colors.blue,
    this.textColor = Colors.white,
    this.fontSize = 16.0,
    this.borderRadius = 8.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    this.borderSide,
    this.icon,
    this.iconSize = 20.0,
    this.shadowColor = Colors.black45,
    this.width,
    this.height,
    this.child,
    this.style,
    this.autofocus = false,
    this.shape,
    this.textStyle,
    this.fontWeight = 200,
    // New parameter defaults
    this.showOuterBorder = false,
    this.outerBorderColor,
    this.outerBorderWidth = 2.0,
    this.showOuterShadow = false,
    this.outerShadowColor,
    this.outerShadowBlurRadius = 10.0,
    this.outerShadowSpreadRadius = 2.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          borderRadius + (showOuterBorder ? outerBorderWidth : 0),
        ),
        border: showOuterBorder
            ? Border.all(
                color: outerBorderColor ?? backgroundColor.withOpacity(0.2),
                width: outerBorderWidth,
              )
            : null,
        boxShadow: [
          if (showOuterShadow)
            BoxShadow(
              color: outerShadowColor ?? backgroundColor.withOpacity(0.3),
              blurRadius: outerShadowBlurRadius,
              spreadRadius: outerShadowSpreadRadius,
              offset: const Offset(0, 0),
            ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: style ??
            ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              backgroundColor: backgroundColor,
              elevation: 0,
              shape: shape ??
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                    side: borderSide ?? BorderSide.none,
                  ),
            ),
        autofocus: autofocus,
        child: child ??
            Padding(
              padding: padding,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment:
                    MainAxisAlignment.center, // To avoid unnecessary space
                children: [
                  if (icon != null) ...[
                    Expanded(
                        flex: 1,
                        child: Icon(icon, color: textColor, size: iconSize)),
                    // const SizedBox(width: 8), // Space between icon and text
                  ],
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Text(
                        text,
                        style: textStyle ??
                            TextStyle(
                              fontSize: fontSize,
                              color: textColor,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
      ),
    );
  }
}
