import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:newsappuser/dataModel.dart';

class DatabaseServices{
  
  CollectionReference dataReference = Firestore.instance.collection('news');

  Stream<List<InputModel>> get fetchData{
    return dataReference.orderBy("timestamp", descending: true).limit(20).snapshots().map((doc) => dataFromSnapshot(doc));
  }

  List<InputModel> dataFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc) {
      return InputModel(
        day: doc.data['day'] ?? '',
        title: doc.data['title'] ?? '',
        description: doc.data['description'] ?? '',
        imageUrl: doc.data['image'] ?? '',
        date: doc.data['date'] ?? '',
        tag: doc.data['tag'] ?? '',
        timestamp: doc.data['timestamp']
      );
    }).toList();
  }
}