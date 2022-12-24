import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:audioplayers/audioplayers.dart';
import 'package:share/share.dart';
class SoomYonan extends StatefulWidget{
  String title;

  SoomYonan(this.title);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SoomYonanState(title);
  }
}

class SoomYonanState extends State<SoomYonan>{
  String title;
  var url,urlasync;
  SoomYonanState(this.title);
  AudioPlayer audio = AudioPlayer();

  Future<String> getAudioUrl(text) async{
    final fb.StorageReference storage = fb.app().storage().refFromURL("gs://movieapp-216811.appspot.com/");
    var ref = storage.child(getAudioName(text));
    String url = await (await ref.getDownloadURL()).toString();
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
        decoration: new BoxDecoration(
          color: Color.fromARGB(140, 6, 3, 97),
          border: new Border.all(color: Colors.white, width: 2.0),
          borderRadius: new BorderRadius.circular(30.0),
        ),
        child: new Center(child: new Text(title, style: new TextStyle(fontSize: 18.0, fontFamily: 'Coptic' ,color: Colors.white),),),
      ),
    );
  }

  Widget urlAndNavigate(text){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>AudioInfo(text,url)));
  }

  getAudioName(title){
    switch(title){
      case 'الذوكصولوجية' : return 'zoksologiet_yonan.mp3'; break;
      case 'مرد انجيل باكر الإثنين' : return 'maradengeel_bakeretneen_yonan.mp3'; break;
      case 'مرد انجيل قداس الإثنين' : return 'maradengeel_koddasetneen_yonan.mp3'; break;
      case 'مرد انجيل باكر الثلاثاء' : return 'maradengeel_bakertalat_yonan.mp3'; break;
      case 'مرد انجيل قداس الثلاثاء' : return 'maradengeel_koddastalat_yonan.mp3'; break;
      case 'مرد انجيل باكر الاربعاء' : return 'maradengeel_bakerarba3_yonan.mp3'; break;
      case 'مرد انجيل قداس الاربعاء' : return 'maradengeel_koddasarba3_yonan.mp3'; break;
      case 'مرد انجيل باكر الخميس' : return 'maradengeel_baker5amees_yonan.mp3'; break;
      case 'مرد انجيل قداس الخميس' : return 'maradengeel_koddas5amees_yonan.mp3'; break;
      case 'الهيتينية' : return 'hiten_yonan.mp3'; break;
      case 'iwna piprovytyc' : return 'tawzee3_yonan.mp3'; break;

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
          backgroundColor: Color.fromARGB(170, 6, 3, 97),
          title: Text(title),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              button('الذوكصولوجية'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('مرد انجيل باكر الإثنين'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('مرد انجيل قداس الإثنين'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('مرد انجيل باكر الثلاثاء'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('مرد انجيل قداس الثلاثاء'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('مرد انجيل باكر الاربعاء'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('مرد انجيل قداس الاربعاء'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('مرد انجيل باكر الخميس'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('مرد انجيل قداس الخميس'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('الهيتينية'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('iwna piprovytyc'),
            ],
          ),
        ),
      ),
    );
  }


}



class AudioInfo extends StatefulWidget{
  String audioTitle;
  var url;
  AudioInfo(this.audioTitle,this.url);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AudioInfoState(audioTitle,url);
  }
}

class AudioInfoState extends State<AudioInfo>{
  String audioTitle;
  var url;
  AudioInfoState(this.audioTitle,this.url);
  AudioPlayer audio = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){audio.stop(); url=''; Navigator.pop(context);}),
        backgroundColor: Color.fromARGB(170, 6, 3, 97),
        title: Text(audioTitle,style: TextStyle(fontFamily: 'Coptic'),),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.share), onPressed: (){
            Share.share(url,subject: audioTitle);
          })
        ],
      ),
      body: WillPopScope(
        onWillPop: (){
          audio.stop(); url=''; Navigator.pop(context);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Padding(
              padding: const EdgeInsets.all(30.0),
              child: /*Card(
                child: Container(
                  color: Colors.grey[100],
                  height: 400.0,
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[

                      ],
                    ),
                  ),
                ),
              ),*/
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assets/yonan.jpg',width: 300,fit: BoxFit.fitHeight,height: 200,)
                ],
              )
          ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FloatingActionButton(
                    heroTag: 'btn1',
                    backgroundColor: Color.fromARGB(170, 6, 3, 97),
                    child: Icon(Icons.fast_rewind),
                  ),
                  FloatingActionButton(
                    heroTag: 'btn2',
                    backgroundColor: Color.fromARGB(170, 6, 3, 97),
                    child: Icon(Icons.pause),
                    onPressed: (){
                      audio.pause();
                    },
                  ),
                  FloatingActionButton(
                    heroTag: 'btn3',
                    backgroundColor: Color.fromARGB(170, 6, 3, 97),
                    child: Icon(Icons.play_arrow),
                    onPressed: (){
                      audio.play(url);
                    },
                  ),
                  FloatingActionButton(
                    heroTag: 'btn4',
                    backgroundColor: Color.fromARGB(170, 6, 3, 97),
                    child: Icon(Icons.fast_forward),
                  )


                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}