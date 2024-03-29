import 'dart:async';
import 'package:flutter/material.dart';
import 'AudioPlayerScreen.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:share/share.dart';
import 'package:fluttertoast/fluttertoast.dart';
class ZoxologyatKyahk extends StatefulWidget{
  String title;

  ZoxologyatKyahk(this.title);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ZoxologyatKyahkState(title);
  }
}

class ZoxologyatKyahkState extends State<ZoxologyatKyahk>{
  String title;
  var url,urlasync;
  ZoxologyatKyahkState(this.title);
  AudioPlayer audio = AudioPlayer();


  String audioTitle;
  Future<String> getAudioUrl(text) async{
    var ref = await getAudioName(text);
    audioTitle = text;
    Reference storage = FirebaseStorage.instance.ref().child("${ref}");
    String url = (await storage.getDownloadURL()).toString();
    print('sadasfasfasfsa : ${url}');
    return url;
  }

  Widget button(title){
    return InkWell(
      onTap: (){
        getAudioUrl(title).then((onValue){
          setState(() {
            urlasync = onValue;
          });
        }).whenComplete((){
          setState(() {
            url = urlasync;
          });
          print('abo el urllllllllllllllllllllllllllllllllllllllll: $url');
          urlAndNavigate(title);
        });

      },
      child: new Container(
        width: MediaQuery.of(context).size.width,
        height: 50.0,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 0, 0, 0),
          border: Border.all(color: const Color.fromARGB(255, 0, 0, 0), width: 2.0),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: new Center(child: new Text(title, textAlign: TextAlign.center,style: new TextStyle(fontSize: 18.0, fontFamily: 'Coptic' ,color: Colors.white),),),
      ),
    );
  }

  Widget urlAndNavigate(text){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>AudioPlayerScreen(url,audioTitle,title)));
  }

  getAudioName(title){
    switch(title){
      case 'مقدمة الذوكصولوجيات' : return 'mokademet_zoxologiat_kyahk.mp3'; break;
      case 'الذوكصولوجية 1' : return 'first_zoxology_kyahk.mp3'; break;
      case 'الذوكصولوجية 2' : return 'second_zoxology_kyahk.mp3'; break;
      case 'الذوكصولوجية 3' : return 'third_zoxology_kyahk.mp3'; break;
      case 'الذوكصولوجية 4' : return 'fourth_zoxology_kyahk.mp3'; break;
      case 'الذوكصولوجية 5' : return 'fifth_zoxology_kyahk.mp3'; break;
      case 'الذوكصولوجية 6' : return 'sixth_zoxology_kyahk.mp3'; break;
    }
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      onWillPop: (){
        Navigator.pop(context);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(22, 22, 22,1),

          title: Text(title),
        ),
        body: GridView.count(
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 4/2,
          padding: const EdgeInsets.all(12),
          crossAxisCount: 2,
          children: [
            button('مقدمة الذوكصولوجيات'),


            button('الذوكصولوجية 1'),

            button('الذوكصولوجية 2'),

            button('الذوكصولوجية 3'),

            button('الذوكصولوجية 4'),

            button('الذوكصولوجية 5'),

            button('الذوكصولوجية 6'),
          ],
        ),
      ),
    );
  }


}


