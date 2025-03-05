import 'package:beluga_design_flutter/beluga_design.dart';

class CustomGradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const CustomGradientButton(
      {super.key, required this.text, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30), // Adjust for rounded edges
        gradient: const LinearGradient(
          colors: [Color(0xFF8862F2), Color(0xFF7544FC), Color(0xFF5B2ED4)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        border: Border.all(
          width: 1,
          color: Colors.transparent, // Border applied through painter
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFF6938EF), // Drop shadow color
            spreadRadius: 1,
            blurRadius: 0,
            offset: Offset(0, 0), // No offset
          ),
        ],
      ),
      child: CustomPaint(
        painter: GradientBorderPainter(),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

// Custom painter to create a gradient border
class GradientBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFFA787FF), Color(0xFF4F1ED8)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;
    final RRect rRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0.5, 0.5, size.width - 1, size.height - 1),
      const Radius.circular(30),
    );
    canvas.drawRRect(rRect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
