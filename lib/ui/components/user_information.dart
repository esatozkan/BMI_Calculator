import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/bmi_provider.dart';

// ignore: camel_case_types
class userInformation extends StatelessWidget {
  final String image;
  final String text;
  final double maxValue;
  final double getProvider;
  final int setprovider;
  const userInformation({
    Key? key,
    required this.image,
    required this.text,
    required this.maxValue,
    required this.getProvider,
    required this.setprovider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 100,
      width: MediaQuery.of(context).size.width * .9,
      decoration: BoxDecoration(
          color: Colors.grey.shade300,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade400,
                blurRadius: 4,
                offset: const Offset(4, 4))
          ]),
      child: Row(
        children: [
          Column(
            children: [
              Container(
                height: 50,
                width: 50,
                margin: const EdgeInsets.fromLTRB(20, 10, 20, 5),
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    border: Border.all(
                      color: Colors.grey.shade400,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade500,
                          blurRadius: 3,
                          offset: const Offset(3, 3))
                    ]),
                child: Image.asset(
                  image,
                  color: Colors.black87,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                text,
                style: const TextStyle(color: Colors.black87, fontSize: 16),
              ),
            ],
          ),
          SizedBox(
            width: 250,
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                  activeTrackColor: Colors.grey.shade200,
                  inactiveTrackColor: Colors.grey.shade200,
                  valueIndicatorColor: Colors.black54),
              child: Slider(
                  min: 0,
                  max: maxValue,
                  value: getProvider,
                  thumbColor: Colors.grey.shade200,
                  activeColor: Colors.black54,
                  inactiveColor: Colors.black54,
                  divisions: maxValue.toInt(),
                  label: '$getProvider',
                  onChanged: (double value) {
                    if (setprovider == 1) {
                      Provider.of<BMI>(context, listen: false).setAge(value);
                    } else if (setprovider == 2) {
                      Provider.of<BMI>(context, listen: false).setHight(value);
                    } else if (setprovider == 3) {
                      Provider.of<BMI>(context, listen: false).setWeight(value);
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
