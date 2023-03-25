import '/ui/components/user_information.dart';
import '/ui/providers/bmi_provider.dart';
import '/ui/views/calculate.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '/ui/components/gender.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Row(
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
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              "Body mass index (BMI) is a measure of body fat based on height and weight that applies to adult men and women",
              style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                getGender("assets/male.png", "Male"),
                getGender("assets/famele.png", "Famele"),
              ],
            ),
            Column(
              children: [
                userInformation(
                    image: "assets/age.png",
                    text: "Age",
                    maxValue: 100,
                    getProvider: Provider.of<BMI>(context).getAge,
                    setprovider: 1),
                userInformation(
                    image: "assets/height.png",
                    text: "Height(cm)",
                    maxValue: 250,
                    getProvider: Provider.of<BMI>(context).getHeight,
                    setprovider: 2),
                userInformation(
                    image: "assets/weight.png",
                    text: "weight(kg)",
                    maxValue: 200,
                    getProvider: Provider.of<BMI>(context).getWeight,
                    setprovider: 3),
                Container(
                  width: MediaQuery.of(context).size.width * .8,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(25),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.blue.shade400,
                            Colors.green.shade400
                          ])),
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Calculate(),
                            ));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Calculate your BMI",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          Container(
                              padding: const EdgeInsets.only(left: 10),
                              child: const Icon(
                                Icons.join_right,
                                color: Colors.white,
                              ))
                        ],
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
