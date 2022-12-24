import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:audioplayers/audioplayers.dart';
import 'package:share/share.dart';
import 'package:fluttertoast/fluttertoast.dart';
class A7adElSha3aneen extends StatefulWidget{
  String title;

  A7adElSha3aneen(this.title);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return A7adElSha3aneenState(title);
  }
}

class A7adElSha3aneenState extends State<A7adElSha3aneen>{
  String title;
  var url,urlasync;
  A7adElSha3aneenState(this.title);
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
      case 'مقدمة الذوكصولوجيات' : return 'intro_zoksolgiat_sha3aneen.mp3'; break;
      case 'الشيرات باللحن الوسط' : return 'sherat_sha3aneen_la7nelmo7ayyer.mp3'; break;
      case 'مرد انجيل عشية' : return 'marad_engeel_3asheya_sha3aneen.mp3'; break;
      case 'مرد انجيل باكر' : return 'maradengeel_baker_sha3aneen.mp3'; break;
      case 'ارباع الناقوس' : return 'arba3nakoos_a7adelsa3aneen.mp3'; break;
      case 'الذوكصولوجية الاولي' : return 'first_zoxology_a7adsha3aneen.mp3'; break;
      case 'الذوكصولوجية الثانية' : return 'second_zoxology_a7adsha3aneen.mp3'; break;
      case 'الذوكصولوجية الثالثة' : return 'third_zoxology_a7adelsa3aneen.mp3'; break;
      case 'masenak' : return 'tar7_a7adelsha3aneen.mp3'; break;
      case 'eulogimenoc (الصغير)' : return 'eflogimenos.mp3'; break;
      case 'eulogimenoc (الكبير)' : return 'evlogimenos_kebeer.mp3'; break;
      case 'rasi ounof ciwn' : return 'kanoon_elsha3aneen.mp3'; break;
      case 'مرد الابركسيس' : return 'marad_eprakcic_sha3aneen.mp3'; break;
      case 'المحير' : return 'mo7ayyer_sha3aneen.mp3'; break;
      case 'المزمور السنجاري' : return 'almazmoor_elsengary_a7adelsha3aneen.m4a'; break;
      case 'مرد المزمور' : return 'marad_mazmoor_a7adsha3aneen.mp3'; break;
      case 'مرد انجيل 1' : return 'maradengeel_awwel_a7adsha3aneen.mp3'; break;
      case 'مرد انجيل 2' : return 'maradengeel_tany_a7adsha3aneen.mp3'; break;
      case 'مرد انجيل 3' : return 'maradengeel_talet_a7adsha3aneen.mp3'; break;
      case 'مرد انجيل 4' : return 'maradengeel_rabe3_a7adsha3aneen.mp3'; break;
      case 'اسبسمس ادام' : return 'aspasmocadam_a7adsha3aneen.mp3'; break;
      case 'اسبسمس واطس' : return 'aspasmoc_watos_a7adelsha3aneen.mp3'; break;
      case 'wcanna en tic' : return 'marad_wcanna_sha3aneen.mp3'; break;
      case 'التوزيع' : return 'tawzee3_a7adsha3aneen.mp3'; break;
      case 'ارباع ناقوس التجنيز' : return 'arba3_nakoos_tagneez.mp3'; break;
      case 'kata ehoou nem kata egwrh' : return 'kata_ehoo_tagneez.mp3'; break;
      case 'e;be ]anactacic' : return 'esvety.mp3'; break;




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
              button('الشيرات باللحن الوسط'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('مرد انجيل عشية'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('مرد انجيل باكر'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('ارباع الناقوس'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('مقدمة الذوكصولوجيات'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('الذوكصولوجية الاولي'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('الذوكصولوجية الثانية'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('الذوكصولوجية الثالثة'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('masenak'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('eulogimenoc (الصغير)'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('eulogimenoc (الكبير)'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('rasi ounof ciwn'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('مرد الابركسيس'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('المحير'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('المزمور السنجاري'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('مرد المزمور'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('مرد انجيل 1'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('مرد انجيل 2'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('مرد انجيل 3'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('مرد انجيل 4'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('اسبسمس ادام'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('اسبسمس واطس'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('wcanna en tic'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('التوزيع'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('e;be ]anactacic'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('ارباع ناقوس التجنيز'),
              Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
              button('kata ehoou nem kata egwrh')
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
                    Image.asset('assets/a7ad_sha3aneen.jpg',width: 300,fit: BoxFit.fitHeight,height: 200,)
                  ],
                )
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
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