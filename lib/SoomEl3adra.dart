import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:audioplayers/audioplayers.dart';
import 'package:share/share.dart';
class SoomEl3adra extends StatefulWidget{
  String title;

  SoomEl3adra(this.title);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SoomEl3adraState(title);
  }
}

class SoomEl3adraState extends State<SoomEl3adra>{
  String title;
  var url,urlasync;
  SoomEl3adraState(this.title);
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
      case 'je afcaji' : return 'jehafcaji_3adra.mp3'; break;
      case ',ere ;eotoke' : return 'shere_theotoke.mp3'; break;
      case 'agioc ictin' : return 'agioc_ictin_3adra.mp3'; break;
      case 'sasf `ncop' : return 'shashf_ensob.mp3'; break;
      case 'deute' : return 'zefte_bandees.mp3'; break;
      case 'rasi ne' : return 'aripresvevin_3adra.mp3'; break;
      case 'cena`tso' : return 'cenaetsho.mp3'; break;
      case 'vai pe plumen' : return 'faibeblimen_3adra.mp3'; break;
      case '`n;o `;mau' : return 'enso_ethmaf_3adra.mp3'; break;
      case 'a taipar;enoc' : return 'a_tai_parthenoc_3adra.mp3'; break;


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
              button('je afcaji'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button(',ere ;eotoke'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('agioc ictin'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('sasf `ncop'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('deute'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('rasi ne'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('cena`tso'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('vai pe plumen'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('`n;o `;mau'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('a taipar;enoc')
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
  bool pause = false,play=false;
  AudioInfoState(this.audioTitle,this.url);
  AudioPlayer audio = AudioPlayer();
  Timer timer;
  int start =0;

  void startTimer(){
    const oneSec = const Duration(seconds: 1);
    timer = new Timer.periodic(oneSec, (Timer timer) => setState(
            (){
          if(play){
            start = start + 1;
          }else{
            timer.cancel();
          }
        }
    ));
  }

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
                  Image.asset('assets/3adra.jpg',width: 300,fit: BoxFit.fitHeight,height: 200,)
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
                    onPressed: (){
                      setState(() {
                        if(start >= 5){
                          start = start - 5;

                        }else{
                          Fluttertoast.showToast(msg: 'Cant Fast Backward',textColor: Colors.black,toastLength: Toast.LENGTH_SHORT);
                        }
                      });
                    },
                  ),
                  FloatingActionButton(
                    heroTag: 'btn2',
                    backgroundColor: Color.fromARGB(170, 6, 3, 97),
                    child: Icon(Icons.pause),
                    onPressed: (){
                      audio.pause();
                      pause = true;
                      play=false;
                    },
                  ),
                  FloatingActionButton(
                    heroTag: 'btn3',
                    backgroundColor: Color.fromARGB(170, 6, 3, 97),
                    child: Icon(Icons.play_arrow),
                    onPressed: (){
                      audio.play(url);
                      pause = false;
                      play=true;
                      startTimer();
                    },
                  ),
                  FloatingActionButton(
                    heroTag: 'btn4',
                    backgroundColor: Color.fromARGB(170, 6, 3, 97),
                    child: Icon(Icons.fast_forward),
                    onPressed: (){
                      setState(() {
                        if(true){
                          start = start + 5;

                        }else{
                          Fluttertoast.showToast(msg: 'Cant Fast Forward',textColor: Colors.black,toastLength: Toast.LENGTH_SHORT);
                        }
                        print(start);
                      });

                    },
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