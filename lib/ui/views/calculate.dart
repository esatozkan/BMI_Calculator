import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/bmi_provider.dart';

class Calculate extends StatefulWidget {
  const Calculate({super.key});

  @override
  State<Calculate> createState() => _CalculateState();
}

final Shader linearGradient = LinearGradient(
  colors: <Color>[Colors.blue.shade400, Colors.green.shade400],
).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

class _CalculateState extends State<Calculate> {
  @override
  Widget build(BuildContext context) {
    BMI bmi = Provider.of<BMI>(context, listen: false);
    double space = MediaQuery.of(context).size.height;
    double calculateBmi = bmi.bmiCalculator(bmi.getHeight, bmi.getWeight);
    Provider.of<BMI>(context, listen: false).colorText(calculateBmi);
    Provider.of<BMI>(context, listen: false).textType();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Row(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 7),
                  child: Text(
                    "BMI ",
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.lightBlueAccent,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Text(
                  "Calculator",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 24,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: space * .108,
          ),
          Center(
            child: Container(
              height: space * .378,
              width: space * .378,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(space * .032),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 4),
                    )
                  ]),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: space * .043,
                    ),
                    const Text(
                      "Your BMI is",
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                    SizedBox(
                      height: space * .001,
                    ),
                    Text(calculateBmi.toStringAsFixed(2),
                        style: TextStyle(fontSize: 80, color: bmi.getColor)),
                    SizedBox(
                      height: space * .001,
                    ),
                    const Text(
                      "kg/m2",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    SizedBox(
                      width: space * .323,
                      child: Slider(
                        thumbColor: Colors.white,
                        activeColor: bmi.getColor,
                        min: -20,
                        max: 70.0,
                        value: calculateBmi,
                        divisions: 90,
                        onChanged: (value) {
                          value = calculateBmi;
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Your weight is  ",
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        Text(
                          bmi.getText,
                          style: TextStyle(fontSize: 20, color: bmi.getColor),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: space * .08,
          ),
          const Text(
            "Healthy BMI range : 18.5 kg/m2 - 25 kg/m2",
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
          SizedBox(
            height: space * .01,
          ),
          const Text(
            "Healthy weight for the height : 56.7 kgs - 76.6 kgs",
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
          SizedBox(
            height: space * .01,
          ),
          const Text(
            "Panderal index : 131 kgs/m3",
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
