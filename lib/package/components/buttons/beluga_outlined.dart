import 'package:beluga_design_flutter/beluga_design.dart';
import 'package:flutter_svg/svg.dart';

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

  const BelugaOutlined({
    super.key,
    this.text = "Button CTA",
    this.onPressed,
    this.borderColor = const Color(0xFF101214),
    this.textColor = const Color(0xFF101214),
    this.fontSize = 16.0,
    this.borderWidth = 2.0,
    this.borderRadius = 30.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    this.icon, // Normal Icon ke liye
    this.iconSize = 20.0,
    this.width,
    this.height,
    this.child,
    this.style,
    this.autofocus = false,
    this.textStyle,
  });

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
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            // Agar sirf normal icon diya ho
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
