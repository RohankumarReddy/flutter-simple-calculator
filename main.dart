import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String input = "";
  String Calculated = "";
  String Operator = "";

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width / 5;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center, // ✅ Center vertically
          children: [
            Column(
              children: [
                Container(
                    height: 150,
                    alignment: Alignment.center, // ✅ Center text
                    child: Text(
                      input,
                      style: TextStyle(color: Colors.white, fontSize: 60),
                    )),
                Row(
                  children: [
                    calc("7", size),
                    calc("8", size),
                    calc("9", size),
                    calc("/", size),
                  ],
                ),
                Row(
                  children: [
                    calc("4", size),
                    calc("5", size),
                    calc("6", size),
                    calc("*", size),
                  ],
                ),
                Row(
                  children: [
                    calc("1", size),
                    calc("2", size),
                    calc("3", size),
                    calc("-", size),
                  ],
                ),
                Row(
                  children: [
                    calc("0", size),
                    calc(".", size),
                    calc("=", size),
                    calc("+", size),
                  ],
                ),
                Column(
                  children: [
                    clearButton("Clear", size), 
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget calc(String txt, double size) {
    return InkWell(
      onTap: () {
        setState(() {
          if (txt == "+" || txt == "-" || txt == "*" || txt == "/") {
            Calculated = input;
            input = "";
            Operator = txt;
          } else if (txt == "=") {
            double calcc = double.parse(Calculated);
            double inputs = double.parse(input);
            if (Operator == "+") {
              input = (calcc + inputs).toString();
            } else if (Operator == "-") {
              input = (calcc - inputs).toString();
            } else if (Operator == "*") {
              input = (calcc * inputs).toString();
            } else if (Operator == "/") {
              input = (calcc / inputs).toString();
            }
          } else {
            input = input + txt;
          }
        });
      },
      child: Container(
        margin: EdgeInsets.all(10),
        height: size,
        width: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color(0xFF444444),
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        child: Text(
          txt,
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
    );
  }

  Widget clearButton(String txt, double size) {
    return InkWell(
      onTap: () {
        setState(() {
          input = "";
          Calculated = "";
          Operator = "";
        });
      },
      child: Container(
        margin: EdgeInsets.all(10),
        height: size,
        width: size * 2, // wider Clear button
        alignment: Alignment.center,
        child: Text(
          txt,
          style: TextStyle(color: Colors.red, fontSize: 25),
        ),
      ),
    );
  }
}
