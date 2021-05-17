import 'package:flutter/material.dart';
import 'package:newsappuser/constants.dart';
import 'package:newsappuser/dataModel.dart';
import 'package:newsappuser/circle_button.dart';

class DetailedNewsCard extends StatelessWidget {

  InputModel inputModel;

  DetailedNewsCard(this.inputModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 18.0),
        child: ListView(
          children: [
            SizedBox(height: 12.0),
            Stack(
              children: [
                Container(
                  height: 220.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      image: DecorationImage(
                          image: NetworkImage(
                              inputModel.imageUrl
                          )
                      )
                  ),
                ),
                Positioned(
                  top: 5.0,
                  left: 5.0,
                  child: CircleButton(
                      Icons.arrow_back_ios,
                      (){
                        Navigator.pop(context);
                      }
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 2.0,
                    vertical: 2.0
                  ),
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(2.5),
                      child: Text(inputModel.tag,style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    color: Colors.green,
                  )
                ),
                SizedBox(height: 12.0),
              ],
            ),
            SizedBox(height: 10.0),
            Text(
              inputModel.title,
              style: kDetailContent.copyWith(color: Colors.black),
            ),
            SizedBox(height: 12.0,),
            Row(
              children: [
                Text(
                  inputModel.date,
                  style: kDetailContent,
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text(
                  "(${inputModel.day})",
                  style: kDetailContent.copyWith(color: Colors.black),
                )
              ],
            ),
            SizedBox(height: 15.0,),
            Text(
              inputModel.description,
              style: descriptionStyle,
            ),
            SizedBox(height: 25.0,),
          ],
        ),
      ),
    );
  }
}

