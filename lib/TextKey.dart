import 'package:flutter/material.dart';

class TextKey extends StatelessWidget {
  const TextKey(
      {Key key,
      @required this.text,
      this.onTextInput,
      this.onShifting,
      this.flex = 1,
      this.keyColor = Colors.black,
      this.keyTextColor = Colors.white,
      this.fontSize = 12.0,
      this.shift = false})
      : super(key: key);

  final VoidCallback onShifting;

  final String text;
  final bool shift;
  final ValueSetter<String> onTextInput;
  final int flex;
  final Color keyColor;
  final Color keyTextColor;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: EdgeInsets.all(1.0),
        child: Material(
            color: Colors.transparent,
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              onPressed: () {
                onTextInput?.call(text);
              },
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: keyTextColor,
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold),
              ),
              color: keyColor,
            )),
      ),
    );
  }
}

class BackspaceKey extends StatelessWidget {
  const BackspaceKey({
    Key key,
    this.onBackspace,
    this.flex = 2,
  }) : super(key: key);

  final VoidCallback onBackspace;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: FlatButton(
        child: Icon(
          Icons.backspace,
          color: Colors.white,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        onPressed: () {
          onBackspace?.call();
        },
        color: Colors.black,
      ),
    );
  }
}

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
