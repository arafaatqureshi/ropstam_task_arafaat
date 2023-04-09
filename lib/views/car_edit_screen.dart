import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_models/cars_view_model.dart';

class CarEditScreen extends StatefulWidget {
  final Map<String, String> car;
  final int carIndex;

  const CarEditScreen({required this.car, required this.carIndex});

  @override
  _CarEditScreenState createState() => _CarEditScreenState();
}

class _CarEditScreenState extends State<CarEditScreen> {
  final _formKey = GlobalKey<FormState>();
  late Map<String, String> _editedCar;
  String _selectedCategory = '';

  final List<String> _categories = [    'Sedan',    'SUV',    'Hatchback',    'Coupe',    'Convertible',    'Van',    'Truck',  ];

  @override
  void initState() {
    super.initState();
    _editedCar = {...widget.car};
    _selectedCategory = _editedCar["category"]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Car'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                initialValue: _editedCar["name"],
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedCar["name"] = value!;
                },
              ),

              TextFormField(
                initialValue: _editedCar["make"],
                decoration: InputDecoration(labelText: 'Make'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a make';
                  }
                  final RegExp regex = RegExp(r'^[a-zA-Z]+$');
                  if (!regex.hasMatch(value)) {
                    return 'Please enter a valid make (only letters)';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedCar["make"] = value!;
                },
              ),
              TextFormField(
                initialValue: _editedCar["model"],
                decoration: InputDecoration(labelText: 'Model'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a model year';
                  }
                  final int? modelYear = int.tryParse(value);
                  if (modelYear == null) {
                    return 'Please enter a valid model year';
                  } else if (modelYear < 1900 || modelYear > 2023) {
                    return 'Please enter a model year between 1900 and 2023';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedCar["model"] = value!;
                },
              ),
              TextFormField(
                initialValue: _editedCar["color"],
                decoration: InputDecoration(labelText: 'Color'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a color';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedCar["color"] = value!;
                },
              ),
              DropdownButtonFormField(
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
                    _selectedCategory = value.toString();
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a category';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedCar["category"] = value!;
                },
              ),
              TextFormField(
                initialValue: _editedCar["registration_no"],
                decoration: InputDecoration(labelText: 'Registration No.'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a registration number';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedCar["registration_no"] = value!;
                },
              ),
              TextFormField(
                initialValue: _editedCar["image"],
                decoration: InputDecoration(labelText: 'Image URL'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an image URL';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedCar["image"] = value!;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                child: Text('Save Changes'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Provider.of<CarsViewModel>(context, listen: false)
                        .updateCar(widget.carIndex, _editedCar);
                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}