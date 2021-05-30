import 'package:flutter/material.dart';

class SquareShapeCorners extends StatelessWidget {
  final Widget child;

  const SquareShapeCorners({
    Key? key,
    required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
        child: Container(
          alignment: Alignment.center,
          width: 1.0,
          height: 1.0,
          child: child,
    )
    );
  }
}