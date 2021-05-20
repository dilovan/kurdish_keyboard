import 'package:flutter/material.dart';

class Shift extends StatelessWidget {
  const Shift({
    Key key,
    this.onShifting,
    this.flex = 1,
  }) : super(key: key);

  final VoidCallback onShifting;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        onPressed: () {
          onShifting?.call();
        },
        child: Icon(
          Icons.keyboard,
          color: Colors.white,
          size: 40,
        ),
        color: Colors.black,
      ),
    );
  }
}
