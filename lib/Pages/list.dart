

// import 'package:flutter/material.dart';

// void main() {
//   runApp(
//     MaterialApp( 
//       home: MyApp()
//     )
//   );
// }

// class MyApp extends StatefulWidget{
//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//           appBar: AppBar(
//               title:Text("menu"),
//               backgroundColor: Colors.black,
//           ),
//           body: Container(  decoration: BoxDecoration(
//       color: Colors.lightGreenAccent,)
//             alignment:Alignment.topCenter,
//             padding: EdgeInsets.all(15),
//              child: Column(
//                children:[ Padding(
//                           padding: EdgeInsets.all(15), //apply padding to all four sides
//                           child: Text("My Profile"),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.all(15), //apply padding to all four sides
//                           child: Text("Shop"),
//                         ),

//                         Padding(
//                           padding: EdgeInsets.only(left:15, bottom: 20, right: 20, top:10), //apply padding to some sides only
//                           child: Text("My cart"),
//                         ),

//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20), //apply padding horizontal or vertical only
//                           child: Text("About Us"),
//                         ),

//                         Padding(
//                           padding: EdgeInsets.fromLTRB(10, 10, 20, 20), //apply padding to LTRB, L:Left, T:Top, R:Right, B:Bottom
//                           child: Text("Logout"),
//                         ),

                       
//                ]
//              )
//           )
//       );
//   }
// }