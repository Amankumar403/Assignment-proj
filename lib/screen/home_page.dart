import 'package:a_project/models/data_list.dart';
import 'package:a_project/screen/details_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Text("STORIES",style: TextStyle(color: Colors.redAccent.shade100),),
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 0.74,
              mainAxisSpacing: 1,
          ),
          itemCount: appdata.length,
          itemBuilder: (context , index){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("  More Story..."),
                ItemList(appData: appdata[index],)
              ],
            );
          }
      )
    );
  }
}

class ItemList extends StatelessWidget {
  final AppData appData;
  const ItemList({super.key, required this.appData});
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(15),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, CupertinoPageRoute(builder: (context)=>DetailsPage(appData: appData,)));
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(10)
          ),
          child: Padding(padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 220,width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
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
                SizedBox(height: 10,),
                Text(appData.name,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                SizedBox(height: 8,),
                Text(appData.title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                SizedBox(height: 5,),
                RichText(
                  text: TextSpan(text: appData.description,style: TextStyle(fontSize: 15,color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(text: "..more",style: TextStyle(fontSize: 15,color: Colors.blue))
                  ]
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

