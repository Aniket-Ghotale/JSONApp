import 'dart:convert';
import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: new HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Load Json App"),
      ),
      body: new Container(
        child: new Center(
          child: new FutureBuilder(
            future: DefaultAssetBundle
                .of(context)
                .loadString("load_json/person.json"),
            builder: (context, sanpshot) {
              var mydata = jsonDecode(sanpshot.data.toString());

              return new ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return new Card(
                      child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      new Text("Name:" + mydata[index]["name"]),
                      new Text("Age:" + mydata[index]["age"]),
                      new Text("Height:" + mydata[index]["height"]),
                      new Text("Gender:" + mydata[index]["gender"]),
                      new Text("Hair_Color:" + mydata[index]["hair_color"]),
                    ],
                  ));
                },
                itemCount: mydata == null ? 0 : mydata.length,
              );
            },
          ),
        ),
      ),
    );
  }
}
