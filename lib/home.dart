import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String expression = '';
  String result = '';
  var res = 'Result';
  String displayExpression = '';

  resetCalc() {
    setState(() {
      expression = '';
      result = '';
      res = 'Result';
      displayExpression = '';
    });
  }

  calcualteValue(String number, String operator) {
    // setState(() {

    //   displayExpression += number;
    // });
    if (operator == 'clear') {
      print(operator);
      resetCalc();
    } else if (operator == 'equals') {
      setState(() {
        res = solve(expression);
      });
    } else {
      // var list = ['*','+','-','/'];
      setState(() {
        expression += number;
        if (operator == 'null') {
          res = solve(expression);
        }

        displayExpression += number;
      });
    }
  }

  int found(var a, var l) {
    for (int i = 0; i < l.length; i++) {
      if (l[i] == a) return i;
    }
    return -1;
  }

  bool validExpression(String s) {
    if (s[0] == '*' || s[0] == '/') return false;
    var li = ['/', '*', '+', '-'];
    if (s[s.length - 1] == '.') return false;
    if (found(s[s.length - 1], li) != -1) return false;
    for (int i = 0; i < s.length - 1; i++) {
      if (s[i] == '.' && s[i + 1] == '.') return false;
    }
    for (int i = 0; i < s.length - 1; i++) {
      if (found(s[i], li) != -1 && found(s[i + 1], li) != -1) return false;
      if (s[i] == '.' && (s.codeUnitAt(i + 1) < 48 || s.codeUnitAt(i + 1) > 57))
        return false;
    }
    return true;
  }

  String solve(String s) {
    print(s);
    if (!validExpression(s)) {
      return "Error";
    }
    List<String> num = new List();
    List<String> ope = new List();
    String temp = "";
    for (int i = 0; i < s.length; i++) {
      if (s[i] == '*' || s[i] == '+' || s[i] == '/') {
        num.add(temp);
        temp = "";
        ope.add(s[i]);
      } else if (s[i] == '-') {
        if (i == 0) {
          temp += s[i];
        } else {
          num.add(temp);
          temp = "";
          ope.add('+');
          temp += s[i];
        }
      } else {
        temp += s[i];
      }
    }
    if (temp != "") {
      num.add(temp);
    }
    int idx = found('/', ope);
    while (idx != -1) {
      if (double.parse(num[idx + 1]) == 0) return "Error";
      num[idx] =
          (double.parse(num[idx]) / double.parse(num[idx + 1])).toString();
      num.removeAt(idx + 1);
      ope.removeAt(idx);
      idx = found('/', ope);
    }
    idx = found('*', ope);
    while (idx != -1) {
      num[idx] =
          (double.parse(num[idx]) * double.parse(num[idx + 1])).toString();
      num.removeAt(idx + 1);
      ope.removeAt(idx);
      idx = found('*', ope);
    }
    idx = found('+', ope);
    while (idx != -1) {
      num[idx] =
          (double.parse(num[idx]) + double.parse(num[idx + 1])).toString();
      num.removeAt(idx + 1);
      ope.removeAt(idx);
      idx = found('+', ope);
    }
    return trimZero(num[0]);
  }

  String trimZero(String s) {
    int len = s.length;
    bool ok = false;
    for (int i = 0; i < len; i++) {
      if (s[i] == '.') {
        ok = true;
        break;
      }
    }
    if (ok) {
      while (s[len - 1] == '0') {
        s = s.substring(0, len - 1);
        len = s.length;
      }
    }
    if (s[len - 1] == '.') {
      s = s.substring(0, len - 1);
    }
    return s;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      // padding: EdgeInsets.all(10.0),
      // margin: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Spacer(),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  child: Text(
                    res,
                    style: TextStyle(
                        color: res == 'Error' ? Colors.red : Colors.black,
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    displayExpression,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 33.0,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
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
              button("=", 'equals'),
            ],
          ),
          Spacer(),
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
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        child: Text(number,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0)),
        textColor: Colors.white,
        color: Colors.blue,
        onPressed: () {
          calcualteValue(number, operator);
        },
      ),
    );
  }
}
