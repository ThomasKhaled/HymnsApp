import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:audioplayers/audioplayers.dart';
import 'package:share/share.dart';
class Keyahk extends StatefulWidget{
  String title;

  Keyahk(this.title);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return KeyahkState(title);
  }
}

class KeyahkState extends State<Keyahk>{
  String title;
  var url,urlasync;
  KeyahkState(this.title);
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
      case 'المعقب الرومي 2' : return 'romi2.mp3'; break;
      case 'المعقب الرومي 3' : return 'romi3.mp3'; break;
      case 'المعقب الرومي 4' : return 'romi4.mp3'; break;
      case 'المعقب الرومي 5' : return 'romi5.mp3'; break;
      case 'المعقب الرومي 6' : return 'romi6.mp3'; break;
      case 'المعقب الرومي 7' : return 'romi7.mp3'; break;
      case 'المعقب الرومي 8' : return 'romi8.mp3'; break;
      case 'المعقب الرومي 9' : return 'romi9.mp3'; break;

      case 'تفاسير المعقب 2' : return 'moakkab2.mp3'; break;
      case 'تفاسير المعقب 3' : return 'moakkab3.mp3'; break;
      case 'تفاسير المعقب 4' : return 'moakkab4.mp3'; break;
      case 'تفاسير المعقب 5' : return 'moakkab5.mp3'; break;
      case 'تفاسير المعقب 6' : return 'moakkab6.mp3'; break;
      case 'تفاسير المعقب 7' : return 'moakkab7.mp3'; break;
      case 'تفاسير المعقب 8' : return 'moakkab8.mp3'; break;
      case 'تفاسير المعقب 9' : return 'moakkab9.mp3'; break;

      case 'التفاسير البحيري 2' : return 'behairi2.mp3'; break;
      case 'التفاسير البحيري 3' : return 'behairi3.mp3'; break;
      case 'التفاسير البحيري 4' : return 'behairi4.mp3'; break;
      case 'التفاسير البحيري 5' : return 'behairi5.mp3'; break;
      case 'التفاسير البحيري 6' : return 'behairi6.mp3'; break;
      case 'التفاسير البحيري 7' : return 'behairi7.mp3'; break;
      case 'التفاسير البحيري 8' : return 'behairi8.mp3'; break;
      case 'التفاسير البحيري 9' : return 'behairi9.mp3'; break;

      case 'التفاسير البحيري الاخري 2' : return 'behairib2.mp3'; break;
      case 'التفاسير البحيري الاخري 3' : return 'behairib3.mp3'; break;
      case 'التفاسير البحيري الاخري 4' : return 'behairib4.mp3'; break;
      case 'التفاسير البحيري الاخري 5' : return 'behairib5.mp3'; break;
      case 'التفاسير البحيري الاخري 6' : return 'behairib6.mp3'; break;
      case 'التفاسير البحيري الاخري 7' : return 'behairib7.mp3'; break;
      case 'التفاسير البحيري الاخري 8' : return 'behairib8.mp3'; break;
      case 'التفاسير البحيري الاخري 9' : return 'behairib9.mp3'; break;

      case 'التفاسير المصري 2' : return 'masry2.mp3'; break;
      case 'التفاسير المصري 3' : return 'masry3.mp3'; break;
      case 'التفاسير المصري 4' : return 'masry4.mp3'; break;
      case 'التفاسير المصري 5' : return 'masry5.mp3'; break;
      case 'التفاسير المصري 6' : return 'masry6.mp3'; break;
      case 'التفاسير المصري 7' : return 'masry7.mp3'; break;
      case 'التفاسير المصري 8' : return 'masry8.mp3'; break;
      case 'التفاسير المصري 9' : return 'masry9.mp3'; break;

      case 'التفاسير الصعيدي 1' : return 'saidi1.mp3'; break;
      case 'التفاسير الصعيدي 2' : return 'saidi2.mp3'; break;
      case 'التفاسير الصعيدي 3' : return 'saidi3.mp3'; break;
      case 'التفاسير الصعيدي 4' : return 'saidi4.mp3'; break;
      case 'التفاسير الصعيدي 5' : return 'saidi5.mp3'; break;
      case 'التفاسير الصعيدي 6' : return 'saidi6.mp3'; break;
      case 'التفاسير الصعيدي 7' : return 'saidi7.mp3'; break;
      case 'التفاسير الصعيدي 8' : return 'saidi8.mp3'; break;
      case 'التفاسير الصعيدي 9' : return 'saidi9.mp3'; break;

      case 'ابصالية واطس اولي ليوم السبت' : return 'epsaly_watos1_sabt_keyahk.mp3'; break;
      case 'ابصالية واطس ثانية ليوم السبت' : return 'epsaly_watos2_sabt_keyahk.mp3'; break;

      case 'ارباع الناقوس' : return 'arba3_nakoos_kyahk.mp3'; break;
      case 'مقدمة الذوكصولوجيات' : return 'mokademet_zoxologiat_kyahk.mp3'; break;
      case 'الذوكصولوجية 1' : return 'first_zoxology_kyahk.mp3'; break;
      case 'الذوكصولوجية 2' : return 'second_zoxology_kyahk.mp3'; break;
      case 'الذوكصولوجية 3' : return 'third_zoxology_kyahk.mp3'; break;
      case 'الذوكصولوجية 4' : return 'fourth_zoxology_kyahk.mp3'; break;
      case 'الذوكصولوجية 5' : return 'fifth_zoxology_kyahk.mp3'; break;
      case 'الذوكصولوجية 6' : return 'sixth_zoxology_kyahk.mp3'; break;

      case 'الهيتينيات' : return 'hitens_kyahk.mp3'; break;
      case 'مرد الابركسيس الاول' : return 'marad_eprakcicawwel_kyahk.mp3'; break;
      case 'مرد الابركسيس الثاني' : return 'marad_eprakcictany_kyahk.mp3'; break;
      case 'مرد الابركسيس الثالث' : return 'marad_eprakcictalet_kyahk.mp3'; break;
      case 'مرد مزمور الانجيل' : return 'mazmoor_kyahk.mp3'; break;
      case 'مرد الانجيل للاحد الاول و الثاني' : return 'maradenggelawwalwetany_kyahk.mp3'; break;
      case 'مرد الانجيل للاحد الثالث و الرابع' : return 'maradenggeltaletwerabe3_kyahk.mp3'; break;
      case 'اسبسمس ادام اول' : return 'aspasmos_adam_first_sunday.mp3'; break;
      case 'اسبسمس ادام ثاني' : return 'aspasmos_adam_second_sunday.mp3'; break;
      case 'اسبسمس ادام ثالث' : return 'aspasmoc_adam_talet_kyahk.mp3'; break;
      case 'اسبسمس واطس اول' : return 'aspasmos_watosawwel_keyahk.mp3'; break;
      case 'اسبسمس واطس ثاني' : return 'aspasmos_watostany_keyahk.mp3'; break;
      case 'اسبسمس واطس ثالث' : return 'apspasmoc_watos_talet_kyahk.mp3'; break;
      case 'je fcmarwout' : return 'je_efesmarowout.wav'; break;
      case 'التوزيع' : return 'tawzee3_keyahk.mp3'; break;
      case 'fempsa gar' : return 'ef_emebsha_ghar_kyahk.mp3'; break;
      case 'ختام الصلوات' : return 'khetam_kyahk.mp3'; break;

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
              button('المعقب الرومي 2'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('المعقب الرومي 3'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('المعقب الرومي 4'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('المعقب الرومي 5'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('المعقب الرومي 6'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('المعقب الرومي 7'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('المعقب الرومي 8'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('المعقب الرومي 9'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),

              button('تفاسير المعقب 2'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('تفاسير المعقب 3'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('تفاسير المعقب 4'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('تفاسير المعقب 5'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('تفاسير المعقب 6'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('تفاسير المعقب 7'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('تفاسير المعقب 8'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('تفاسير المعقب 9'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),

              button('التفاسير البحيري 2'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('التفاسير البحيري 3'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('التفاسير البحيري 4'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('التفاسير البحيري 5'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('التفاسير البحيري 6'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('التفاسير البحيري 7'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('التفاسير البحيري 8'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('التفاسير البحيري 9'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),

              button('التفاسير البحيري الاخري 2'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('التفاسير البحيري الاخري 3'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('التفاسير البحيري الاخري 4'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('التفاسير البحيري الاخري 5'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('التفاسير البحيري الاخري 6'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('التفاسير البحيري الاخري 7'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('التفاسير البحيري الاخري 8'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('التفاسير البحيري الاخري 9'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),

              button('التفاسير المصري 2'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('التفاسير المصري 3'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('التفاسير المصري 4'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('التفاسير المصري 5'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('التفاسير المصري 6'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('التفاسير المصري 7'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('التفاسير المصري 8'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('التفاسير المصري 9'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),

              button('التفاسير الصعيدي 2'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('التفاسير الصعيدي 3'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('التفاسير الصعيدي 4'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('التفاسير الصعيدي 5'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('التفاسير الصعيدي 6'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('التفاسير الصعيدي 7'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('التفاسير الصعيدي 8'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('التفاسير الصعيدي 9'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),

              button('ابصالية واطس اولي ليوم السبت'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('ابصالية واطس ثانية ليوم السبت'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),

              button('ارباع الناقوس'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('مقدمة الذوكصولوجيات'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),

              button('الذوكصولوجية 1'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('الذوكصولوجية 2'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('الذوكصولوجية 3'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('الذوكصولوجية 4'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('الذوكصولوجية 5'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('الذوكصولوجية 6'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),

              button('الهيتينيات'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('مرد الابركسيس الاول'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('مرد الابركسيس الثاني'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('مرد الابركسيس الثالث'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('مرد مزمور الانجيل'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('مرد الانجيل للاحد الاول و الثاني'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('مرد الانجيل للاحد الثالث و الرابع'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('اسبسمس ادام اول'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('اسبسمس ادام ثاني'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('اسبسمس ادام ثالث'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('اسبسمس واطس اول'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('اسبسمس واطس ثاني'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('اسبسمس واطس ثالث'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('je fcmarwout'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('التوزيع'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('fempsa gar'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('ختام الصلوات'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),


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
                 Image.asset('assets/kyahk.jpg',width: 300,fit: BoxFit.fitHeight,height: 200,)
              ],
              )
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                verticalDirection: VerticalDirection.down,

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
          ],
        ),
      ),
    );
  }

}