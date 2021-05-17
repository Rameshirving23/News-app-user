import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newsappuser/constants.dart';
import 'package:newsappuser/dataModel.dart';
import 'package:newsappuser/DatabaseServices.dart';

class CustomCard extends StatelessWidget {

  InputModel inputModel;
  int index;

  CustomCard(this.inputModel, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      padding: EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 15.0
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(color: Colors.black54, width: 1.0),
        color: Color(0xFFD2dae1)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: 10.0,
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(2.5),
                  child: Text(inputModel.tag,style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                color: Colors.green,
              )
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: Hero(
              tag: "$index",
              child: Container(
                height: 150.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                    image: NetworkImage(
                      inputModel.imageUrl
                    ),
                    fit: BoxFit.cover
                  )
                ),
              ),
            )
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            inputModel.title,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: kTitleCard,
          ),
          SizedBox(
            height: 5.0,
          ),
          Row(
            children: [
              Text(
                timeDifference(inputModel.timestamp),
                style: kDetailContent,
              ),
              SizedBox(
                width: 10.0,
              ),

            ],
          )
        ],
      ),
    );
  }

  String timeDifference(Timestamp timestamp){
    var timeDifference;
    String timeDifferenceString;
    var now = DateTime.now();
    int date = timestamp.toDate().day;
    int month = timestamp.toDate().month;
    int year = timestamp.toDate().year;
    int previousDay = now.day - 1;
    String time = DateFormat.Hm().format(timestamp.toDate()).split(":").first;
    String timeNow = DateFormat.Hm().format(now).split(":").first;
    String AMorPM = time.split(" ").last;
    String timeInHours = time.split(":").first;


    if(now.day == date && now.month == month && now.year == year){
      timeDifference = (int.parse(timeNow)) - (int.parse(time));

      if(timeDifference < 1){
        timeDifferenceString = "Just now";
      }else{
        timeDifferenceString = "$timeDifference hours ago";
      }
    }else if(now.month == month && now.year == year && (previousDay == date)){
      timeDifferenceString = "yesterday";
    }else{
      timeDifferenceString = "$date/$month/$year";
    }

    return timeDifferenceString;

  }
}
