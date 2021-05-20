library kurdish_keyboard;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kurdish_keyboard/KurdishKeys.dart';

class KurdishKeyboard extends StatefulWidget {
  KurdishKeyboard({
    Key key,
    @required this.textController,
    this.onTextInput,
    this.onBackspace,
    this.onShifting,
    this.onDone,
    this.textInputFormatter,
    this.maxLength,
    this.onEditComplete,
    this.onClick,
    this.error,
    this.autoFocus,
    this.readOnly,
    this.showCursor,
    this.cursorColor,
    this.textStyle,
    this.textDirection,
    this.maxlines,
    this.text,
    this.obscureText,
    this.onChanged,
    this.enabled,
    this.decoration,
    this.backgroundColor = Colors.transparent,
    this.keyColors = Colors.black,
    this.keyTextColor,
  }) : super(key: key);

  final TextEditingController textController;
  final ValueSetter<String> onTextInput;
  final VoidCallback onBackspace;
  final ValueSetter<bool> onShifting;
  final ValueGetter onDone;
  final String text;
  final bool obscureText, enabled;
  final Function onChanged;
  final int maxLength;
  final int maxlines;
  final TextStyle textStyle;
  final String error;
  final bool autoFocus;
  final TextDirection textDirection;
  final bool showCursor;
  final Color cursorColor;
  final bool readOnly;
  final Function onEditComplete;
  final Function onClick;
  final List<TextInputFormatter> textInputFormatter;
  final InputDecoration decoration;
  final Color backgroundColor;
  final Color keyColors;
  final Color keyTextColor;

  @override
  _KurdishKeyboardState createState() => _KurdishKeyboardState();
}

class _KurdishKeyboardState extends State<KurdishKeyboard> {
  TextEditingController _controller = TextEditingController();
  @override
  void setState(fn) {
    super.setState(fn);
    this._controller = this.widget.textController;
    this._controller.text = this._controller.text != null
        ? this._controller.text
        : this.widget.text;
  }

  void _onClick(BuildContext ctx) {
    showModalBottomSheet(
      enableDrag: false,
      context: ctx,
      builder: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: this._controller,
              style: this.widget.textStyle,
              textDirection: this.widget.textDirection != null
                  ? this.widget.textDirection
                  : TextDirection.rtl,
              autofocus: true,
              showCursor: this.widget.showCursor != null
                  ? this.widget.showCursor
                  : true,
              readOnly: true,
              cursorColor: this.widget.cursorColor,
            ),
            KurdishKeys(
              backgroundColor: this.widget.backgroundColor,
              keyColor: this.widget.keyColors,
              keyTextColor: this.widget.keyColors,
              onTextInput: (myText) {
                _insertText(myText);
              },
              onBackspace: () {
                _backspace();
              },
              onShifting: (state) {
                _shifting(!state);
              },
              onDone: () {
                _doneText();
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void _doneText() {
    this.widget.textController.text = this._controller.text;
  }

  void _insertText(String myText) {
    final text = this._controller.text != null
        ? this._controller.text
        : this.widget.text;
    final textSelection = this._controller.selection;
    final newText = text.replaceRange(
      textSelection.start,
      textSelection.end,
      myText,
    );
    final myTextLength = myText.length;
    this._controller.text = newText;
    this._controller.selection = textSelection.copyWith(
      baseOffset: textSelection.start + myTextLength,
      extentOffset: textSelection.start + myTextLength,
    );
  }

  void _backspace() {
    final text = this._controller.text;
    final textSelection = this._controller.selection;
    final selectionLength = textSelection.end - textSelection.start;

    // There is a selection.
    if (selectionLength > 0) {
      final newText = text.replaceRange(
        textSelection.start,
        textSelection.end,
        '',
      );
      this._controller.text = newText;
      this._controller.selection = textSelection.copyWith(
        baseOffset: textSelection.start,
        extentOffset: textSelection.start,
      );
      return;
    }

    // The cursor is at the beginning.
    if (textSelection.start == 0) {
      return;
    }

    // Delete the previous character
    final previousCodeUnit = text.codeUnitAt(textSelection.start - 1);
    final offset = _isUtf16Surrogate(previousCodeUnit) ? 2 : 1;
    final newStart = textSelection.start - offset;
    final newEnd = textSelection.start;
    final newText = text.replaceRange(
      newStart,
      newEnd,
      '',
    );
    this._controller.text = newText;
    this._controller.selection = textSelection.copyWith(
      baseOffset: newStart,
      extentOffset: newStart,
    );
  }

  bool _isUtf16Surrogate(int value) {
    return value & 0xF800 == 0xD800;
  }

  bool _shifting(bool state) {
    return !state;
  }

  @override
  Widget build(BuildContext context) {
    if (this._controller != null) {
      this._controller.selection = TextSelection.fromPosition(
          TextPosition(offset: this._controller.text.length));
    }
    return TextField(
      controller: this._controller != null ? this._controller : null,
      textDirection: this.widget.textDirection != null
          ? this.widget.textDirection
          : TextDirection.rtl,
      autofocus: false,
      showCursor:
          this.widget.showCursor != null ? this.widget.showCursor : true,
      readOnly: true,
      cursorColor: this.widget.cursorColor,
      onSubmitted: this.widget.onEditComplete != null
          ? this.widget.onEditComplete
          : null,
      maxLines: this.widget.maxlines,
      style: this.widget.textStyle,
      obscureText:
          this.widget.obscureText == null ? false : this.widget.obscureText,
      maxLength: this.widget.maxlines != null ? this.widget.maxlines : null,
      onChanged: this.widget.onChanged,
      enabled: this.widget.enabled != null ? this.widget.enabled : true,
      decoration: this.widget.decoration,
      onTap: () {
        _onClick(context);
      },
    );
  }
}
