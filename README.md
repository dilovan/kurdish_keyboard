# Kurdish keyboard in flutter

this keyboard is customized textfiled widget in flutter to input kurdish characters my be some of them is does'nt exists in default keyboards in android and ios platforms.

<p align="center">
    <img src="https://user-images.githubusercontent.com/3215461/119026441-d93bfc80-b9ad-11eb-92ae-8b3b0e77bd5b.PNG" width="330" height="567" alt="image"/>
    <img src="https://user-images.githubusercontent.com/3215461/119027034-8ca4f100-b9ae-11eb-83c1-809b90dd867e.PNG" width="330" height="567" alt="image"/>
</p>

<p align="center">
    <img src="https://user-images.githubusercontent.com/3215461/119027047-8f9fe180-b9ae-11eb-8f2d-1ab753efac50.PNG" width="330" height="567" alt="image"/>
</p>


## Getting Started

To get start implementing kurdish keyboard in your flutter app
 
Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  kurdish_keyboard: <latest version>
```

## Usage

Then you just have to import the package with

```dart
import 'package:kurdish_keyboard/kurdish_keyboard.dart';
```

To use kurdish kayboard in your app you must create kurdish keyboard as showing below:

Declare Text Edit Controller 

```dart
  TextEditingController tec = TextEditingController();
```
implement as a widget in your app

Simple example
```dart

KurdishKeyboard(
    textController: tec,
),

```

advanced example
```dart

KurdishKeyboard(
    backgroundColor: Colors.lightBlueAccent,
    keyColors: Colors.blue,
    keyTextColor: Colors.grey,
    controller: tec,
    showCursor: true,
    textStyle: TextStyle(color: Colors.blueAccent),
    decoration: InputDecoration(
        labelStyle: TextStyle(color: Colors.blueGrey),
        labelText: "گوتنێن ناڤداران",
        hintStyle: TextStyle(
        color: Colors.blueAccent,
        ),
    ),
),

```



A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
