import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:audioplayers/audioplayers.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share/share.dart';

class SoomKebeer extends StatefulWidget{
  String title;

  SoomKebeer(this.title);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SoomKebeerState(title);
  }
}

class SoomKebeerState extends State<SoomKebeer>{
  String title;
  var url,urlasync;
  SoomKebeerState(this.title);
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
      case 'كيرياليسون باكر' : return 'kirilison_baker.mp3'; break;
      case 'tenoueh ncwk(1)' : return 'tenouehensok_soomelkebeer_1.mp3'; break;
      case 'tenoueh ncwk(2)' : return 'tenouehensok_soomelkebeer_2.mp3'; break;
      case 'allylouia eiei' : return 'alleloia_eiei.mp3'; break;
      case 'nefcen]' : return 'nefcenti.mp3'; break;
      case 'n;o te ]soury' : return 'ensotetyshory.mp3'; break;
      case 'sare vnou]' : return 'share_efnoty.mp3'; break;
      case 'مرد الابركسيس(احاد)' : return 'marad_eprakcic_soomkebeer.mp3'; break;
      case 'megalou ar,iereuc' : return 'megalo.mp3'; break;
      case ']hiryny' : return 'marad_engeel_soomkebeer.mp3'; break;
      case 'je peniwt' : return 'maradengeel_sobot_a7ad_soomkebeer.mp3'; break;
      case 'اسبسمس ادام' : return 'aspasmoc_adam_soomkebeer.mp3'; break;
      case 'اسبسمس واطس اول' : return 'aspasmocwatos_soomkebeer.mp3'; break;
      case 'اسبسمس واطس ثاني' : return 'aspasmoc_watos2_soomelkebeer.mp3'; break;
      case 'الذوكصولوجية 2' : return 'zoxologiat_tinestia_ayam_soomelkebeer.mp3'; break;
      case 'الذوكصولوجية 3' : return 'zoksologiat_amoinianav_soomelkebeer.mp3'; break;
      case 'الذوكصولوجية 4' : return 'zoksologiat_pimairwmi_soomelkebeer.mp3'; break;
      case 'توزيع الايام' : return 'tawze3ayam_somelkebeer.mp3'; break;
      case 'توزيع الاحاد' : return 'tawzi3a7ad_soumkeber.mp3'; break;
      case 'je fcmarwout' : return 'geefesmaro2ot_soomkebeer.mp3'; break;
      case 'pimairwmi' : return 'pimairomy.mp3'; break;
      case 'ounis]' : return 'oneshti.mp3'; break;
      case 'مزمور جمعة ختام الصوم' : return 'mazmoor_gom3et5etamsoom.mp3'; break;
      case 'مرد انجيل جمعة ختام الصوم' : return 'maradengeel_gom3et5etamsoom.mp3'; break;

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
              button('كيرياليسون باكر'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('tenoueh ncwk(1)'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('tenoueh ncwk(2)'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('allylouia eiei'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('nefcen]'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('n;o te ]soury'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('sare vnou]'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('مرد الابركسيس(احاد)'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('megalou ar,iereuc'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button(']hiryny'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('je peniwt'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('اسبسمس ادام'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('اسبسمس واطس اول'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('اسبسمس واطس ثاني'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('الذوكصولوجية 2'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('الذوكصولوجية 3'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('الذوكصولوجية 4'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('توزيع الايام'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('توزيع الاحاد'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('je fcmarwout'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('pimairwmi'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('ounis]'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('مزمور جمعة ختام الصوم'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('مرد انجيل جمعة ختام الصوم'),
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
          children: <Widget>[
            Padding(
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
                    Image.asset('assets/kbeer.jpg',width: 300,fit: BoxFit.fitHeight,height: 200,)
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