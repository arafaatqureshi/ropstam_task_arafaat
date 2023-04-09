import 'package:flutter/material.dart';

import '../utils/dummy_data.dart';

class CarScreen extends StatefulWidget {
  const CarScreen({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  State<CarScreen> createState() => _CarScreenState();
}

class _CarScreenState extends State<CarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text("${cars[widget.index]['name']}"),
      ),
      body: Column(
        children: [
          Column(
            children: [
              InkWell(
                  onTap: (){

                  },
                  child: Icon(Icons.edit)),
              SizedBox(height: 20,),
              InkWell(
                  onTap: (){
                    // cars.removeAt(widget.index);
                    // print(cars);
                  },
                  child: Icon(Icons.delete)),
            ],
          )

        ],
      ),
    );
  }
}
