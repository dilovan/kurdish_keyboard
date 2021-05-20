import 'package:flutter/material.dart';
import 'package:kurdish_keyboard/kurdish_keyboard.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  String s = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Kurdish Keyboard"),
          leading: Icon(
            Icons.keyboard,
            size: 40,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "تەختێ كليكێن پيتێن كوردى بو نڤێسينا پيتێن كوردێ دناڤ تێكستێ دا.",
                  textAlign: TextAlign.justify,
                  textDirection: TextDirection.rtl,
                ),
              ),
              Divider(),
              KurdishKeyboard(
                backgroundColor: Colors.lightBlueAccent,
                keyColors: Colors.blue,
                keyTextColor: Colors.grey,
                textController: t1,
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
              KurdishKeyboard(
                textController: t2,
                decoration: InputDecoration(
                  labelText: "ناڤدار",
                  hintStyle: TextStyle(
                    color: Colors.blueAccent,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      s = "${t1.text} \n ${t2.text}";
                    });
                  },
                  color: Colors.blueAccent,
                  child: Text(
                    "بەرچاڤكرن",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  s,
                  style: TextStyle(color: Colors.blueAccent),
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.justify,
                ),
              )
            ],
          ),
        ));
  }
}
