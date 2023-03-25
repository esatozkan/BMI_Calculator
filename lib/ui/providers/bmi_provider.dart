import 'package:flutter/material.dart';
import '../../data/repo/height_repository.dart';
import '../../data/repo/weight_repository.dart';
import '/data/repo/age_repository.dart';

class BMI with ChangeNotifier {
  double _age = 0;
  double _height = 0;
  double _weight = 0;
  double _bmi = 0;
  Color _color = Colors.white;
  String _text = "";
  double get getAge => _age;
  double get getHeight => _height;
  double get getWeight => _weight;
  Color get getColor => _color;
  String get getText => _text;

  var ageRepo = AgeRepository();
  var heightRepo = HeightRepository();
  var weightRepo = WeightRepository();

  void setAge(double value) {
    _age = ageRepo.setAge(value);
    notifyListeners();
  }

  void setHight(double value) {
    _height = heightRepo.setHeight(value);
    notifyListeners();
  }

  void setWeight(double value) {
    _weight = weightRepo.setWeight(value);
    notifyListeners();
  }

  double bmiCalculator(double height, double weight) {
    _bmi = weight / ((height * height) / 10000);
    return _bmi;
  }

  Color colorText(double bmi) {
    if (bmi < 19) {
      return _color = Colors.red;
    } else if (bmi < 25) {
      return _color = Colors.green;
    } else if (bmi < 30) {
      return _color = Colors.blue;
    } else if (bmi < 35) {
      return _color = Colors.orange;
    } else if (bmi >= 35) {
      return _color = Colors.red;
    } else {
      return Colors.black;
    }
  }

  void textType() {
    if (_bmi < 19) {
      _text = "Thin";
    } else if (_bmi < 25) {
      _text = "Normal";
    } else if (_bmi < 30) {
      _text = "Plump";
    } else if (_bmi < 35) {
      _text = "obese";
    } else if (_bmi >= 35) {
      _text = "Dangerous ";
    }
  }
}
