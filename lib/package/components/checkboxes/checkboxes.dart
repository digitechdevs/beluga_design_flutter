import 'package:beluga_design_flutter/beluga_design.dart';

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
