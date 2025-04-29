import 'dart:math' as math;
import 'package:flutter/material.dart';

class DashedRectBorder extends Border {
  final Color color;
  final double strokeWidth;
  final double dashLength;
  final double dashGap;

  const DashedRectBorder({
    this.color = Colors.black,
    this.strokeWidth = 1.0,
    this.dashLength = 5.0,
    this.dashGap = 3.0,
  });

  @override
  void paint(
    Canvas canvas,
    Rect rect, {
    TextDirection? textDirection,
    BoxShape shape = BoxShape.rectangle,
    BorderRadius? borderRadius,
  }) {
    final Paint paint =
        Paint()
          ..color = color
          ..strokeWidth = strokeWidth
          ..style = PaintingStyle.stroke;

    final Path path = Path();

    if (shape == BoxShape.circle) {
      // Handle circle shape (not implemented here for simplicity)
      return;
    }

    // Adjust rect for border radius
    RRect rrect;
    if (borderRadius != null) {
      // Resolve BorderRadius to a uniform Radius for simplicity
      final resolvedRadius =
          borderRadius
              .resolve(textDirection)
              .topLeft; // Use topLeft as uniform radius
      rrect = RRect.fromRectAndRadius(rect, resolvedRadius);
    } else {
      rrect = RRect.fromRectAndRadius(rect, Radius.zero);
    }

    // Draw dashed path for each side
    _addDashedPath(path, rrect);

    canvas.drawPath(path, paint);
  }

  void _addDashedPath(Path path, RRect rrect) {
    // Top side
    _dashLine(path, rrect.left, rrect.top, rrect.right, rrect.top);
    // Right side
    _dashLine(path, rrect.right, rrect.top, rrect.right, rrect.bottom);
    // Bottom side
    _dashLine(path, rrect.right, rrect.bottom, rrect.left, rrect.bottom);
    // Left side
    _dashLine(path, rrect.left, rrect.bottom, rrect.left, rrect.top);
  }

  void _dashLine(Path path, double x1, double y1, double x2, double y2) {
    double dx = x2 - x1;
    double dy = y2 - y1;
    double distance = math.sqrt(dx * dx + dy * dy);
    int segments = (distance / (dashLength + dashGap)).floor();
    double tDelta = 1.0 / segments;
    double t = 0.0;

    for (int i = 0; i < segments; i++) {
      if (i % 2 == 0) {
        double startT = t;
        double endT = (t + tDelta * (dashLength / (dashLength + dashGap)))
            .clamp(0.0, 1.0);
        path.moveTo(x1 + dx * startT, y1 + dy * startT);
        path.lineTo(x1 + dx * endT, y1 + dy * endT);
      }
      t += tDelta;
    }
  }

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(strokeWidth);

  @override
  Border copyWith({
    BorderSide? top,
    BorderSide? right,
    BorderSide? bottom,
    BorderSide? left,
  }) {
    return DashedRectBorder(
      color: color,
      strokeWidth: strokeWidth,
      dashLength: dashLength,
      dashGap: dashGap,
    );
  }

  @override
  Border scale(double t) {
    return DashedRectBorder(
      color: color,
      strokeWidth: strokeWidth * t,
      dashLength: dashLength * t,
      dashGap: dashGap * t,
    );
  }
}
