import 'dart:convert';

import 'model/circle.model.dart';
import 'model/geometric.design.model.dart';
import 'model/point.model.dart';
import 'model/rectangle.model.dart';
import 'model/shape.model.dart';

testPoint() {
  Point p1 = Point(x: 10, y: 70);
  print(p1.toString());
  Point p2 = Point.fromArray([33, 44]);
  print(p2.toString());
  print(p1.distanceTo(p2).toStringAsFixed(2));
  print(p1.toJson());
  JsonEncoder jsonEncoder = JsonEncoder.withIndent("  ");
  print(jsonEncoder.convert(p1.toJson()));
  Map<String, dynamic> data = new Map();
  data['x'] = 34;
  data['y'] = 55;

  Point p3 = Point.fromJson(data);
  Point p4 = Point.fromJson({'x': 66, 'y': 44});
  print(p3.toString());
  print(p4.toString());
}

testCircle() {
  Shape shape = Circle(
      p1: const Point(
        x: 10,
        y: 20,
      ),
      p2: const Point(
        x: 30,
        y: 60,
      ));

  print(shape.toJson());
  print(shape.getPerimeter().toStringAsFixed(2));
  print(shape.getArea().toStringAsFixed(2));
  print((shape as Circle).getRadius());
  if (shape is Circle) {
    print(shape.getRadius());
  }
}

testRectangle() {
  print("===================================");
  Rectangle rect1 = Rectangle(
    p1: const Point(
      x: 67,
      y: 44,
    ),
    p2: const Point(
      x: 120,
      y: 60,
    ),
  );

  print(rect1.toJson());
  print(rect1.getHeight());
  print(rect1.getWidth());
  print(rect1.getArea());
  print(rect1.getPerimeter());
}

testGeometricDesign() {
  GeometricDesign geometricDesign = GeometricDesign();
  geometricDesign.add(Circle(
    p1: const Point(
      x: 10,
      y: 10,
    ),
    p2: const Point(
      x: 60,
      y: 60,
    ),
  ));
  geometricDesign.add(Circle(
    p1: const Point(
      x: 50,
      y: 60,
    ),
    p2: const Point(
      x: 160,
      y: 90,
    ),
  ));
  geometricDesign.add(Rectangle(
    p1: const Point(
      x: 33,
      y: 44,
    ),
    p2: const Point(
      x: 23,
      y: 89,
    ),
  ));
  geometricDesign.show();
  print("************************");
  print(geometricDesign.toJson());
  geometricDesign.save("design1.json");
}

test1GeometricDesign() {
  GeometricDesign geometricDesign = GeometricDesign.fromFile("design1.json");
  geometricDesign.show();
}

void main() {
  testPoint();
  testCircle();
  testRectangle();
  testGeometricDesign();
  test1GeometricDesign();
}
