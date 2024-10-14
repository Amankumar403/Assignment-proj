import 'package:a_project/models/data_list.dart';
import 'package:a_project/screen/search_screen.dart';
import 'package:flutter/material.dart';

import '../models/data_description.dart';


class DetailsPage extends StatelessWidget {
  final AppData appData;
  DetailsPage({super.key, required this.appData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("A Project"),
        leading: Container(
          margin: EdgeInsets.all(5),
          child: IconButton(onPressed: (){
            Navigator.pop(context);
          },icon : Icon(Icons.undo_outlined,color: Colors.white,size: 25,),)
        ),
        actions: [
          Padding(padding: EdgeInsets.all(8),
              child: IconButton(icon: Icon(Icons.search,size: 26,), onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>searchbar()));
              },))
        ],
      ),
      body: SingleChildScrollView(
       child: Padding(padding: EdgeInsets.all(15),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             SizedBox(height: 10,),
             Container(
             height: 220,width: double.infinity,
             decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(12),
                 image: DecorationImage(
                     image: NetworkImage(appData.imageUrl),
                     fit: BoxFit.fill
                 )
             ),
               child: Align(
                   alignment: Alignment.topRight,
                   child: Container(
                     padding: EdgeInsets.only(top: 2),
                     margin: EdgeInsets.all(10),
                     height: 40,width: 35,
                     decoration: BoxDecoration(
                         color: Colors.black,
                         shape: BoxShape.circle
                     ),
                     child: GestureDetector(
                         onTap: (){

                         },
                         child: Center(child: Icon(Icons.favorite_border,color: Colors.white,size: 25,),)
                     ),
                   )
               ),
           ),
             SizedBox(height: 5,),
             Text(appData.name,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
             SizedBox(height: 6,),
             Text(appData.title,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
             SizedBox(height: 8,),
             DesData(description: description.first)
           ],
         ),
       ),
      ),
    );
  }
}


class DesData extends StatelessWidget {
  final Description description;
  const DesData({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "Naruto Uzumaki : ",style: TextStyle(fontSize: 22,color: Colors.black),
        children: <TextSpan>[
          TextSpan(text: description.description,style: TextStyle(fontSize: 18,color: Colors.black,))
        ]
      ),
    );
  }
}
