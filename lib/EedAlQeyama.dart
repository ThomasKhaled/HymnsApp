import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:audioplayers/audioplayers.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share/share.dart';
class EedAlQeyama extends StatefulWidget{
  String title;

  EedAlQeyama(this.title);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return EedAlQeyamaState(title);
  }
}

class EedAlQeyamaState extends State<EedAlQeyama>{
  String title;
  var url,urlasync;
  EedAlQeyamaState(this.title);
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
      case 'qen ouswt' : return 'khen_oushot_faray7y.mp3'; break;
      case 'أرباع ناقوس القيامة' : return 'araba3_nakoos_3eebelkeyama.mp3'; break;
      case 'السبع طرائق' : return 'saba3_tarayek.mp3'; break;
      case 'الذوكصولوجية الأولي' : return 'tote_ron_qeyama.mp3'; break;
      case 'vyetafsans' : return 'fyetafshansh_faray7y.mp3'; break;
      case 'ذوكصولوجية الملاك ميخائيل' : return 'ca_etanactacic.mp3'; break;
      case 'مرد انجيل باكر' : return 'maradengeel_baker_elkeyama.mp3'; break;
      case '`pouro' : return 'eporo_fary7y.mp3'; break;
      case 'الهيتينيات' : return 'hitens_keyama.mp3'; break;
      case 'البولس الفرايحي' : return 'bavloselfary7y.mp3'; break;
      case 'مرد الابركسيس' : return 'epraxicalqeyama.mp3'; break;
      case 'kata ni,oroc(الحجاب)' : return 'katanikhoros7egab.mp3'; break;
      case 'w nim nai cumvwnia' : return 'onemnai.mp3'; break;
      case 'يا كل الصفوف' : return 'iakwlelswfof.mp3'; break;
      case ',rictoc anecty(الطويلة)' : return 'khrectocanectylong.mp3'; break;
      case ',rictoc anecty(القصيرة)' : return 'khrectocanectyshort.mp3'; break;
      case 'ton cuna' : return 'toncena.mp3'; break;
      case 'tou li;oc' : return 'tolithoc.mp3'; break;
      case 'pi,rictoc aftwnf' : return 'pikhrictocaftwnf.mp3'; break;
      case 'المحير' : return 'patchoicalqyema.mp3'; break;
      case 'مرد المزمور' : return 'maradmazmorelqeyama.mp3'; break;
      case 'مرد الانجيل' : return 'libonkeyama.mp3'; break;
      case 'الاسبسمس الادام الاول' : return 'apikhrictoc.mp3'; break;
      case 'الاسبسمس الادام الثاني' : return 'marenhos_aspasmocadam_qeyama.mp3'; break;
      case 'الاسبسمس الادام الثالث' : return 'apasmoc_thirdkeyama.mp3'; break;
      case 'الاسبسمس الواطس' : return 'liponavkaf.mp3'; break;
      case 'التوزيع الكبير' : return 'tawzee3_33edkeyama.mp3'; break;
      case 'kata ni,oroc(التوزيع)' : return 'katani_khoros_small.mp3'; break;

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
              button('qen ouswt'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('أرباع ناقوس القيامة'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('السبع طرائق'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('الذوكصولوجية الأولي'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('vyetafsans'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('ذوكصولوجية الملاك ميخائيل'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('مرد انجيل باكر'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('`pouro'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('الهيتينيات'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('البولس الفرايحي'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('مرد الابركسيس'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('kata ni,oroc(الحجاب)'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('w nim nai cumvwnia'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('يا كل الصفوف'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button(',rictoc anecty(الطويلة)'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button(',rictoc anecty(القصيرة)'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('ton cuna'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('tou li;oc'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('pi,rictoc aftwnf'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('المحير'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('مرد المزمور'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('مرد الانجيل'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('الاسبسمس الادام الاول'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('الاسبسمس الادام الثاني'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('الاسبسمس الادام الثالث'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('الاسبسمس الواطس'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('التوزيع الكبير'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('kata ni,oroc(التوزيع)')
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
                    Image.asset('assets/qyama.jpg',width: 300,fit: BoxFit.fitHeight,height: 200,)
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