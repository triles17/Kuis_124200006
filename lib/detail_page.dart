import 'package:flutter/material.dart';
import 'package:kuis/belanja_data.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  final Groceries Belanja;

  const DetailPage({Key? key, required this.Belanja}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();

}

class _DetailPageState extends State<DetailPage> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: (isFavorite) ? Colors.pinkAccent: Colors.lightBlueAccent,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text ("${widget.Belanja.name}"),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
            icon: (isFavorite)
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border),
          ),
        ],
      ),
      body: SingleChildScrollView (
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(12),
              height: (MediaQuery
                  .of(context)
                  .size
                  .height) / 3,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal:8),
                    child: Image.network(widget.Belanja.productImageUrls[index]),
                  );
                },
                itemCount: widget.Belanja.productImageUrls.length,
              ),
            ),
            Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    textBesar(widget.Belanja.name),
                    SizedBox(height: 10,),
                    SizedBox(height: 10,),
                    textBesar("Deskripsi : " + widget.Belanja.description),
                    SizedBox(height: 10,),
                    textBesar("Stock: " + widget.Belanja.stock),
                    SizedBox(height: 10,),
                    textBesar("Discount: " + widget.Belanja.discount),
                    SizedBox(height: 10,),
                    textBesar("Store Name: " + widget.Belanja.storeName),
                    SizedBox(height: 10,),
                    Card(
                      color: Colors.orange,
                      child: ElevatedButton(
                        onPressed: () {
                          _launchURL(widget.Belanja.productUrl);
                        },
                        child: Text("Halaman Website Produk"),
                      ),
                    ),
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
  Widget textBesar(String text){
    return Text(
      text,
      style: TextStyle(fontSize: 20),
    );
  }

  Widget textSedang(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 16),
    );
  }

  void _launchURL(_url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }
}