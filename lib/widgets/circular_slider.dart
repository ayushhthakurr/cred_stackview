// lib/widgets/circular_slider.dart
import 'package:flutter/material.dart';
import 'dart:math' as math;

class CircularSlider extends StatelessWidget {
  final double value;
  final double min;
  final double max;
  final ValueChanged<double> onChanged;

  const CircularSlider({
    Key? key,
    required this.value,
    required this.min,
    required this.max,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      child: CustomPaint(
        painter: CircularSliderPainter(
          value: (value - min) / (max - min),
          primaryColor: Theme.of(context).colorScheme.secondary,
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '₹${value.toStringAsFixed(0)}',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Text(
                '10.4% monthly',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CircularSliderPainter extends CustomPainter {
  final double value;
  final Color primaryColor;

  CircularSliderPainter({
    required this.value,
    required this.primaryColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2;

    // Background track
    final bgPaint = Paint()
      ..color = Colors.grey[800]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20;

    canvas.drawCircle(center, radius - 10, bgPaint);

    // Progress gradient
    final progressPaint = Paint()
      ..shader = SweepGradient(
        colors: [primaryColor.withOpacity(0.5), primaryColor],
        stops: const [0.0, 1.0],
      ).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - 10),
      -math.pi / 2,
      2 * math.pi * value,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}