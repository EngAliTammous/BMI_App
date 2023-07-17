import 'package:bmi_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

class LunchScreen extends StatefulWidget {
  const LunchScreen({Key? key}) : super(key: key);

  @override
  State<LunchScreen> createState() => _LunchScreenState();
}

class _LunchScreenState extends State<LunchScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>HomeScreen()));
    });
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Container(
          alignment: AlignmentDirectional.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd,
              colors: [
                Colors.blue.shade100,
                Colors.blue.shade900,
              ],
            ),
          ),
          child:  Text(
            'BMI APP \n Ali Tammous',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline3,
            // style: GoogleFonts.cairo(
            //   fontSize: 24,
            //   fontWeight: FontWeight.bold,
            // ),
          ),
        ),
      ),
    );
  }

}
