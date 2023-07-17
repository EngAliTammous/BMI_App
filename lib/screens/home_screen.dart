import 'dart:math';

import 'package:bmi_app/container_counter_widget.dart';
import 'package:bmi_app/screens/result_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isMale = true;
  double heightVal = 170.0;

  int age = 18;

  int weight = 55;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home Screen',
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                ContainerMethod(context, 'Male'),
                ContainerMethod(context, 'Female'),
              ],
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.teal.shade300,
                    borderRadius: BorderRadius.circular(15.0)
                ),
                margin: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 0.0),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Height', style: Theme
                        .of(context)
                        .textTheme
                        .headline3,),
                    Text('${heightVal.toStringAsFixed(0)} \t cm', style: Theme
                        .of(context)
                        .textTheme
                        .headline3,),
                    Slider(
                      min: 90,
                      max: 220,
                      value: heightVal, onChanged: (newVal)=> setState((){heightVal = newVal;}),
                      activeColor: Colors.amber,


                    ),

                  ],
                ),
              ),
            ),
            Row(
              children: [
                ContainerCounter(context, 'age',),
                ContainerCounter(context, 'weight'),
              ],
            ),
            // const Spacer(),
            Container(
              width: double.infinity,
              height: MediaQuery
                  .of(context)
                  .size
                  .height / 13,
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ElevatedButton(
                onPressed: () {
                  double result = weight / pow(heightVal / 100, 2);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ResultScreen(
                      isMale: isMale, age: age, result: result,);
                  }));
                },
                style: ElevatedButton.styleFrom(

                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0))
                ),
                child: Text('Calculate', style: Theme
                    .of(context)
                    .textTheme
                    .headline3,),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Expanded ContainerMethod(BuildContext context, String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isMale = (type == 'Male') ? true : false;
          });
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
          //width: double.infinity,
          height: MediaQuery
              .of(context)
              .size
              .height / 4.5,
          decoration: BoxDecoration(
            color: ((isMale && type == 'Male') || (!isMale && type == 'Female'))
                ? Colors.teal
                : Colors.blueAccent,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(type == 'Male' ? Icons.male : Icons.female),
                const SizedBox(
                  height: 15.0,
                ),
                Text(
                  type,
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Expanded ContainerCounter(BuildContext context, String type) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(15.0),
        width: 50,
        height: MediaQuery
            .of(context)
            .size
            .height / 4.5,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                type == 'age' ? 'Age' : 'Weight',
                style: Theme
                    .of(context)
                    .textTheme
                    .headline3,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                type == 'age' ? '${age}' : '${weight}',
                style: Theme
                    .of(context)
                    .textTheme
                    .headline3,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FloatingActionButton(
                    heroTag: type == 'age' ? 'age--' : 'weight--',
                    elevation: 0,
                    onPressed: () {
                      setState(() {
                        type == 'age' ? age-- : weight--;
                      });
                    },
                    child: const Icon(
                      Icons.remove,
                      size: 25.0,
                    ),
                  ),
                  FloatingActionButton(
                    heroTag: type == 'age' ? 'age++' : 'weight++',
                    elevation: 0,
                    onPressed: () {
                      setState(() {
                        type == 'age' ? age++ : weight++;
                      });
                    },
                    child: const Icon(
                      Icons.add,
                      size: 25.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


}
