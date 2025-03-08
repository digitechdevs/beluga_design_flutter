import 'package:beluga_design_flutter/beluga_design.dart';

class CustomOutlinedButton extends StatelessWidget {
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
  final SocialIcons? socialIcon; // Enum se image ya icon set hoga

  const CustomOutlinedButton({
    super.key,
    this.text = "Button CTA",
    this.onPressed,
    this.borderColor = const Color(0xFF6A35FC),
    this.textColor = const Color(0xFF6A35FC),
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
    this.socialIcon, // SVG image ke liye
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
          if (socialIcon != null) ...[
            // Agar socialIcon diya ho
            SvgPicture.asset(socialIcon!.path, width: 20, height: 20),
            const SizedBox(width: 8),
          ] else if (icon != null) ...[
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

enum SocialIcons {
  google("assets/image/social.svg"),
  facebook("assets/image/lightfb.svg"),
  apple("assets/image/apple.svg");

  final String path;
  const SocialIcons(this.path);
}
