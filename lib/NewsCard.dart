import 'package:flutter/material.dart';
import 'package:newsappuser/constants.dart';
import 'package:newsappuser/dataModel.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NewsCard extends StatelessWidget {

  InputModel inputModel;

  NewsCard(this.inputModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 8.0
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(color: Colors.black54, width: 1.0),
        color: Color(0xFFD2dae1)
      ),
      child: Row(
        children: [
          Container(
            width: 90.0,
            height: 135.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              image: DecorationImage(
                image: NetworkImage(
                  inputModel.imageUrl
                ),
                fit: BoxFit.cover
              )
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    inputModel.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                    style: kTitleCard,
                  ),
                  SizedBox(
                    height: 4.0,
                  ),

                  Spacer(),
                  Row(
                    children: [
                      Text(
                        timeDifference(inputModel.timestamp),
                        style: kDetailContent,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      SizedBox(
                        width: 5,
                        child: Divider(
                          thickness: 2,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        inputModel.tag,
                        style: kDetailContent,
                      )
                    ],
                  )
                ],
              ),
            ),

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
