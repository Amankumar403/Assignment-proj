import 'package:flutter/material.dart';



class searchbar extends StatelessWidget {
  const searchbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
                margin: EdgeInsets.all(15),
                height: 50,width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black12
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search",
                        filled: false
                    ),
                  ),
                )
            )
        )
    );
  }
}