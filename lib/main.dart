import 'package:flutter/material.dart';
import 'koddas_basily.dart';
import 'koddas_gregory.dart';
import 'koddas_kirollosy.dart';
import 'nayrooz.dart';
import 'yohanna.dart';
import 'EedSaleeb.dart';
import 'Keyahk.dart';
import 'Mylad.dart';
import 'Ghotac.dart';
import 'KanaGaleel.dart';
import 'SoomYonan.dart';
import 'SoomKebeer.dart';
import 'Beshara.dart';
import 'SabtLe3azar.dart';
import 'A7adElSha3aneen.dart';
import 'Albas5a.dart';
import 'KhameesEl3ahd.dart';
import 'Gom3a3azeema.dart';
import 'SabtFara7.dart';
import 'EedAlQeyama.dart';
import 'AlSo3ood.dart';
import 'Al3ansara.dart';
import 'SoomElRosol.dart';
import 'ElTagally.dart';
import 'SoomEl3adra.dart';
import 'BaramonGhotac.dart';
import 'BaramonMylad.dart';

void main() => runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    )
);

class Keys{
  static final key1 = const Key('key1');
  static final key2 = const Key('key2');
}

class SplashScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SplashScreenState();
  }

}

class SplashScreenState extends State<SplashScreen> {




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 6, 3, 97),
                gradient: LinearGradient(begin: Alignment.centerRight, end: Alignment.centerLeft)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Color.fromARGB(200, 255, 255, 255),
                radius: 100.0,
                child: Image.asset('assets/m.png'),
              ),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Text(
                'Hwc e`p[oic',
                style: TextStyle(color: Colors.white, fontSize: 32.0,fontFamily: 'Coptic'),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    Future.delayed(
        Duration(seconds: 5),
            () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => HomePage())));
  }
}

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePageState();
  }

}

class HomePageState extends State<HomePage>{
  GlobalKey<FormState> _homeKey = GlobalKey<FormState>(debugLabel: '_homeScreenkey');
  Widget whichTaks(text){
    switch(text){
      case 'القداس الباسيلي': Navigator.push(context, MaterialPageRoute(builder: (context)=> Basily(text))); break;
      case 'القداس الغريغوري': Navigator.push(context, MaterialPageRoute(builder: (context)=> Gregory(text))); break;
      case 'القداس الكيرلسي' : Navigator.push(context, MaterialPageRoute(builder: (context)=> Kirrolosy(text))); break;
      case 'طقس عيد النيروز' :Navigator.push(context, MaterialPageRoute(builder: (context)=> Nayrooz(text))); break;
      case 'طقس أعياد يوحنا المعمدان':  Navigator.push(context, MaterialPageRoute(builder: (context)=> Yohanna(text))); break;
      case 'طقس عيد الصليب':  Navigator.push(context, MaterialPageRoute(builder: (context)=> EedSaleeb(text))); break;
      case 'طقس شهر كيهك':  Navigator.push(context, MaterialPageRoute(builder: (context)=> Keyahk(text))); break;
      case 'طقس برمون عيد الميلاد':  Navigator.push(context, MaterialPageRoute(builder: (context)=> BaramonMylad(text))); break;
      case 'طقس عيد الميلاد':  Navigator.push(context, MaterialPageRoute(builder: (context)=> Mylad(text))); break;
      case 'طقس برمون عيد الغطاس':  Navigator.push(context, MaterialPageRoute(builder: (context)=> BaramonGhotac(text))); break;
      case 'طقس عيد الغطاس':  Navigator.push(context, MaterialPageRoute(builder: (context)=> Ghotac(text))); break;
      case 'طقس عيد عُرس قانا الجليل':  Navigator.push(context, MaterialPageRoute(builder: (context)=> KanaGaleel(text))); break;
      case 'طقس صوم و فصح يونان':  Navigator.push(context, MaterialPageRoute(builder: (context)=> SoomYonan(text))); break;
      case 'طقس الصوم الكبير':  Navigator.push(context, MaterialPageRoute(builder: (context)=> SoomKebeer(text))); break;
      case 'طقس عيد البشارة':  Navigator.push(context, MaterialPageRoute(builder: (context)=> Beshara(text))); break;
      case 'طقس سبت لعازر':  Navigator.push(context, MaterialPageRoute(builder: (context)=> SabtLe3azar(text))); break;
      case 'طقس أحد الشعانين':  Navigator.push(context, MaterialPageRoute(builder: (context)=> A7adElSha3aneen(text))); break;
      case 'طقس البصخة المقدسة':  Navigator.push(context, MaterialPageRoute(builder: (context)=> AlBas5a(text))); break;
      case 'طقس خميس العهد':  Navigator.push(context, MaterialPageRoute(builder: (context)=> KhameesEl3ahd(text))); break;
      case 'طقس الجمعة العظيمة':  Navigator.push(context, MaterialPageRoute(builder: (context)=> Gom3a3azeema(text))); break;
      case 'طقس ليلة أبو غالمسيس':  Navigator.push(context, MaterialPageRoute(builder: (context)=> SabtFara7(text))); break;
      case 'طقس عيد القيامة':  Navigator.push(context, MaterialPageRoute(builder: (context)=> EedAlQeyama(text))); break;
      case 'طقس عيد الصعود':  Navigator.push(context, MaterialPageRoute(builder: (context)=> AlSo3ood(text))); break;
      case 'طقس عيد العنصرة':  Navigator.push(context, MaterialPageRoute(builder: (context)=> Al3ansara(text))); break;
      case 'طقس صوم الرسل و عيدهم':  Navigator.push(context, MaterialPageRoute(builder: (context)=> SoomElRosol(text))); break;
      case 'طقس عيد التجلي':  Navigator.push(context, MaterialPageRoute(builder: (context)=> ElTagally(text))); break;
      case 'طقس صوم العذراء و أعيادها':  Navigator.push(context, MaterialPageRoute(builder: (context)=> SoomEl3adra(text))); break;


    }
  }


  Widget button(text){
    return InkWell(
      onTap: () => whichTaks(text),
      child: new Container(
        //width: 100.0,
        height: 50.0,
        decoration: new BoxDecoration(
          color: Color.fromARGB(140, 6, 3, 97),
          border: new Border.all(color: Colors.white, width: 2.0),
          borderRadius: new BorderRadius.circular(30.0),
        ),
        child: new Center(child: new Text(text, style: new TextStyle(fontSize: 18.0, color: Colors.white),),),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(170, 6, 3, 97),
        title: Text('Home'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            button('القداس الباسيلي'),
            Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
            button('القداس الغريغوري'),
            Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
            button('القداس الكيرلسي'),
            Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
            button('طقس عيد النيروز'),
            Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
            button('طقس أعياد يوحنا المعمدان'),
            Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
            button('طقس عيد الصليب'),
            Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
            button('طقس شهر كيهك'),
            Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
            button('طقس برمون عيد الميلاد'),
            Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
            button('طقس عيد الميلاد'),
            Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
            button('طقس برمون عيد الغطاس'),
            Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
            button('طقس عيد الغطاس'),
            Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
            button('طقس عيد عُرس قانا الجليل'),
            Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
            button('طقس صوم و فصح يونان'),
            Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
            button('طقس الصوم الكبير'),
            Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
            button('طقس عيد البشارة'),
            Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
            button('طقس سبت لعازر'),
            Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
            button('طقس أحد الشعانين'),
            Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
            button('طقس البصخة المقدسة'),
            Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
            button('طقس خميس العهد'),
            Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
            button('طقس الجمعة العظيمة'),
            Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
            button('طقس ليلة أبو غالمسيس'),
            Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
            button('طقس عيد القيامة'),
            Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
            button('طقس عيد الصعود'),
            Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
            button('طقس عيد العنصرة'),
            Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
            button('طقس صوم الرسل و عيدهم'),
            Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
            button('طقس عيد التجلي'),
            Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
            button('طقس صوم العذراء و أعيادها'),
            Divider(color: Color.fromARGB(170, 6, 3, 97),height: 20.0,),
          ],
        ),
      ),
    );
  }
}