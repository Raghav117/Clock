import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';

import 'graphics.dart';

void main() {

    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "MyApp",
      home: MyApp(),
    ));

}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var height;
  var width;
  var m, s, h;
  @override
  void initState() {
    h = DateTime.now().hour;
    m = DateTime.now().minute;
    s = DateTime.now().second;

    Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        h = DateTime.now().hour;
        m = DateTime.now().minute;
        s = DateTime.now().second;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft,DeviceOrientation.landscapeRight]);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Box(
                x: "H",
                count: 2,
                n: (h / 10).toInt(),
              ),
              Box(
                x: "h",
                count: 4,
                n: h % 10,
              ),
              Box(
                x: "M",
                count: 3,
                n: (m / 10).toInt(),
              ),
              Box(
                x: "m",
                count: 4,
                n: m % 10,
              ),
              Box(
                x: "S",
                count: 3,
                n: (s / 10).toInt(),
              ),
              Box(
                x: "s",
                count: 4,
                n: s % 10,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Box extends StatelessWidget {
  final String x;
  final int count;
  final int n;

  Box({
    Key key,
    this.x,
    this.count,
    this.n,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  String a = n.toRadixString(2).padLeft(count, '0');

    var height = MediaQuery.of(context).size.height;
    return Column(
      children: <Widget>[
        Text(
          x,
          style: t,
        ),
        Container(
            width: 40,
            height: height - 160,
            // color: Colors.blue,
            child: ListView.builder(
              reverse: true,
              itemCount: count,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: <Widget>[
                    Container(
                      height: 37,
                      width: 25,
                      decoration: BoxDecoration(
                          color: a[index] == '0'
                              ? Colors.grey
                              : x.toLowerCase() == "h"
                                  ? Colors.orange
                                  : x.toLowerCase() == "m"
                                      ? Colors.green
                                      : Colors.blue,
                          borderRadius: BorderRadius.circular(12)),
                          child: Center(
                            child: Text("${pow(2,count-1-index)}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: a[index] == '0'
                              ? Colors.grey
                              : x.toLowerCase() == "h"
                                  ? Colors.orange[200]
                                  : x.toLowerCase() == "m"
                                      ? Colors.green[200]
                                      : Colors.blue[200],
                              ),
                            ),
                          ),
                    ),
                    s,
                  ],
                );
              },
            )),
        s,
        Text("$n",
            style:
                x.toLowerCase() == "h" ? t1 : x.toLowerCase() == "m" ? t2 : t3),
        s,
        Text(
          n.toRadixString(2).padLeft(4, '0'),
          style: TextStyle(
              color: x.toLowerCase() == "h"
                  ? Colors.orange
                  : x.toLowerCase() == "m" ? Colors.green : Colors.blue),
        )
      ],
    );
  }
}
