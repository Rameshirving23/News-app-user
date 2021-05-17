import 'package:flutter/material.dart';

class HelpTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Help"),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text("இந்த செயலியை பயன்படுத்தியமைக்கு நன்றி "
                ", உங்களின் கருத்துக்களை உரிமையாளருடன் பகிர /"
                "விமர்சனங்களை தெரிவிக்க :",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
            SizedBox(height: 20.0,),
            Text("மின்னஞ்சல் : rameshma022000@gmail.com",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0))
          ],
        )
      ),
    );
  }
}
