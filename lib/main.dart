import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_radio/flutter_radio.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'album.dart';
import 'album.api.dart';
import 'package:firebase_admob/firebase_admob.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Vay Radio",
      home: WayRadio(),
    );
  }
}
class WayRadio extends StatefulWidget {
  @override

  _WayRadioState createState() => _WayRadioState();
}

class _WayRadioState extends State<WayRadio> {
   static MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(



    childDirected: false,

    testDevices: <String>[], // Android emulators are considered test devices
  );

  BannerAd myBanner = BannerAd(
    // Replace the testAdUnitId with an ad unit id from the AdMob dash.
    // https://developers.google.com/admob/android/test-ads
    // https://developers.google.com/admob/ios/test-ads
    adUnitId: BannerAd.testAdUnitId,
    size: AdSize.fullBanner,
    targetingInfo: targetingInfo,
    listener: (MobileAdEvent event) {
      print("BannerAd event is $event");
    },
  );
@override




  final barColor = const Color(0xff494d5f);
//  final firstColor = const Color(0xffa0d2eb);
//  final secColor = const Color(0xe5eaf5);
//  final thirdColor = const Color(0xffd0bdf4);
//  final fourthColor = const Color(0xff8458B3);
  String url = "https://vayradio95.radioca.st/";

  bool isPlaying = false;
  bool isVisible = true;

  @override
  void initState() {
    FirebaseAdMob.instance.initialize(appId: 'ca-app-pub-3010234158911251~7702862133');

    super.initState();

    audioStart();
    myBanner
    // typically this happens well before the ad is shown
      ..load()
      ..show(
        // Positions the banner ad 60 pixels from the bottom of the screen

        // Positions the banner ad 10 pixels from the center of the screen to the right

        // Banner Position
        anchorType: AnchorType.bottom,
      );
  }



    void _launchemail(String emailId)async{
    var url = "mailto:$emailId";
    if (await canLaunch(url)){
      await launch(url);
    }else{
      throw 'Cloud not send email';
    }
    }

  Future<void> audioStart() async {
    await FlutterRadio.audioStart();

    print('Audio Start OK');
  }
  @override
  Widget build(BuildContext context) {



    openfb(){
      String url = "https://www.facebook.com/VAY-RADIO-103126388138307";
      launch(url);
    }
    openinsta(){
      String url = "https://www.instagram.com/vayradio95/";
      launch(url);
    }
    openweb(){
      String url = "https://www.vayradio.ru/";
      launch(url);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: barColor,
        actions: <Widget>[
          Expanded(
              child:  Row(
                children: <Widget>[

                  Expanded(
                    child: FlatButton(
                      textColor: Colors.white,
                      onPressed: () {
                        openfb();
                      },
                      child: Image.asset(
                          "assets/images/fb.png"
                      ),
                      shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
                    ),
                  ),
                  Expanded(
                    child: FlatButton(
                      textColor: Colors.white,
                      onPressed: () {
                        openinsta();
                      },
                      child: Image.asset(
                          "assets/images/insta.png"
                      ),

                      shape: CircleBorder(side: BorderSide(color: Colors.transparent)),

                    ),
                  ),
                  Expanded(
                    child: FlatButton(
                      textColor: Colors.white,
                      onPressed: () {
                        FlutterOpenWhatsapp.sendSingleMessage("+79280202477", "Hello");
                      },
                      child: Image.asset(
                          "assets/images/wp.png"
                      ),
                      shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
                    ),
                  ),
                  Expanded(
                    child: FlatButton(
                      textColor: Colors.white,
                      onPressed: () {
                        _launchemail('vayradio95@gmail.com');
                      },
                      child:Image.asset(
                          "assets/images/email.png"
                      ),
                      shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
                    ),
                  ),
                  Expanded(
                    child: FlatButton(
                      textColor: Colors.white,
                      onPressed: () {
                        openweb();
                      },
                      child: Image.asset(
                          "assets/images/web.png"
                      ),
                      shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
                    ),
                  ),


                ],
              )
          )

        ],

      ),

      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),

          child: Column(

            children: <Widget>[
              SizedBox(height: 100,),


              Image.asset(
                "assets/images/logo.png",

              ),


              Expanded(
                  child : Column(
                    children: <Widget>[

                      StreamBuilder(
                        stream: Stream.periodic(Duration(seconds: 1))
                  .asyncMap((i) => fetchalbum()),
                        builder: (context,snapshot){
                          if (snapshot.hasData) {

                            var artist = snapshot.data.data[0].track;
                            print(artist);
                            if(artist.artist == "" || artist.title == ""){
                              return Text(
                                "We are Offline",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0
                                ),
                              );
                            }else{
                              return Text(

                                artist.artist +"-"+ artist.title,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0
                                ),
                              );
                            }

                          } else {
                            return Text(
                                "Loading....",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0
                              ),
                            );
                          }
                        }
                      ),
//                      Text(
//                        "Artist-Title",
//                        style: TextStyle(
//                            color: Colors.white,
//                            fontSize: 20.0
//                        ),
//                      ),
                      SizedBox(height: 20,),

                      Padding(
                        padding:EdgeInsets.symmetric(horizontal:10.0),
                        child:Container(
                          height:5.0,
                          width:330.0,
                          color:Colors.white,


                        ),
                      ),
                      Align(
                        alignment: FractionalOffset.center,
                        child: IconButton(
                          iconSize: 80,
                          icon: isPlaying? Icon(
                            Icons.pause_circle_outline,

                            color: Colors.white,
                          )
                              : Icon(
                            Icons.play_circle_outline,
                            color: Colors.white,

                          ),
                          onPressed: (){
                            setState(() {
                              FlutterRadio.play(url: url);
                              isPlaying = !isPlaying;
                              isVisible = !isVisible;
                            });
                          },
                        ),

                      ),
                    ],
                  )

              ),




            ],
          ),
        ),
      ),

    );
  }
}
