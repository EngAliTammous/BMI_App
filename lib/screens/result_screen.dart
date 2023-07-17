import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    Key? key,
    required this.result,
    required this.isMale,
    required this.age,
  }) : super(key: key);

  final double result;

  final bool isMale;

  final int age;

  String get resultHealthiness{
     String text = '';
    if(result >= 30) {text = 'Obese';}
    else if (result>25 && result<30){text = 'Overweight';}
    else if(result>=18.5 && result<=24.9){text = 'Normal';}
    else {text = 'Thin';}



    return text ;

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       // leading:const Icon(Icons.arrow_back_rounded),

        title: const Text('Result Screen'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          // DefaultTextStyle
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //const Spacer(),
              Text('Gender : ${isMale ? 'Male' : 'Female'}',
              style: Theme.of(context).textTheme.headline3,
              ),
              //const Spacer(),
              Text('Result : ${result.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.headline3,
              ),
            //  const Spacer(),
              Text('Healthiness : $resultHealthiness ',
                style: Theme.of(context).textTheme.headline3,
                // في حال كانت الكلمة كبيرة هينزل سطر لكن مش هيكون بالمنتصف ف بنراعي الشي ده
                textAlign: TextAlign.center,
              ),
              Text('Age : $age',
                style: Theme.of(context).textTheme.headline3,

              ),
             // const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
