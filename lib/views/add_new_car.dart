import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/car_model.dart';
import '../view_models/cars_view_model.dart';

class AddNewCar extends StatefulWidget {
  @override
  _AddNewCarState createState() => _AddNewCarState();
}

class _AddNewCarState extends State<AddNewCar> {
  final _formKey = GlobalKey<FormState>();
  final _newCar = Car(
    category: '',
    name: '',
    color: '',
    model: '',
    make: '',
    registrationNo: '',
    image: 'https://cdn-icons-png.flaticon.com/512/744/744465.png',
  );
  final _categories = ['Sedan', 'SUV', 'Hatchback', 'Coupe', 'Convertible'];

  String? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Car'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownButtonFormField<String>(
                  value: _selectedCategory,
                  decoration: InputDecoration(labelText: 'Category'),
                  items: _categories.map((category) {
                    return DropdownMenuItem(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedCategory = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a category';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _newCar.category = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _newCar.name = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Color'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the color';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _newCar.color = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Model'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the model';
                    }
                    int? year = int.tryParse(value);
                    if (year == null) {
                      return 'Please enter a valid year';
                    }
                    if (year > 2023) {
                      return 'Year must be less than or equal to 2023';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _newCar.model = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Make'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the make';
                    }
                    if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                      return 'Make should only contain alphabets';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _newCar.make = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Registration No.'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the registration number';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _newCar.registrationNo = value!;
                  },
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    final form = _formKey.currentState;
                    if (form != null && form.validate()) {
                      form.save();
                      final carsProvider =
                      Provider.of<CarsViewModel>(context, listen: false);
                      carsProvider.addCar(_newCar);
                      Navigator.pop(context);
                    }
                  },
                  child: Text('Add Car'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
