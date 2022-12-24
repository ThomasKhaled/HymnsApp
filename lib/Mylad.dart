import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:audioplayers/audioplayers.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share/share.dart';
class Mylad extends StatefulWidget{
  String title;

  Mylad(this.title);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyladState(title);
  }
}

class MyladState extends State<Mylad>{
  String title;
  var url,urlasync;
  MyladState(this.title);
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
      case 'السبع طرائق' : return 'saba3_tarayek.mp3'; break;
      case 'ارباع الناقوس' : return 'arba3_nakoos_3eed_mylad.mp3'; break;
      case 'pouro' : return 'eporo_fary7y.mp3'; break;
      case 'مرد انجيل باكر' : return 'marad_engeelbaker_elmylad.mp3'; break;
      case 'هيتين الميلاد' : return 'hiten_elmylad.mp3'; break;
      case 'مرد الابركسيس' : return 'marad_epracic_elmylad.mp3'; break;
      case 'y par;enoc' : return 'iparthenoc.mp3'; break;
      case 'pijinmici + gene;lion' : return 'be_gen_misi_gensilion.mp3'; break;
      case 'المحير' : return 'mo7yer_milad.mp3'; break;
      case 'مرد المزمور' : return 'marad_mazmoor_elmylad.mp3'; break;
      case 'مرد الانجيل' : return 'marad_engeel_oddas_elmylad.mp3'; break;
      case 'اسبسمس ادام اول' : return 'first_aspasmocadam_elmylad.mp3'; break;
      case 'اسبسمس ادام ثاني' : return 'second_aspasmocadam_elmylad.mp3'; break;
      case 'اسبسمس ادام ثالث' : return 'third_aspasmocadam_elmylad.mp3'; break;
      case 'اسبسمس ادام رابع' : return 'fourth_aspasmocadam_elmylad.mp3'; break;
      case 'اسبسمس واطس اول' : return 'first_aspasmocwatos_elmylad.mp3'; break;
      case 'اسبسمس واطس ثاني' : return 'second_aspasmocwatos_elmylad.mp3'; break;
      case 'ختام الصلوات' : return 'khetam_elmylad.mp3'; break;
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
              button('السبع طرائق'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('ارباع الناقوس'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('pouro'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('مرد انجيل باكر'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('هيتين الميلاد'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('مرد الابركسيس'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('y par;enoc'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('pijinmici + gene;lion'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('المحير'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('مرد المزمور'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('مرد الانجيل'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('اسبسمس ادام اول'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('اسبسمس ادام ثاني'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('اسبسمس ادام ثالث'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('اسبسمس ادام رابع'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('اسبسمس واطس اول'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('اسبسمس واطس ثاني'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('ختام الصلوات'),
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
                    Image.asset('assets/mylad.jpg',width: 300,fit: BoxFit.fitHeight,height: 200,)
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