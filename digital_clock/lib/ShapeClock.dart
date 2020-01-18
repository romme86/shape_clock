import 'dart:math';

import 'package:flutter/widgets.dart';

class ShapeClock extends CustomPainter {
  String hour = "";
  String minutes = "";
  String seconds = "";
  var _temperature = '';
  var _temperatureRange = '';
  var _condition = '';
  var _location = '';
  final _paint = Paint();
  double firstLineX = 100;
  double secondLineX = 280;
  double thirdLineX = 640;
  double fourthLineX = 740;
  double firstLineY = 200;
  double secondLineY = 400;
  double thirdLineY = 600;
  double fourthLineY = 800;
  double rowWidth = 200;
  double rowHeigth = 200;
  Color color = Color(0xffffffff);
  Canvas canvas;

  ShapeClock(this.hour, this.minutes, this.seconds, this._condition,
      this._temperature, this._location, this._temperatureRange);

  @override
  void paint(Canvas canvas, Size size) {
    this.canvas = canvas;

    _paint.color = color;
    _paint.strokeWidth = 10;
    _paint.style = PaintingStyle.stroke;
    _paint.strokeCap = StrokeCap.round;

    // enclosure
    canvas.drawCircle(Offset(400, 400), 400, _paint);

// tests
//    drawOne(color, firstLineX, firstLineY, rowWidth, rowHeigth, canvas);
//    drawTwo(color, firstLineX, secondLineY, rowWidth, rowHeigth, canvas);
//    drawThree(color, firstLineX, thirdLineY, rowWidth, rowHeigth, canvas);
//    drawFour(color, firstLineX, fourthLineY, rowWidth, rowHeigth, canvas);
//    drawFive(color, secondLineX, firstLineY, rowWidth, rowHeigth, canvas);
//    drawSix(color, secondLineX, secondLineY, rowWidth, rowHeigth, canvas);
//    drawSeven(color, secondLineX, thirdLineY, rowWidth, rowHeigth, canvas);
//    drawEight(color, secondLineX, fourthLineY, rowWidth, rowHeigth, canvas);
//    drawNine(color, firstLineX, secondLineY, rowWidth, rowHeigth, canvas);
//
    debugPrint("hour: " +
        hour +
        " decimal: " +
        hour.substring(0, 1) +
        " unit: " +
        hour.substring(1) +
        " minutes: " +
        minutes +
        " decimal: " +
        minutes.substring(0, 1) +
        " unit: " +
        minutes.substring(1) +
        " seconds: " +
        seconds +
        " decimal: " +
        seconds.substring(0, 1) +
        " unit: " +
        seconds.substring(1) +
        " contition: " +
        _condition +
        " temperature: " +
        _temperature +
        " decimal: " +
        _temperature.substring(0, 1) +
        " _temperature: " +
        _temperature.substring(1, 2));
    drawSwitchTime(seconds.substring(0, 1), color, firstLineX, secondLineY,
        rowWidth, rowHeigth, canvas);
    drawSwitchTime(seconds.substring(1), color, firstLineX, thirdLineY,
        rowWidth, rowHeigth, canvas);
    drawSwitchTime(hour.substring(0, 1), color, secondLineX, firstLineY,
        rowWidth, rowHeigth, canvas);
    drawSwitchTime(hour.substring(1), color, secondLineX, secondLineY, rowWidth,
        rowHeigth, canvas);
    drawSwitchTime(minutes.substring(0, 1), color, secondLineX, thirdLineY,
        rowWidth, rowHeigth, canvas);
    drawSwitchTime(minutes.substring(1), color, secondLineX, fourthLineY,
        rowWidth, rowHeigth, canvas);
    drawSwitchWeather(_condition, color, thirdLineX + rowWidth / 6, secondLineY + rowHeigth / 2.8, rowWidth,
        rowHeigth, canvas);

    // one day maybe temperature
//      drawSwitchTime(_temperature.substring(0,1), color, thirdLineX - rowWidth / 1.5, thirdLineY, rowWidth , rowHeigth / 2 , canvas);
//      drawSwitchTime(_temperature.substring(1,2), color, thirdLineX - rowWidth /  1.5, fourthLineY - rowHeigth / 12, rowWidth , rowHeigth / 2, canvas);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
//    drawSwitch(seconds.substring(1), color, firstLineX, firstLineY, rowWidth, rowHeigth, this.canvas);
    return true;
  }

  void drawTriangleEquilaterus(Canvas canvas, double leftCornerX,
      double leftCornerY, double size, bool reverse) {
    double reversingAmount = reverse ? size : 0;
    // base
    canvas.drawLine(Offset(leftCornerX, leftCornerY - reversingAmount),
        Offset(leftCornerX + size, leftCornerY - reversingAmount), _paint);
    // left lato
    canvas.drawLine(
        Offset(leftCornerX, leftCornerY - reversingAmount),
        Offset(leftCornerX + (size / 2), leftCornerY - size + reversingAmount),
        _paint);
    // right lato
    canvas.drawLine(
        Offset(leftCornerX + size, leftCornerY - reversingAmount),
        Offset(leftCornerX + (size / 2), leftCornerY - size + reversingAmount),
        _paint);
  }

  void drawOne(Color color, double lineX, double lineY, double rowWidth,
      double rowHeigth, Canvas canvas) {
    canvas.drawCircle(
        Offset(lineX + rowWidth / 2, lineY - rowHeigth / 2), 5, _paint);
  }

  void drawTwo(Color color, double lineX, double lineY, double rowWidth,
      double rowHeigth, Canvas canvas) {
    canvas.drawLine(Offset(lineX + rowWidth / 2 - 60, lineY - rowHeigth / 2),
        Offset(lineX + rowWidth / 2 + 60, lineY - rowHeigth / 2), _paint);
  }

  void drawThree(Color color, double lineX, double lineY, double rowWidth,
      double rowHeigth, Canvas canvas) {
    drawTriangleEquilaterus(
        canvas, lineX + rowWidth / 2 - 60, lineY - rowHeigth / 2, 120, false);
  }

  void drawFour(Color color, double lineX, double lineY, double rowWidth,
      double rowHeigth, Canvas canvas) {
    Rect rect = Offset(lineX + rowHeigth / 4, lineY - rowHeigth) &
        Size(rowHeigth / 2, rowHeigth / 2);
    canvas.drawRect(rect, _paint);
  }

  void drawFive(Color color, double lineX, double lineY, double rowWidth,
      double rowHeigth, Canvas canvas) {
    canvas.drawLine(Offset(lineX + rowWidth / 2 - 60, lineY - rowHeigth / 4),
        Offset(lineX + rowWidth / 2 + 60, lineY - rowHeigth / 4), _paint);
    canvas.drawLine(Offset(lineX + rowWidth / 2 - 60, lineY - rowHeigth / 4),
        Offset(lineX + rowWidth / 2 - 60, lineY - rowHeigth / 1.2), _paint);
    canvas.drawLine(Offset(lineX + rowWidth / 2 + 60, lineY - rowHeigth / 4),
        Offset(lineX + rowWidth / 2 + 60, lineY - rowHeigth / 1.2), _paint);
    canvas.drawLine(Offset(lineX + rowWidth / 2, lineY - rowHeigth / 2),
        Offset(lineX + rowWidth / 2 + 60, lineY - rowHeigth / 1.2), _paint);
    canvas.drawLine(Offset(lineX + rowWidth / 2, lineY - rowHeigth / 2),
        Offset(lineX + rowWidth / 2 - 60, lineY - rowHeigth / 1.2), _paint);
  }

  void drawSix(Color color, double lineX, double lineY, double rowWidth,
      double rowHeigth, Canvas canvas) {
    drawTriangleEquilaterus(
        canvas, lineX + rowWidth / 2 - 45, lineY - rowHeigth / 2, 90, false);
    drawTriangleEquilaterus(canvas, lineX + rowWidth / 2 - 45,
        lineY - rowHeigth / 2 - 30, 90, false);
  }

  void drawSeven(Color color, double lineX, double lineY, double rowWidth,
      double rowHeigth, Canvas canvas) {
    canvas.drawCircle(
        Offset(lineX + rowWidth / 2, lineY - rowHeigth / 1.3), 5, _paint);
    canvas.drawCircle(
        Offset(lineX + rowWidth / 3, lineY - rowHeigth / 2), 5, _paint);
    canvas.drawCircle(
        Offset(lineX + rowWidth / 1.5, lineY - rowHeigth / 2), 5, _paint);
    canvas.drawCircle(
        Offset(lineX + rowWidth / 2, lineY - rowHeigth / 3), 5, _paint);
    drawTriangleEquilaterus(
        canvas, lineX + rowWidth / 2 - 45, lineY - rowHeigth / 2, 90, true);
  }

  void drawEight(Color color, double lineX, double lineY, double rowWidth,
      double rowHeigth, Canvas canvas) {
    drawTriangleEquilaterus(
        canvas, lineX + rowWidth / 2 - 60, lineY - rowHeigth / 2, 120, false);
    drawTriangleEquilaterus(
        canvas, lineX + rowWidth / 2 - 60, lineY - rowHeigth / 2, 120, true);
  }

  void drawNine(Color color, double lineX, double lineY, double rowWidth,
      double rowHeigth, Canvas canvas) {
    lineY -= lineY / 4;
    lineX += rowWidth / 2;
    canvas.drawLine(
        Offset(lineX - 15, lineY), Offset(lineX - rowWidth / 4, lineY), _paint);
    canvas.drawLine(Offset(lineX - 15, lineY),
        Offset(lineX - rowWidth / 4, lineY - rowWidth / 5), _paint);
    canvas.drawLine(Offset(lineX - rowWidth / 4, lineY),
        Offset(lineX - rowWidth / 4, lineY - rowWidth / 5), _paint);

    canvas.drawLine(
        Offset(lineX + 15, lineY), Offset(lineX + rowWidth / 4, lineY), _paint);
    canvas.drawLine(Offset(lineX + 15, lineY),
        Offset(lineX + rowWidth / 4, lineY - rowWidth / 5), _paint);
    canvas.drawLine(Offset(lineX + rowWidth / 4, lineY - rowWidth / 5),
        Offset(lineX + rowWidth / 4, lineY), _paint);

    canvas.drawLine(Offset(lineX, lineY - 15),
        Offset(lineX - rowWidth / 5, lineY - rowHeigth / 4), _paint);
    canvas.drawLine(Offset(lineX, lineY - 15),
        Offset(lineX + rowWidth / 5, lineY - rowHeigth / 4), _paint);
    canvas.drawLine(Offset(lineX + rowWidth / 5, lineY - rowHeigth / 4),
        Offset(lineX - rowWidth / 5, lineY - rowHeigth / 4), _paint);
  }

  void cloud(Color color, double lineX, double lineY, double rowWidth,
      double rowHeigth, Canvas canvas) {
    lineY -= rowHeigth / 1.5;
    lineX -= rowWidth / 8;
    var paint = Paint();
    paint.color = color;
    paint.strokeWidth = 10;
    paint.style = PaintingStyle.fill;
    canvas.drawCircle(Offset(lineX, lineY), rowWidth / 4, paint);
    canvas.drawCircle(Offset(lineX + rowWidth / 5, lineY - rowHeigth / 4),
        rowWidth / 6, paint);
    canvas.drawCircle(Offset(lineX - rowWidth / 4, lineY), rowWidth / 9, paint);
    canvas.drawCircle(
        Offset(lineX + rowWidth / 2.5, lineY), rowWidth / 3, paint);
  }

  void rain(Color color, double lineX, double lineY, double rowWidth,
      double rowHeigth, Canvas canvas) {
    cloud(color, lineX, lineY, rowWidth, rowHeigth, canvas);
    rainThread(color, lineX, lineY, rowWidth, rowHeigth, canvas);
    rainThread(color, lineX - rowWidth / 6, lineY, rowWidth, rowHeigth, canvas);
    rainThread(color, lineX - rowWidth / 8, lineY, rowWidth, rowHeigth, canvas);
    rainThread(color, lineX - 1.5 * (rowWidth / 6), lineY, rowWidth, rowHeigth,
        canvas);
    rainThread(color, lineX + 1.5 * (rowWidth / 6), lineY, rowWidth, rowHeigth,
        canvas);
    rainThread(color, lineX + rowWidth / 6, lineY, rowWidth, rowHeigth, canvas);
    rainThread(color, lineX + rowWidth / 8, lineY, rowWidth, rowHeigth, canvas);
  }

  void rainThread(Color color, double lineX, double lineY, double rowWidth,
      double rowHeigth, Canvas canvas) {
    var paint = Paint();
    paint.color = color;
    paint.strokeWidth = 6;
    paint.style = PaintingStyle.fill;
    canvas.drawLine(Offset(lineX + rowWidth / 7, lineY - rowHeigth / 2),
        Offset(lineX + rowWidth / 7, lineY - rowHeigth / 2.5), paint);
    canvas.drawLine(Offset(lineX + rowWidth / 7, lineY - rowHeigth / 2.7),
        Offset(lineX + rowWidth / 7, lineY - rowHeigth / 3), paint);
    canvas.drawLine(Offset(lineX + rowWidth / 7, lineY - rowHeigth / 4),
        Offset(lineX + rowWidth / 7, lineY - rowHeigth / 5), paint);
    canvas.drawLine(Offset(lineX + rowWidth / 7, lineY - rowHeigth / 12),
        Offset(lineX + rowWidth / 7, lineY - rowHeigth / 20), paint);
  }

  void fog(Color color, double lineX, double lineY, double rowWidth,
      double rowHeigth, Canvas canvas) {
    _paint.strokeWidth = 12;
    lineX -= rowWidth / 1.5;
    double space = rowHeigth / 8;
    drawTwo(color, lineX, lineY, rowWidth, rowHeigth, canvas);
    drawTwo(color, lineX, lineY - space, rowWidth, rowHeigth, canvas);
    drawTwo(color, lineX, lineY - 2 * space, rowWidth, rowHeigth, canvas);
    drawTwo(color, lineX, lineY - 3 * space, rowWidth, rowHeigth, canvas);
    _paint.strokeWidth = 10;
  }

  void snow(Color color, double lineX, double lineY, double rowWidth,
      double rowHeigth, double thickness, Canvas canvas) {
    lineX -= rowWidth / 1.5;
    lineY -= rowHeigth / 2;
    var paint = Paint();
    paint.color = color;
    paint.strokeWidth = thickness;
    paint.style = PaintingStyle.fill;
    canvas.drawLine(
        Offset(lineX, lineY), Offset(lineX + rowWidth / 1.5, lineY), paint);
    canvas.drawLine(Offset(lineX + rowWidth / 3, lineY + rowHeigth / 3),
        Offset(lineX + rowWidth / 3, lineY - rowHeigth / 3), paint);
    canvas.drawLine(Offset(lineX + rowWidth / 6, lineY + rowHeigth / 6),
        Offset(lineX + rowWidth / 2, lineY - rowHeigth / 6), paint);
    canvas.drawLine(Offset(lineX + rowWidth / 6, lineY - rowHeigth / 6),
        Offset(lineX + rowWidth / 2, lineY + rowHeigth / 6), paint);
  }

  void sun(Color color, double lineX, double lineY, double rowWidth,
      double rowHeigth, Canvas canvas) {
    snow(color, lineX, lineY, rowWidth, rowHeigth, 10, canvas);
    var paint = Paint();
    paint.color = color;
    paint.strokeWidth = 10;
    paint.style = PaintingStyle.fill;
    lineX -= rowWidth / 3;
    lineY -= rowHeigth / 2;
    canvas.drawCircle(Offset(lineX, lineY), rowWidth / 8, paint);
  }

  void thunder(Color color, double lineX, double lineY, double rowWidth,
      double rowHeigth, Canvas canvas) {
    cloud(color, lineX, lineY, rowWidth, rowHeigth, canvas);
    var paint = Paint();
    paint.color = color;
    paint.strokeWidth = 10;
    paint.style = PaintingStyle.fill;
    lineX -= rowWidth / 3;
    lineY -= rowHeigth / 2;
    canvas.drawLine(Offset(lineX + rowWidth / 10, lineY),
        Offset(lineX + rowWidth / 3, lineY + rowHeigth / 4), paint);
    canvas.drawLine(Offset(lineX + rowWidth / 3, lineY + rowHeigth / 4),
        Offset(lineX + rowWidth / 8, lineY + rowHeigth / 7), paint);
    canvas.drawLine(Offset(lineX + rowWidth / 8, lineY + rowHeigth / 7),
        Offset(lineX + rowWidth / 3, lineY + rowHeigth / 2), paint);
  }

  void wind(Color color, double lineX, double lineY, double rowWidth,
      double rowHeigth, Canvas canvas) {
    var paint = Paint();
    paint.color = color;
    paint.strokeWidth = 10;
    paint.style = PaintingStyle.fill;
    lineX -= rowWidth / 3;
    lineY -= rowHeigth / 1.5;
    canvas.drawLine(Offset(lineX, lineY - rowHeigth / 7),
        Offset(lineX + rowWidth / 1.5, lineY - rowHeigth / 4), paint);
    canvas.drawLine(
        Offset(lineX, lineY), Offset(lineX + rowWidth / 1.5, lineY), paint);
    canvas.drawLine(Offset(lineX, lineY + rowHeigth / 8),
        Offset(lineX + rowWidth / 1.5, lineY + rowHeigth / 4), paint);
  }

  void drawSwitchTime(String time, Color color, double lineX, double lineY,
      double rowWidth, double rowHeigth, Canvas canvas) {
    if (time != null && canvas != null) {
      switch (time) {
        case "0":
          break;
        case "1":
          drawOne(color, lineX, lineY, rowWidth, rowHeigth, canvas);
          break;
        case "2":
          drawTwo(color, lineX, lineY, rowWidth, rowHeigth, canvas);
          break;
        case "3":
          drawThree(color, lineX, lineY, rowWidth, rowHeigth, canvas);
          break;
        case "4":
          drawFour(color, lineX, lineY, rowWidth, rowHeigth, canvas);
          break;
        case "5":
          drawFive(color, lineX, lineY, rowWidth, rowHeigth, canvas);
          break;
        case "6":
          drawSix(color, lineX, lineY, rowWidth, rowHeigth, canvas);
          break;
        case "7":
          drawSeven(color, lineX, lineY, rowWidth, rowHeigth, canvas);
          break;
        case "8":
          drawEight(color, lineX, lineY, rowWidth, rowHeigth, canvas);
          break;
        case "9":
          drawNine(color, lineX, lineY, rowWidth, rowHeigth, canvas);
          break;
        default:
          break;
      }
    }
  }

  void drawSwitchWeather(String weather, Color color, double lineX,
      double lineY, double rowWidth, double rowHeigth, Canvas canvas) {
    if (weather != null && canvas != null) {
      switch (weather) {
        case "cloudy":
          cloud(color, lineX, lineY, rowWidth, rowHeigth, canvas);
          break;
        case "foggy":
          fog(color, lineX, lineY, rowWidth, rowHeigth, canvas);
          break;
        case "rainy":
          rain(color, lineX, lineY, rowWidth, rowHeigth, canvas);
          break;
        case "snowy":
          snow(color, lineX, lineY, rowWidth, rowHeigth, 7, canvas);
          break;
        case "sunny":
          sun(color, lineX, lineY, rowWidth, rowHeigth, canvas);
          break;
        case "thunderstorm":
          thunder(color, lineX, lineY, rowWidth, rowHeigth, canvas);
          break;
        case "windy":
          wind(color, lineX, lineY, rowWidth, rowHeigth, canvas);
          break;
        default:
          break;
      }
    }
  }
}
