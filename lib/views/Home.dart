import 'package:arafaat_task_ropstam/utils/dummy_data.dart';
import 'package:arafaat_task_ropstam/view_models/cars_view_model.dart';
import 'package:arafaat_task_ropstam/views/car_edit_screen.dart';
import 'package:arafaat_task_ropstam/views/car_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_models/splash_service.dart';
import 'add_new_car.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  SplashService splashService = SplashService();
  @override
  Widget build(BuildContext context) {
    final carProvider = Provider.of<CarsViewModel>(context);
    final cars = carProvider.cars;
    return Scaffold(
      appBar: AppBar(
        title: Text("Ropstam Task Arafaat"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onPressed: () {
              splashService.deleteToken(context);
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => AddNewCar()),
        );
      },
        child: Icon(Icons.add),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: cars.length,
          itemBuilder: (BuildContext context, int index) {
            final car = cars[index];

            return Card(
              child: InkWell(
                onTap: (){
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) =>  CarScreen(index: index)),
                  // );
                  },
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.network("${cars[index]['image']}",height: 100,width: 100,),
                        Text("${cars[index]['name']}",style: TextStyle(fontSize: 20),),
                        Text("${cars[index]['model']}",style: TextStyle(fontSize: 20),),


                        // Image(image: NetworkImage("${cars[index]['image']}")),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(

                              children: [
                                Text("Category: ",style: TextStyle(fontSize: 20),),

                                Text("${cars[index]['category']}",style: TextStyle(fontSize: 20),),
                              ],
                            ),
                            Row(

                              children: [
                                Text("Make: ",style: TextStyle(fontSize: 20),),

                                Text("${cars[index]['make']}",style: TextStyle(fontSize: 20),),
                              ],
                            ),
                            Row(

                              children: [
                                Text("Color: ",style: TextStyle(fontSize: 20),),

                                Text("${cars[index]['color']}",style: TextStyle(fontSize: 20),),
                              ],
                            ),
                            Row(

                              children: [
                                Text("Color: ",style: TextStyle(fontSize: 20),),

                                Text("${cars[index]['color']}",style: TextStyle(fontSize: 20),),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Column(
                              children: [
                                InkWell(
                                    onTap: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => CarEditScreen(
                                            car: car,
                                            carIndex: index,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Icon(Icons.edit)),
                                SizedBox(height: 20,),
                                InkWell(
                                    onTap: (){
                                      carProvider.removeCar(index);
                                    },
                                    child: Icon(Icons.delete)),
                              ],
                            )

                          ],
                        ),

                      ],
                    )

                  ],
                ),
              )
            );

        },),

      ),

    );
  }
}
