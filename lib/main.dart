import 'package:flutter/material.dart';
import 'package:newsappuser/home.dart';
import 'package:provider/provider.dart';
import 'package:newsappuser/DatabaseServices.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:newsappuser/splashHome.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  DatabaseServices provider = DatabaseServices();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(
        seconds: 3,
        navigateAfterSeconds: StreamProvider.value(
          value: provider.fetchData,
          child: Home(),
        ),
        title: new Text('தமிழ் Tech',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2a3c93)
          ),),
        image: new Image.asset('assets/finallaunchlogo.jpg'),
        backgroundColor: Colors.white,
        photoSize: 100.0,
        onClick: ()=>print("Flutter Egypt"),
        loaderColor: Colors.blueGrey
      )
    );
  }
}

