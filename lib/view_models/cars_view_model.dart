import 'package:arafaat_task_ropstam/utils/dummy_data.dart';
import 'package:flutter/foundation.dart';

import '../model/car_model.dart';

class CarsViewModel with ChangeNotifier {
  List<Map<String, String>> _cars = [
    {
      "category" : "Sedan",
      "name" : "XLI",
      "color" :  "blue",
      "model": "2018",
      "make": "corolla",
      "registration_no": "20",
      "image": "https://cdn-icons-png.flaticon.com/512/744/744465.png"
    },
    {
      "category" : "SUV",
      "name" : "Vigo",
      "color" :  "blue",
      "model": "2019",
      "make": "corolla",
      "registration_no": "20",
      "image": "https://cdn-icons-png.flaticon.com/512/744/744465.png"

    },
  ];

  List<Map<String, String>> get cars => _cars;

  void addCar(Car newCar) {
    final newCarMap = {
      'category': newCar.category,
      'name': newCar.name,
      'color': newCar.color,
      'model': newCar.model,
      'make': newCar.make,
      'registration_no': newCar.registrationNo,
      'image': newCar.image,
    };
    _cars.add(newCarMap);
    notifyListeners();
  }
  void removeCar(int index) {
    _cars.removeAt(index);
    notifyListeners();
  }
  void updateCar(int index, Map<String, String> newCarData) {
    _cars[index] = newCarData;
    notifyListeners();
  }
  addRecord(){

  }

}
