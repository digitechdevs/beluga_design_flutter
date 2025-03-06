import 'package:flutter/material.dart';

// // class CustomOutlineButton extends StatelessWidget {
// //   final String text;
// //   final VoidCallback? onPressed;
// //   final Color? backgroundColor;
// //   final Color borderColor;
// //   final Color? textColor;
// //   final double borderWidth;
// //   final double? fontSize;
// //   final double borderRadius;
// //   final EdgeInsetsGeometry? padding;
// //   final double? width;
// //   final double? height;
// //   const CustomOutlineButton(
// //       {super.key,
// //       this.backgroundColor,
// //       this.borderColor = Colors.blue,
// //       this.text = "button",
// //       this.onPressed,
// //       this.textColor,
// //       this.borderWidth = 1.0,
// //       this.fontSize,
// //       this.borderRadius = 3.0,
// //       this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
// //       this.width,
// //       this.height});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       width: width,
// //       height: height,
// //       decoration: BoxDecoration(
// //         color: backgroundColor,
// //         border: Border.all(color: borderColor, width: borderWidth),
// //         borderRadius: BorderRadius.circular(borderRadius),
// //       ),
// //       child: OutlinedButton(
// //         onPressed: onPressed,
// //         style: ButtonStyle(
// //           padding: WidgetStateProperty.all<EdgeInsetsGeometry>(padding!),
// //           foregroundColor: WidgetStateProperty.all<Color>(
// //             textColor!,
// //           ),
// //           side: WidgetStateProperty.all(BorderSide.none),
// //           shape: WidgetStateProperty.all<RoundedRectangleBorder>(
// //             RoundedRectangleBorder(
// //               borderRadius: BorderRadius.circular(borderRadius),
// //             ),
// //           ),
// //         ),
// //         child: Text(
// //           text,
// //           style: TextStyle(fontSize: fontSize, color: textColor),
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';

// class CustomOutlineButton extends StatelessWidget {
//   final String text;
//   final VoidCallback? onPressed;
//   final Color? backgroundColor;
//   final Color borderColor;
//   final Color? textColor;
//   final double borderWidth;
//   final double? fontSize;
//   final double borderRadius;
//   final EdgeInsetsGeometry? padding;
//   final double? width;
//   final double? height;

//   const CustomOutlineButton({
//     super.key,
//     this.backgroundColor,
//     this.borderColor = Colors.blue,
//     this.text = "button",
//     this.onPressed,
//     this.textColor,
//     this.borderWidth = 1.0,
//     this.fontSize,
//     this.borderRadius = 3.0,
//     this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//     this.width,
//     this.height,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: width,
//       height: height,
//       // decoration: BoxDecoration(
//       //   color: backgroundColor,
//       //   border: Border.all(color: borderColor, width: borderWidth),
//       //   borderRadius: BorderRadius.circular(borderRadius),
//       // ),
//       child: OutlinedButton(
//         onPressed: onPressed,
//         style: ButtonStyle(
//           padding: WidgetStateProperty.all(
//               padding), // Use MaterialStateProperty.all directly
//           foregroundColor: WidgetStateProperty.all(
//               textColor ?? Colors.black), // Set a default text color if null
//           side: WidgetStateProperty.all(BorderSide.), // No border side
//           shape: WidgetStateProperty.all(
//             RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(borderRadius),
//             ),
//           ),
//         ),
//         child: Text(
//           text,
//           style: TextStyle(
//               fontSize: fontSize ?? 14,
//               color: textColor ?? Colors.black), // Use default values if null
//         ),
//       ),
//     );
//   }
// }

class BelugaOutlined extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color borderColor;
  final Color textColor;
  final double fontSize;
  final double borderWidth;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final IconData? icon;
  final double iconSize;
  final double? width;
  final double? height;
  final Widget? child;
  final ButtonStyle? style;
  final bool autofocus;
  final TextStyle? textStyle;
  final String? imagePath;
  final bool showSocial;

  const BelugaOutlined(
      {super.key,
      this.text = "Button CTA",
      this.onPressed,
      this.borderColor = const Color(0xFF6A35FC), // Default Purple Color
      this.textColor = const Color(0xFF6A35FC),
      this.fontSize = 14.0,
      this.borderWidth = 2.0,
      this.borderRadius = 30.0, // High radius for pill shape
      this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      this.icon,
      this.iconSize = 20.0,
      this.width,
      this.height,
      this.child,
      this.style,
      this.autofocus = false,
      this.textStyle,
      this.imagePath,
      this.showSocial = false});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed ?? () {},
      style: style ??
          OutlinedButton.styleFrom(
            padding: padding,
            side: BorderSide(
              color: borderColor,
              width: borderWidth,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
      autofocus: autofocus,
      child: child ??
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Icon(icon, color: textColor, size: iconSize),
                const SizedBox(width: 8),
              ],
              Text(
                text,
                style: textStyle ??
                    TextStyle(
                      fontSize: fontSize,
                      color: textColor,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ],
          ),
    );
  }
}
