import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String alldigits = '0';
  double result = 0.0;

   calcualteValue(String number, String operator) {
    setState(() {
      print(number + "  " + operator);
      while(operator == 'null'){
        alldigits = alldigits + number;
      }
      if(operator == 'null'){
      double value = double.parse(number);
      print(value);
      }

    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(10.0),
      // margin: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(100.0),
            child: Text(
              "0.0",
              style: TextStyle(color: Colors.black, fontSize: 50.0),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              button("0", 'null'),
              button("C", 'clear'),
              button("/", 'divide'),
              button("*", 'multiply'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              button("7", 'null'),
              button("8", 'null'),
              button("9", 'null'),
              button("-", 'minus'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              button("4", 'null'),
              button("5", 'null'),
              button("6", 'null'),
              button("+", 'plus'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              button("1", 'null'),
              button("2", 'null'),
              button("3", 'null'),
              button("=", 'null'),
            ],
          )
        ],
      ),
    );
  }

  Widget button(String number, String operator) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        height: 50.0,
        minWidth: 80.0,
        child: Text(number,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0)),
        textColor: Colors.black,
        color: Colors.grey,
        onPressed: () {
          calcualteValue(number, operator);
        },
      ),
    );
  }

 
}
