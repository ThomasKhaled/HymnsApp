import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:audioplayers/audioplayers.dart';
import 'package:share/share.dart';
import 'package:firebase/firebase.dart' as fb;
class Basily extends StatefulWidget{
  String title;

  Basily(this.title);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BasilyState(title);
  }
}

class BasilyState extends State<Basily>{
  String title;
  var url,urlasync;
  BasilyState(this.title);
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
      case 'qen pi,rictoc iycouc pen[oic' : return 'khen_pikhrictoc_sanawy.mp3'; break;
      case 'أرباع الناقوس الأدام' : return 'araba3_nakoos_adam.mp3'; break;
      case 'أرباع الناقوس الواطس' : return 'arba3_nakoos_watos.mp3'; break;
      case 'بقية أرباع الناقوس' : return 'rest_arba3_nakoos.mp3'; break;
      case 'tenouwst `mviwt' : return 'elbaraka.wav'; break;
      case 'a pinau swpi' : return 'a_pinav_shobi.mp3'; break;
      case 'اللي القربان' : return 'alli_alkorban.mp3'; break;
      case 'allylouia je `vmeui' : return 'alleloia_jefmevi.wav'; break;
      case 'allylouia vai pe pi' : return 'alleloia_faipepi.wav'; break;
      case 'cw;ic' : return 'so.wav'; break;
      case 'nicabeu tyrou' : return 'nicavev_tero.mp3'; break;
      case 'tai soury' : return 'taishory.wav'; break;
      case ']soury' : return 'tishory.wav'; break;
      case 'الهيتينيات' : return 'hiten.wav'; break;
      case 'هيتين مارمينا' : return 'hiten_marmina.mp3'; break;
      case 'هيتين الأنبا بيشوي و الأنبا بولا' : return 'hiten_anbabeshoy_anbabola.mp3'; break;
      case 'هيتين الأنبا إبرام' : return 'hiten_anbaabraam.mp3'; break;
      case 'البولس قبطي' : return 'boles_coptic.mp3'; break;
      case 'tou makariou' : return 'tou_makario.mp3'; break;
      case ']me]cnou]' : return 'tymetyesnoty.mp3'; break;
      case 'a petjyk ebol' : return 'apetjeekevol.mp3'; break;
      case 'الكاثوليكون قبطي' : return 'katholicon_coptic.mp3'; break;
      case 'مرد الإبركسيس الصغير' : return 'praxicsmall.mp3'; break;
      case 'مرد الإبركسيس الكبير' : return 'praxiclong.mp3'; break;
      case 'تكملة مرد الإبركسيس' : return 'takmelet_eprakcic.mp3'; break;
      case 'الإبركسيس قبطي': return 'prakcic_coptic.mp3'; break;
      case 'va nitenh': return 'fa_ni_tenh.mp3'; break;
      case 'agioc': return 'agioc_sanawy.mp3'; break;
      case 'a pekran': return 'apekran.mp3'; break;
      case 'المزمور قبطي': return 'mazmoor_koddas_coptic.mp3'; break;
      case 'الإنجيل قبطي': return 'el_engeel_coptic.mp3'; break;
      case 'wouniatou': return 'ooniato.wav'; break;
      case 'tenjoust': return 'tengosht.wav'; break;
      case 'ounof `mmo maria': return 'onofemmo.wav'; break;
      case 'hiten niprecbia': return 'hitennipresvia.wav'; break;
      case 'p[oic `vnou]': return 'epchoiceefnoty.wav'; break;
      case 'ni,eroubim': return 'nisherobim.wav'; break;
      case 'tennah](لغاية أمين أمين)': return 'takdees.wav'; break;
      case 'tenhwc erok': return 'tenhoc.wav'; break;
      case 'مردات الأواشي': return 'awashy.wav'; break;
      case 'eu,ec': return 'efchec.mp3'; break;
      case 'pinis]': return 'pinishty.mp3'; break;
      case 'ere po`cmou': return 'erepoecmo.wav'; break;
      case 'wc peryn': return 'wcpereen.wav'; break;
      case 'من بعد كما كان': return 'tenooshtempbekcoma.wav'; break;
      case 'ic o panagioc': return 'icobanagioc.wav'; break;
      case 'امين قبل الإعتراف' : return 'amene3teraf.mp3'; break;
      case 'المزمور 150' : return 'tawzee3.wav'; break;
      case 'piwik `nte `pwnq' : return 'piwik.mp3'; break;
      case 'amyn allylouia' : return 'amin_alleloia.wav'; break;
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
                button('qen pi,rictoc iycouc pen[oic'),
                Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
                button('أرباع الناقوس الأدام'),
                Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
                button('أرباع الناقوس الواطس'),
                Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
                button('بقية أرباع الناقوس'),
                Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
                button('tenouwst `mviwt'),
                Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
                button('a pinau swpi'),
                Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
                button('اللي القربان'),
                Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
                button('allylouia je `vmeui'),
                Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
                button('allylouia vai pe pi'),
                Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
                button('cw;ic'),
                Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
                button('nicabeu tyrou'),
                Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
                button('tai soury'),
                Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
                button(']soury'),
                Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
                button('الهيتينيات'),
                Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
                button('هيتين مارمينا'),
                Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
                button('هيتين الأنبا بيشوي و الأنبا بولا'),
                Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
                button('هيتين الأنبا إبرام'),
                Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
                button('البولس قبطي'),
                Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
                button('tou makariou'),
                Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
                button(']me]cnou]'),
                Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
                button('a petjyk ebol'),
                Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
                button('الكاثوليكون قبطي'),
                Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
                button('مرد الإبركسيس الصغير'),
                Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
                button('مرد الإبركسيس الكبير'),
                Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
                button('تكملة مرد الإبركسيس'),
                Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
                button('الإبركسيس قبطي'),
                Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
                button('va nitenh'),
                Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
                button('agioc'),
                Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
                button('a pekran'),
                Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
                button('المزمور قبطي'),
                Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
                button('الإنجيل قبطي'),
                Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
                button('wouniatou'),
                Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
                button('tenjoust'),
                Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
                button('ounof `mmo maria'),
                Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
                button('hiten niprecbia'),
                Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
                button('p[oic `vnou]'),
                Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
                button('ni,eroubim'),
                Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
                button('tennah](لغاية أمين أمين)'),
                Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
                button('tenhwc erok'),
                Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
                button('مردات الأواشي'),
                Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
                button('eu,ec'),
                Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
                button('pinis]'),
                Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
                button('ere po`cmou'),
                Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
                button('wc peryn'),
                Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
                button('من بعد كما كان'),
                Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
                button('ic o panagioc'),
                Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
                button('امين قبل الإعتراف'),
                Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
                button('المزمور 150'),
                Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
                button('piwik `nte `pwnq'),
                Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
                button('amyn allylouia')
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
                  Image.asset('assets/koddas.jpg',width: 300,fit: BoxFit.fitHeight,height: 200,)
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