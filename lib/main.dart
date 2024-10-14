import 'package:a_project/models/data_list.dart';
import 'package:a_project/screen/favorite_screen.dart';
import 'package:a_project/screen/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: firstscreen(appData: appdata.first,)
    );
  }
}

class firstscreen extends StatelessWidget {
  final AppData appData;
  const firstscreen({super.key, required this.appData,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("A Project"),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          Padding(padding: EdgeInsets.all(8),
              child: IconButton(icon: Icon(Icons.search,size: 25,), onPressed: () {},))
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.black26,
        child: Padding(padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(height: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: NetworkImage(appData.imageUrl)
                  )
                ),
              ),
              Divider(height: 2,color: Colors.redAccent,),
             SizedBox(height: 5,),
             GestureDetector(
               onTap: (){
                 Navigator.push(context, CupertinoPageRoute(builder: (context)=>Favorite(appDatas: appData,)));
               },
               child: Container(
                 padding: EdgeInsets.all(10),
                 height: 50,
                 decoration: BoxDecoration(
                     color: Colors.white10,
                   borderRadius: BorderRadius.circular(15)
                 ),
                 child:  Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text("Save",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                     Icon(Icons.favorite,color: Colors.redAccent,size: 20,)
                   ],
                 ),
               ),
             )
            ],
          ),
        )
      ),
      body: HomePage(),
    );
  }
}


