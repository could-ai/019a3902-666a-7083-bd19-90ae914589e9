import 'package:flutter/material.dart';
import 'dart:math';

class AnimatedGridBackground extends StatefulWidget {
  const AnimatedGridBackground({super.key});

  @override
  State<AnimatedGridBackground> createState() => _AnimatedGridBackgroundState();
}

class _AnimatedGridBackgroundState extends State<AnimatedGridBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: GridPainter(_controller.value),
        );
      },
    );
  }
}

class GridPainter extends CustomPainter {
  final double animationValue;
  final List<Point> randomPoints = [];

  GridPainter(this.animationValue) {
    // Generate some random points for the glowing paths
    if (randomPoints.isEmpty) {
      for (int i = 0; i < 5; i++) {
        randomPoints.add(Point(Random().nextDouble(), Random().nextDouble()));
      }
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF1A1A2A)
      ..strokeWidth = 1.0;

    const double gridSize = 35.0;

    // Draw vertical lines
    for (double i = 0; i < size.width; i += gridSize) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }

    // Draw horizontal lines
    for (double i = 0; i < size.height; i += gridSize) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }

    // Draw glowing path animation
    final pathPaint = Paint()
      ..color = const Color(0xFF42A5F5).withOpacity(0.3)
      ..strokeWidth = 2.0
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 3.0);

    for (var point in randomPoints) {
      final path = Path();
      final startX = point.x * size.width;
      final startY = point.y * size.height;

      path.moveTo(startX, startY);

      double length = (animationValue * 4) % 1; // 0 to 1
      double dx = cos(point.x * 2 * pi) * 150 * length;
      double dy = sin(point.y * 2 * pi) * 150 * length;

      path.lineTo(startX + dx, startY + dy);
      canvas.drawPath(path, pathPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
