import 'package:flutter/material.dart';

Widget getGender(String image, String text) {
  return TextButton(
    style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.transparent)),
    onPressed: () {},
    child: Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey.shade200,
          radius: 70,
          backgroundImage: AssetImage(image),
        ),
        Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.w500),
            ))
      ],
    ),
  );
}
