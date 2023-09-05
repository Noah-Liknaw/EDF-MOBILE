import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:edf/Pages/sdnav.dart';
import 'package:edf/screens/order_placed_screen.dart';
import 'tabview.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Dra(),
      appBar: AppBar(title: Text("about"),
      flexibleSpace: Container(
      decoration: const BoxDecoration(
          gradient:         LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: <Color>[Color.fromRGBO(4, 99, 4, 1),Color.fromRGBO(76, 161, 70, 1)]),
),
    ),),
      body: Container(
        margin: const EdgeInsets.only(top: 2),
        child: Column(
          children: [
            Stack(children: [
              Image.asset("assets/images/aboutimage.png"),
              Builder(
                builder: (BuildContext context) {
                  return GestureDetector(
                    child: Container(
                      margin: const EdgeInsets.only(left: 20, top: 60),
                    //   child: Image.network(
                    //       'https://raw.githubusercontent.com/Aminadab23/task1assets/master/Vector.png'),
                    // ),
                    // child: const Icon(Icons.arrow_back_ios_new_outlined,size: 30,weight: 30, color: Colors.white70,),
                    
                    child: Text(""),
                    ),
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                  );
                },
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 170),
                  child: Image.asset(
                      'assets/images/vegansticky.png'),
                ),
              )
            ]),
            Container(
                margin: const EdgeInsets.only(top: 10),
                child: const Center(
                  child: Column(children: [
                    Text(
                      "About us",
                      style:
                          TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "lorem ipsom dolor",
                      style: TextStyle(
                          fontStyle: FontStyle.italic, color: Colors.black26),
                    )
                  ]),
                )),
            const TheTabs()
          ],
        ),
      ),
    );
  }
}
