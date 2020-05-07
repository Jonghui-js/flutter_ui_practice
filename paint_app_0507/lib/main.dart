import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Paint App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class DrawingArea {
  Offset point;
  Paint areaPaint;

  DrawingArea({this.point, this.areaPaint});
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color selectedColor;
  double strokeWidth;
  List<DrawingArea> points = [];

  @override
  void initState() {
    super.initState();
    selectedColor = Colors.black;
    strokeWidth = 2.0;
  }

  void selectColor() {
    showDialog(
        context: context,
        child: AlertDialog(
          title: const Text('색상을 선택하세요'),
          content: SingleChildScrollView(
            child: BlockPicker(
              pickerColor: selectedColor,
              onColorChanged: (color) {
                this.setState(() {
                  selectedColor = color;
                });
              },
            ),
          ),
          actions: [
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Close"),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(240, 190, 250, 1.0),
                Color.fromRGBO(220, 234, 240, 1.0),
                Color.fromRGBO(180, 228, 245, 1.0),
              ],
            ),
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: width * 0.80,
                height: height * 0.80,
                child: GestureDetector(
                  onPanDown: (details) {
                    this.setState(() {
                      points.add(DrawingArea(
                          point: details.localPosition,
                          areaPaint: Paint()
                            ..strokeCap = StrokeCap.round
                            ..isAntiAlias = true
                            ..color = selectedColor
                            ..strokeWidth = strokeWidth));
                    });
                  },
                  onPanEnd: (datails) {
                    this.setState(() {
                      points.add(null);
                    });
                  },
                  onPanUpdate: (details) {
                    this.setState(() {
                      points.add(DrawingArea(
                          point: details.localPosition,
                          areaPaint: Paint()
                            ..strokeCap = StrokeCap.round
                            ..isAntiAlias = true
                            ..color = selectedColor
                            ..strokeWidth = strokeWidth));
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    child: CustomPaint(
                      painter: MyCustomPainter(
                          points: points,
                          color: selectedColor,
                          strokeWidth: strokeWidth),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    )),
                width: width * 0.80,
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.color_lens,
                        color: selectedColor,
                      ),
                      onPressed: () {
                        selectColor();
                      },
                    ),
                    Expanded(
                      child: Slider(
                        min: 1.0,
                        max: 7.0,
                        activeColor: selectedColor,
                        value: strokeWidth,
                        onChanged: (value) {
                          this.setState(() {
                            strokeWidth = value;
                          });
                        },
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.layers_clear),
                      onPressed: () {
                        setState(() {
                          points.clear();
                        });
                        //회색 제거
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    ));
  }
}

class MyCustomPainter extends CustomPainter {
  List<DrawingArea> points;
  Color color;
  double strokeWidth;
  MyCustomPainter({this.points, this.color, this.strokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    Paint background = Paint()..color = Colors.white;
    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(rect, background);

    for (int x = 0; x < points.length - 1; x++) {
      if (points[x] != null && points[x + 1] != null) {
        Paint paint = points[x].areaPaint;
        canvas.drawLine(points[x].point, points[x + 1].point, paint);
      } else if (points[x] != null && points[x + 1] == null) {
        Paint paint = points[x].areaPaint;
        canvas.drawPoints(PointMode.points, [points[x].point], paint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldEdlegate) {
    return true;
  }
}
