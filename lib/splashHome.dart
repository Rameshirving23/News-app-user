import 'package:flutter/material.dart';
import 'package:newsappuser/home.dart';
import 'package:provider/provider.dart';
import 'package:newsappuser/DatabaseServices.dart';

class SplashHome extends StatelessWidget {

  DatabaseServices provider = DatabaseServices();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamProvider.value(
        value: provider.fetchData,
        child: Home(),
      )
    );
  }
}
