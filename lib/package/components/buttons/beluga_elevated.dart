import 'package:beluga_design_flutter/beluga_design.dart';

// class BelugaElevated extends StatelessWidget {
//   final String text;
//   final VoidCallback onPressed;
//   final BorderRadiusGeometry? borderRadius;
//   final String svgImagePath;
//   const BelugaElevated({
//     super.key,
//     required this.text,
//     required this.onPressed,
//     this.borderRadius,
//     this.svgImagePath = '',
//   });
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       decoration: BoxDecoration(
//         borderRadius: borderRadius ??
//             BorderRadius.circular(30), // Adjust for rounded edges
//         gradient: const LinearGradient(
//           colors: [Color(0xFF8862F2), Color(0xFF7544FC), Color(0xFF5B2ED4)],
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//         ),
//         border: Border.all(
//           width: 1,
//           color: Colors.transparent, // Border applied through painter
//         ),
//         boxShadow: const [
//           BoxShadow(
//             color: Color(0xFF6938EF), // Drop shadow color
//             spreadRadius: 1,
//             blurRadius: 0,
//             offset: Offset(0, 0), // No offset
//           ),
//         ],
//       ),
//       child: CustomPaint(
//         painter: GradientBorderPainter(),
//         child: ElevatedButton(
//           onPressed: onPressed,
//           style: ElevatedButton.styleFrom(
//             padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
//             backgroundColor: Colors.transparent,
//             shadowColor: Colors.transparent,
//             shape: RoundedRectangleBorder(
//               borderRadius: borderRadius ?? BorderRadius.circular(30),
//             ),
//           ),
//           child: svgImagePath.isEmpty
//               ? Text(text,
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                   ))
//               : SvgPicture.asset(svgImagePath),
//         ),
//       ),
//     );
//   }
// }

// // Custom painter to create a gradient border
// class GradientBorderPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final Paint paint = Paint()
//       ..shader = const LinearGradient(
//         colors: [Color(0xFFA787FF), Color(0xFF4F1ED8)],
//         begin: Alignment.topCenter,
//         end: Alignment.bottomCenter,
//       ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
//       ..strokeWidth = 1
//       ..style = PaintingStyle.stroke;
//     final RRect rRect = RRect.fromRectAndRadius(
//       Rect.fromLTWH(0.5, 0.5, size.width - 1, size.height - 1),
//       const Radius.circular(30),
//     );
//     canvas.drawRRect(rRect, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;
// }

class BelugaElevated extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final BorderRadiusGeometry? borderRadius;
  final String svgPath;
  final double? svgheight;
  final double? svgwidth;
  final Widget? child;

  const BelugaElevated({
    super.key,
    required this.text,
    required this.onPressed,
    this.borderRadius,
    this.svgPath = '',
    this.child, this.svgheight, this.svgwidth,
  });

  @override
  Widget build(BuildContext context) {
    BorderRadius resolvedRadius = borderRadius is BorderRadius
        ? borderRadius as BorderRadius
        : BorderRadius.circular(30);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: resolvedRadius,
        gradient: const LinearGradient(
          colors: [Color(0xFF8862F2), Color(0xFF7544FC), Color(0xFF5B2ED4)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFF6938EF),
            spreadRadius: 1,
            blurRadius: 0,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: CustomPaint(
        painter: GradientBorderPainter(resolvedRadius),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(borderRadius: resolvedRadius),
          ),
          child: svgPath.isEmpty
              ? child ??
                  Text(
                    text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  )
              : SvgPicture.asset(svgPath,
              height: svgheight,
              width: svgwidth,
              ),
        ),
      ),
    );
  }
}

class GradientBorderPainter extends CustomPainter {
  final BorderRadius borderRadius;

  GradientBorderPainter(this.borderRadius);

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

    final RRect rRect = RRect.fromRectAndCorners(
      Rect.fromLTWH(0.5, 0.5, size.width - 1, size.height - 1),
      topLeft: borderRadius.topLeft,
      topRight: borderRadius.topRight,
      bottomLeft: borderRadius.bottomLeft,
      bottomRight: borderRadius.bottomRight,
    );

    canvas.drawRRect(rRect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
