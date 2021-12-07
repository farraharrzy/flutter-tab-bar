import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TabBar myTabBar = TabBar(
        //indicatorColor: Color(0xFFF5B994),
        indicator: BoxDecoration(
            color: Color(0xFFF5B994),
            border:
                Border(bottom: BorderSide(color: Color(0xFFEE9C6), width: 5))),
        tabs: [
          //disesuaikan dengan length tabnya
          Tab(icon: Icon(Icons.home)),
          Tab(icon: Icon(Icons.search), text: "Explore"),
          Tab(icon: Icon(Icons.comment), text: "Notification"),
          Tab(
              child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image(image: AssetImage("assets/img/Renji_Abarai.jpg")),
          ))
        ]);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
            length: 4, // jml tab nya
            child: Scaffold(
                appBar: AppBar(
                    title: Text("TabBar Practice",
                        style: TextStyle(color: Colors.white)),
                    backgroundColor: Color(0xFF80BEAF),
                    bottom: PreferredSize(
                        preferredSize:
                            Size.fromHeight(myTabBar.preferredSize.height),
                        child: Container(
                            color: Color(0xFFB3DDD1), child: myTabBar))),
                body: TabBarView(children: [
                  Center(child: Text("Home")),
                  Center(child: Text("Explore")),
                  Center(child: Text("Notification")),
                  Center(
                      child: QrImage(
                          version: 6,
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.black,
                          errorCorrectionLevel: QrErrorCorrectLevel.M,
                          padding: EdgeInsets.all(20),
                          size: 150,
                          data: "https://www.instagram.com/farraharrzy/"))
                ]))));
  }
}
