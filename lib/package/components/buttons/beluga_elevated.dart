import 'package:beluga_design_flutter/beluga_design.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

// class BelugaElevated extends StatelessWidget {
//   final String text;
//   final TextStyle? textStyle;
//   final VoidCallback onPressed;
//   final BorderRadiusGeometry? borderRadius;
//   final String svgPath;
//   final double? svgheight;
//   final double? svgwidth;
//   final Widget? child;
//   final EdgeInsetsGeometry? padding;

//   const BelugaElevated({
//     super.key,
//     required this.text,
//     required this.onPressed,
//     this.borderRadius,
//     this.svgPath = '',
//     this.child,
//     this.svgheight,
//     this.svgwidth,
//     this.textStyle,
//     this.padding,
//   });

//   @override
//   Widget build(BuildContext context) {
//     BorderRadius resolvedRadius = borderRadius is BorderRadius
//         ? borderRadius as BorderRadius
//         : BorderRadius.circular(30);

//     return Container(
//       width: double.infinity,
//       decoration: BoxDecoration(
//         borderRadius: resolvedRadius,
//         gradient: const LinearGradient(
//           colors: [Color(0xFF8862F2), Color(0xFF7544FC), Color(0xFF5B2ED4)],
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//         ),
//         boxShadow: const [
//           BoxShadow(
//             color: Color(0xFF6938EF),
//             spreadRadius: 1,
//             blurRadius: 0,
//             offset: Offset(0, 0),
//           ),
//         ],
//       ),
//       child: CustomPaint(
//         painter: GradientBorderPainter(resolvedRadius),
//         child: ElevatedButton(
//           onPressed: onPressed,
//           style: ElevatedButton.styleFrom(
//             padding: padding ??
//                 EdgeInsets.symmetric(horizontal: 40.w, vertical: 14.h),
//             backgroundColor: Colors.transparent,
//             shadowColor: Colors.transparent,
//             shape: RoundedRectangleBorder(borderRadius: resolvedRadius),
//           ),
//           child: svgPath.isEmpty
//               ? child ??
//                   Text(
//                     text,
//                     style: textStyle ??
//                         TextStyle(
//                           color: Colors.white,
//                           fontSize: 14.sp,
//                           fontWeight: FontWeight.w500,
//                         ),
//                   )
//               : SvgPicture.asset(
//                   svgPath,
//                   height: svgheight,
//                   width: svgwidth,
//                 ),
//         ),
//       ),
//     );
//   }
// }

// class GradientBorderPainter extends CustomPainter {
//   final BorderRadius borderRadius;

//   GradientBorderPainter(this.borderRadius);

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

//     final RRect rRect = RRect.fromRectAndCorners(
//       Rect.fromLTWH(0.5, 0.5, size.width - 1, size.height - 1),
//       topLeft: borderRadius.topLeft,
//       topRight: borderRadius.topRight,
//       bottomLeft: borderRadius.bottomLeft,
//       bottomRight: borderRadius.bottomRight,
//     );

//     canvas.drawRRect(rRect, paint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
// }

class BelugaElevated extends StatelessWidget {
  final String text;
  final List<Color>? colors;
  final Color? shadowColor;
  final TextStyle? textStyle;
  final VoidCallback onPressed;
  final BorderRadiusGeometry? borderRadius;
  final String svgPath;
  final double? svgheight;
  final double? svgwidth;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final bool loader, enabled;
  const BelugaElevated({
    super.key,
    required this.text,
    required this.onPressed,
    this.borderRadius,
    this.svgPath = '',
    this.colors,
    this.shadowColor,
    this.child,
    this.svgheight,
    this.svgwidth,
    this.textStyle,
    this.padding,
    this.loader = false,
    this.enabled = true,
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
        gradient: LinearGradient(
          colors: colors ??
              [Color(0xFF474B57), Color(0xFF2C333E), Color(0xFF181B20)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        boxShadow: [
          BoxShadow(
            color: shadowColor ?? Color(0xFF101214),
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
            padding: padding ??
                EdgeInsets.symmetric(horizontal: 40.w, vertical: 14.h),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(borderRadius: resolvedRadius),
          ),
          child: loader == true
              ? SizedBox(
                  width: 20.w,
                  height: 20.h,
                  child: const CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2.5,
                  ),
                )
              : svgPath.isEmpty
                  ? child ??
                      Text(
                        text,
                        style: textStyle ??
                            TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                      )
                  : SvgPicture.asset(
                      svgPath,
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
        colors: [Color(0xFF686E7B), Color(0xFF22272F)],
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
