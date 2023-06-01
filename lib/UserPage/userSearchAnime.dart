import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchAnime extends StatefulWidget {
  const SearchAnime({Key? key}) : super(key: key);

  @override
  State<SearchAnime> createState() => _SearchAnimeState();
}

class _SearchAnimeState extends State<SearchAnime> {

  Map? mapResponserank;
  List? listResponserank;
  List<dynamic> Anime = [];
  List<dynamic> filteredAnime = [];

  Future apicallAnimerank()async{
    http.Response response;
    response = await http.get(Uri.parse("https://api.jikan.moe/v4/top/anime"));
    if(response.statusCode == 200){
      setState(() {
        mapResponserank = json.decode(response.body);
        listResponserank = mapResponserank!['data'];
        Anime = jsonDecode(response.body)['data'];
        filteredAnime = listResponserank!;
      });
    }
  }


  void updateAnime(String query) {
    setState(() {
      filteredAnime = Anime.where((animetitle) {
        final name = animetitle['title'].toString().toLowerCase();
        return name.contains(query.toLowerCase());
      }).toList();
    });
  }


  @override

  void initState(){
    apicallAnimerank();
    super.initState();
  }

  Widget build(BuildContext context) {
    if(listResponserank == null){
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(

      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Anime Search",style: TextStyle(
              color:Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),),
            SizedBox(height:15),
            TextField(
              onChanged: (value) => updateAnime(value),
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none
                ),
                hintText: "Input Anime Title",
                prefixIcon: Icon(Icons.search, color: Colors.white,),
              ),
            ),
            SizedBox(height:20),
            Expanded(child: ListView.builder(
              itemCount: filteredAnime.length,
              itemBuilder: (context,index) => ListTile(
                leading: Image.network(filteredAnime[index]['images']['webp']['image_url'],height: 100,fit: BoxFit.fill,),
                title: Text(filteredAnime[index]['title']),
                subtitle: Text('Episodes : ' + filteredAnime[index]['episodes'].toString()),
                trailing: Text(filteredAnime[index]['score'].toString(),
                style: TextStyle(color: Colors.amber),),
              )
            ))
          ],
        ),
      ),
    );
  }
}
