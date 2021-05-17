import 'package:cloud_firestore/cloud_firestore.dart';

class InputModel{
  String title;
  String description;
  String date;
  String day;
  String imageUrl;
  String tag;
  Timestamp timestamp;

  InputModel({this.title,this.description,this.date,this.imageUrl,this.day, this.tag,this.timestamp });
}