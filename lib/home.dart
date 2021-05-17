

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:newsappuser/DetailedNewsCard.dart';
import 'package:newsappuser/NewsCard.dart';
import 'package:newsappuser/dataModel.dart';
import 'package:newsappuser/DatabaseServices.dart';
import 'package:newsappuser/help.dart';
import 'package:newsappuser/loading.dart';
import 'package:provider/provider.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:newsappuser/Card.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share/share.dart';
import 'package:open_appstore/open_appstore.dart';



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {

    final newsData = Provider.of<List<InputModel>>(context);

    if(newsData == null){
      return Loading();
    }else{
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF2a3c93),
          title: Text("தமிழ் Tech"),
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0),bottomRight: Radius.circular(20.0) )
          ),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  image: DecorationImage(
                    image: AssetImage("assets/drawerlogo.png")
                  )
                ),
              ),
              ListTile(
                title: Text("மதிப்பிடு / Rate us"),
                trailing: Icon(Icons.star_border),
                onTap: () {
                  OpenAppstore.launch(androidAppId: "com.instagram.android");
                },
              ),
              ListTile(
                title: Text("பகிர் / Share"),
                trailing: Icon(Icons.share),
                onTap: (){
                  Share.share("https://play.google.com/store/apps/details?id=com.example.newsappuser",
                      subject: "Share App");
                },
              ),
              ListTile(
                title: Text("உதவி / Help"),
                trailing: Icon(Icons.help),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => HelpTab()));
                },
              )
            ],
          ),
        ),
        body: RefreshIndicator(
          key: refreshKey,
          onRefresh: checkInternet,
          child: Builder(
            builder: (context){
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ExpansionTile(
                    initiallyExpanded: true,
                    title: Text(
                        "அண்மை செய்தி/Recent",
                        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500)
                    ),
                    children: [
                      Container(
                        height: 300.0,
                        width: double.infinity,
                        margin: EdgeInsets.only(top: 10.0),
                        child: ListView.builder(
                          padding: EdgeInsets.all(5.0),
                          itemCount: 4,
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index){
                            return InkWell(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                child: CustomCard(newsData[index], index),
                              ),
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return DetailedNewsCard(newsData[index]);
                                })
                                );
                              },
                            );
                          },
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0),
                    child: Text(
                        "அனைத்தும்/All news",
                        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500)
                    ),
                  ),
                  Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemCount: newsData.length,
                          itemBuilder: (context, index){

                            return InkWell(
                              onTap: (){
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => DetailedNewsCard(newsData[index]))
                                );
                              },
                              child: Container(
                                width: double.infinity,
                                height: 135.0,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 18.0,
                                    vertical: 8.0),
                                child: NewsCard(newsData[index]),
                              ),
                            );
                          }
                      )
                  ),
                ],
              );
            }
          ),
        )
      );
    }

    }

    Future<Null> checkInternet() async{
      refreshKey.currentState.show(atTop: true);
      Future.delayed(Duration(seconds: 3));

      final result1 = await Connectivity().checkConnectivity();
      final result2 = await DataConnectionChecker().hasConnection;

      if(result1 == ConnectivityResult.none || result2 == false){
        Fluttertoast.showToast(
          msg: "No Internet!",
          backgroundColor: Colors.red,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG
        );
      }else{
        Fluttertoast.showToast(
            msg: "Updated!",
            textColor: Colors.white,
            toastLength: Toast.LENGTH_LONG
        );
      }
    }

  }


