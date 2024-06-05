import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/rendering.dart';

abstract class SimpleButton extends PositionComponent with TapCallbacks {
  SimpleButton(this._iconPath, {super.position})
      : super(
          size: Vector2(300, 17),
          anchor: Anchor.center,
        );

  final Paint _borderPaint = Paint()
    ..style = PaintingStyle.stroke
    ..color = const Color.fromARGB(170, 243, 229, 33);
  final Paint _iconPaint = Paint()
    ..style = PaintingStyle.stroke
    ..color = const Color.fromARGB(170, 243, 229, 33)
    ..strokeWidth = 2;
  final Path _iconPath;

  void action();

  @override
  void render(Canvas canvas) {
    canvas.drawRRect(
      RRect.fromRectAndRadius(size.toRect(), const Radius.circular(8)),
      _borderPaint,
    );
    canvas.drawPath(_iconPath, _iconPaint);
  }

  @override
  void onTapDown(TapDownEvent event) {
    _iconPaint.color = const Color.fromARGB(255, 243, 229, 33);
    _borderPaint.color = const Color.fromARGB(255, 243, 229, 33);
  }

  @override
  void onTapUp(TapUpEvent event) {
    _iconPaint.color = const Color.fromARGB(170, 243, 229, 33);
    _borderPaint.color = const Color.fromARGB(170, 243, 229, 33);
    action();
  }

  @override
  void onTapCancel(TapCancelEvent event) {
    _iconPaint.color = const Color.fromARGB(170, 243, 229, 33);
    _borderPaint.color = const Color.fromARGB(170, 243, 229, 33);
  }
}
