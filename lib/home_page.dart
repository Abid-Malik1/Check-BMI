import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = "";
  var bgColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Check BMI"),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          // ignore: sized_box_for_whitespace
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "BMI",
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 21,
                ),
                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    label: Text(
                      'Enter your Weight (in kgs)',
                    ),
                    prefixIcon: Icon(
                      Icons.line_weight,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 11,
                ),
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                    label: Text(
                      'Enter your Height (in fit)',
                    ),
                    prefixIcon: Icon(
                      Icons.height,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 11,
                ),
                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                    label: Text(
                      'Enter your Weight (in inch)',
                    ),
                    prefixIcon: Icon(
                      Icons.height,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    var wt = wtController.text.toString();
                    var ft = ftController.text.toString();
                    var inch = inController.text.toString();

                    if (wt != "" && ft != "" && inch != "") {
                      var iWt = int.parse(wt);
                      var iFt = int.parse(ft);
                      var iInch = int.parse(inch);

                      var tInch = (iFt * 12) + iInch;

                      var tCm = tInch * 2.54;

                      var tM = tCm / 100;

                      var bmi = iWt / (tM * tM);

                      var msg = "";

                      if (bmi > 25) {
                        msg = "You're OverWeight!!";
                        bgColor = Colors.red;
                      } else if (bmi < 18) {
                        msg = "You're  UnderWeight!!";
                        bgColor = Colors.red.shade300;
                      } else {
                        msg = "You're Healthy!!";
                        bgColor = Colors.greenAccent;
                      }

                      setState(() {
                        result =
                            "$msg \n Your BMI is: ${bmi.toStringAsFixed(4)}";
                      });
                    } else {
                      setState(() {
                        result = "please fill the all required field";
                      });
                    }
                  },
                  child: const Text(
                    'Calculate',
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  result,
                  style: TextStyle(
                    // color: Colors.red,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
