import 'package:flutter/material.dart';
import 'package:kuis/belanja_data.dart';

import 'detail_page.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List belanja"),
        backgroundColor: Colors.pinkAccent,
        leading: Icon(Icons.home),
      ),
      body: ListView.builder(itemBuilder: (context,index){
        final  Groceries Belanja = groceryList[index];
        return Card(
          child: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder:(context){
                return DetailPage(Belanja: Belanja);
              }));
            },
            child: Container(
              height: (MediaQuery.of(context).size.height)/4,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Image.network(Belanja.productImageUrls[0], fit: BoxFit.cover, width: MediaQuery.of(context).size.width, color: Colors.black45, colorBlendMode: BlendMode.darken,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textAlignLeftWhite(Belanja.name),
                      textAlignLeftWhite(Belanja.price)
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
        itemCount: groceryList.length,
      ),
    );
  }
}

Widget textAlignLeftWhite(String text) {
  return Text(
    text,
    textAlign: TextAlign.left,
    style: TextStyle(
      color: Colors.white,
      fontSize: 30,
    ),
  );
}