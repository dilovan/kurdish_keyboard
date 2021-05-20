import 'package:flutter/material.dart';
import 'package:kurdish_keyboard/TextKey.dart';

class KurdishKeys extends StatefulWidget {
  KurdishKeys({
    Key key,
    this.onTextInput,
    this.onBackspace,
    this.onShifting,
    this.onDone,
    this.backgroundColor = Colors.white,
    this.keyColor = Colors.black,
    this.keyTextColor = Colors.white,
  }) : super(key: key);

  final ValueSetter<String> onTextInput;
  final VoidCallback onBackspace;
  final ValueSetter<bool> onShifting;
  final ValueGetter onDone;
  final Color backgroundColor;
  final keyColor;
  final keyTextColor;
  @override
  _KurdishKeysState createState() => _KurdishKeysState();
}

class _KurdishKeysState extends State<KurdishKeys> {
  void _textInputHandler(String text) => widget.onTextInput?.call(text);
  void _backspaceHandler() => widget.onBackspace?.call();
  void _doneHandler() => widget.onDone?.call();

  bool shift = false;
  void shifting() {
    setState(() {
      this.shift = !this.shift;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: EdgeInsets.all(3),
      color: this.widget.backgroundColor,
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      TextKey(
                        keyColor: this.widget.keyColor,
                        text: !shift ? 'ژ' : 'ذ',
                        onTextInput: _textInputHandler,
                      ),
                      TextKey(
                        keyColor: this.widget.keyColor,
                        text: shift ? '1' : '١',
                        onTextInput: _textInputHandler,
                      ),
                      TextKey(
                        keyColor: this.widget.keyColor,
                        text: shift ? '2' : '٢',
                        onTextInput: _textInputHandler,
                      ),
                      TextKey(
                        keyColor: this.widget.keyColor,
                        text: shift ? '3' : '٣',
                        onTextInput: _textInputHandler,
                      ),
                      TextKey(
                        keyColor: this.widget.keyColor,
                        text: shift ? '4' : '٤',
                        onTextInput: _textInputHandler,
                      ),
                      TextKey(
                        keyColor: this.widget.keyColor,
                        text: shift ? '5' : '٥',
                        onTextInput: _textInputHandler,
                      ),
                      TextKey(
                        keyColor: this.widget.keyColor,
                        text: shift ? '6' : '٦',
                        onTextInput: _textInputHandler,
                      ),
                      TextKey(
                        keyColor: this.widget.keyColor,
                        text: shift ? '7' : '٧',
                        onTextInput: _textInputHandler,
                      ),
                      TextKey(
                        keyColor: this.widget.keyColor,
                        text: shift ? '8' : '٨',
                        onTextInput: _textInputHandler,
                      ),
                      TextKey(
                        keyColor: this.widget.keyColor,
                        text: shift ? '9' : '٩',
                        onTextInput: _textInputHandler,
                      ),
                      TextKey(
                        keyColor: this.widget.keyColor,
                        text: shift ? '0' : '٠',
                        onTextInput: _textInputHandler,
                      ),
                      BackspaceKey(
                        onBackspace: _backspaceHandler,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: Row(children: [
                  TextKey(
                    keyColor: this.widget.keyColor,
                    text: !shift ? 'چ' : 'ظ',
                    onTextInput: _textInputHandler,
                  ),
                  TextKey(
                    keyColor: this.widget.keyColor,
                    text: shift ? 'ض' : 'ص',
                    onTextInput: _textInputHandler,
                  ),
                  TextKey(
                    keyColor: this.widget.keyColor,
                    text: shift ? 'ث' : 'پ',
                    onTextInput: _textInputHandler,
                  ),
                  TextKey(
                    fontSize: 8.0,
                    keyColor: this.widget.keyColor,
                    text: !shift ? 'ق' : 'الله',
                    onTextInput: _textInputHandler,
                  ),
                  TextKey(
                    keyColor: this.widget.keyColor,
                    text: !shift ? 'ف' : '',
                    onTextInput: _textInputHandler,
                  ),
                  TextKey(
                    keyColor: this.widget.keyColor,
                    text: !shift ? 'غ' : '',
                    onTextInput: _textInputHandler,
                  ),
                  TextKey(
                    keyColor: this.widget.keyColor,
                    text: !shift ? 'ع' : '',
                    onTextInput: _textInputHandler,
                  ),
                  TextKey(
                    keyColor: this.widget.keyColor,
                    text: !shift ? 'ھ' : '',
                    onTextInput: _textInputHandler,
                  ),
                  TextKey(
                    keyColor: this.widget.keyColor,
                    text: !shift ? 'خ' : '',
                    onTextInput: _textInputHandler,
                  ),
                  TextKey(
                    keyColor: this.widget.keyColor,
                    text: !shift ? 'ح' : '',
                    onTextInput: _textInputHandler,
                  ),
                  TextKey(
                    keyColor: this.widget.keyColor,
                    text: !shift ? 'ج' : '',
                    onTextInput: _textInputHandler,
                  ),
                  TextKey(
                    keyColor: this.widget.keyColor,
                    text: !shift ? 'د' : '',
                    onTextInput: _textInputHandler,
                  ),
                ])),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                TextKey(
                  keyColor: this.widget.keyColor,
                  text: !shift ? 'ش' : '',
                  onTextInput: _textInputHandler,
                ),
                TextKey(
                  keyColor: this.widget.keyColor,
                  text: !shift ? 'س' : '',
                  onTextInput: _textInputHandler,
                ),
                TextKey(
                  keyColor: this.widget.keyColor,
                  text: !shift ? 'ی' : 'ێ',
                  onTextInput: _textInputHandler,
                ),
                TextKey(
                  keyColor: this.widget.keyColor,
                  text: !shift ? 'ب' : 'ي',
                  onTextInput: _textInputHandler,
                ),
                TextKey(
                  keyColor: this.widget.keyColor,
                  text: !shift ? 'ل' : 'ڵ‎',
                  onTextInput: _textInputHandler,
                ),
                TextKey(
                  keyColor: this.widget.keyColor,
                  text: !shift ? 'ا' : 'أ',
                  onTextInput: _textInputHandler,
                ),
                TextKey(
                  keyColor: this.widget.keyColor,
                  text: !shift ? 'ت' : '',
                  onTextInput: _textInputHandler,
                ),
                TextKey(
                  keyColor: this.widget.keyColor,
                  text: !shift ? 'ن' : '',
                  onTextInput: _textInputHandler,
                ),
                TextKey(
                  keyColor: this.widget.keyColor,
                  text: !shift ? 'م' : '',
                  onTextInput: _textInputHandler,
                ),
                TextKey(
                  keyColor: this.widget.keyColor,
                  text: !shift ? 'ك' : '',
                  onTextInput: _textInputHandler,
                ),
                TextKey(
                  keyColor: this.widget.keyColor,
                  text: !shift ? 'گ' : 'ط',
                  onTextInput: _textInputHandler,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                TextKey(
                  keyColor: this.widget.keyColor,
                  text: !shift ? 'ئ' : '',
                  onTextInput: _textInputHandler,
                ),
                TextKey(
                  keyColor: this.widget.keyColor,
                  text: !shift ? 'ء' : '',
                  onTextInput: _textInputHandler,
                ),
                TextKey(
                  keyColor: this.widget.keyColor,
                  text: !shift ? 'ۆ‎' : 'ؤ',
                  onTextInput: _textInputHandler,
                ),
                TextKey(
                  keyColor: this.widget.keyColor,
                  text: !shift ? 'ر' : 'ڕ',
                  onTextInput: _textInputHandler,
                ),
                TextKey(
                  fontSize: 8.0,
                  keyColor: this.widget.keyColor,
                  text: !shift ? 'لا' : 'لآ',
                  onTextInput: _textInputHandler,
                ),
                TextKey(
                  keyColor: this.widget.keyColor,
                  text: !shift ? 'ی' : 'آ',
                  onTextInput: _textInputHandler,
                ),
                TextKey(
                  keyColor: this.widget.keyColor,
                  text: !shift ? 'ە' : 'ة',
                  onTextInput: _textInputHandler,
                ),
                TextKey(
                  keyColor: this.widget.keyColor,
                  text: !shift ? 'و' : 'وو‎',
                  onTextInput: _textInputHandler,
                ),
                TextKey(
                  keyColor: this.widget.keyColor,
                  text: !shift ? 'ز' : '.',
                  onTextInput: _textInputHandler,
                ),
                TextKey(
                  keyColor: this.widget.keyColor,
                  text: !shift ? 'ڤ' : '؟',
                  onTextInput: _textInputHandler,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Shift(
                  onShifting: shifting,
                ),
                TextKey(
                  keyColor: this.widget.keyColor,
                  text: ' ',
                  flex: 2,
                  onTextInput: _textInputHandler,
                ),
                Done(
                  onDon: _doneHandler,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
