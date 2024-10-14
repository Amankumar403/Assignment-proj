import 'package:a_project/models/data_list.dart';
import 'package:flutter/material.dart';



class Favorite extends StatelessWidget {
  final AppData appDatas;
  const Favorite({super.key, required this.appDatas});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite"),
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context , index){
          return ListTile(
            leading: CircleAvatar(backgroundImage: NetworkImage(appDatas.imageUrl)),
            title: Text(appDatas.name),
            subtitle: Text(appDatas.title),
            trailing: Icon(Icons.delete),
          );
        },
      )
    );
  }
}
