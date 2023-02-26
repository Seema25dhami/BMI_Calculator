import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var weightController =
      TextEditingController(); // to get the input values and perform operations on that
  var feetController = TextEditingController();
  var inchController = TextEditingController();
  var result = "";
  var bgColor = Color.fromARGB(255, 193, 208, 233);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("BMI Calculator")),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "BMI",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: weightController,
                decoration: InputDecoration(
                  label: Text("Enter your weight (in KG)"),
                  prefixIcon: Icon(Icons.line_weight),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 11,
              ),
              TextField(
                controller: feetController,
                decoration: InputDecoration(
                  label: Text("Enter your Height (in feets)"),
                  prefixIcon: Icon(Icons.height),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 11,
              ),
              TextField(
                controller: inchController,
                decoration: InputDecoration(
                    label: Text("Enter your Height (in inches)"),
                    prefixIcon: Icon(Icons.height)),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    var weight = weightController.text.toString();
                    var feet = feetController.text.toString();
                    var inch = inchController.text.toString();
                    if (weight != "" && feet != "" && inch != "") {
                      //bmi calculate
                      var iWt = int.parse(weight);
                      var iFt = int.parse(feet);
                      var iInch = int.parse(inch);

                      var totalInch = (iFt * 12) + iInch;
                      var tCm = totalInch * 2.54;

                      var tM = tCm / 100;
                      var bmi = iWt / (tM * tM);

                      var msg = "";

                      if (bmi > 25) {
                        msg = "You're OverWeight";
                        bgColor = Colors.orange.shade200;
                      } else if (bmi < 18) {
                        msg = "You're UnderWeight";
                        bgColor = Colors.red.shade200;
                      } else {
                        msg = "You're weight is perfect";
                        bgColor = Colors.green.shade200;
                      }

                      setState(() {
                        result =
                            " $msg \nYour BMI is : ${bmi.toStringAsFixed(4)}";
                      });
                    } else {
                      setState(() {
                        result = "Please fill all the required options";
                      });
                    }
                  },
                  child: Text("Calculate")),
              SizedBox(
                height: 11,
              ),
              Text(result, style: TextStyle(fontSize: 19)),
            ]),
          ),
        ),
      ),
    );
  }
}
