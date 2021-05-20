import 'package:flutter/material.dart';

class Done extends StatelessWidget {
  const Done({
    Key key,
    this.onDon,
    this.flex = 1,
  }) : super(key: key);

  final VoidCallback onDon;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        onPressed: () {
          onDon?.call();
        },
        child: Icon(
          Icons.done_rounded,
          color: Colors.white,
          size: 40,
        ),
        color: Colors.black,
      ),
    );
  }
}
