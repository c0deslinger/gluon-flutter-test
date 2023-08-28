import 'package:flutter/material.dart';

// custom error icon with tooltip
class CustomErrorTooltip extends StatefulWidget {
  final String message;
  const CustomErrorTooltip({super.key, required this.message});

  @override
  State<CustomErrorTooltip> createState() => _CustomErrorTooltipState();
}

class _CustomErrorTooltipState extends State<CustomErrorTooltip> {
  bool isShowErrorMessage = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        (isShowErrorMessage)
            ? Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6)),
                  child: Text(
                    widget.message,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 12),
                  child: CustomPaint(
                    size: const Size(15, 10),
                    painter: TrianglePainter(),
                  ),
                ),
              ])
            : Container(
                height: 38,
              ),
        GestureDetector(
          onTap: () {
            setState(() {
              isShowErrorMessage = !isShowErrorMessage;
            });
          },
          child: Container(
            margin: const EdgeInsets.only(right: 8),
            child: const Icon(Icons.info, color: Colors.red),
          ),
        )
      ],
    );
  }
}

// create inverted triangle
class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width / 2, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
