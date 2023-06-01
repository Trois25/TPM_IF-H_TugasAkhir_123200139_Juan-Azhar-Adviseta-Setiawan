import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AnimeList extends StatefulWidget {
  const AnimeList({Key? key}) : super(key: key);

  @override
  State<AnimeList> createState() => _AnimeListState();
}

class _AnimeListState extends State<AnimeList> {

  Map? mapResponserecomendation;
  List? listResponserecomendation;

  Map? mapResponsethisseason;
  List? listResponsethisseason;

  Map? mapResponsenextseason;
  List? listResponsenextseason;

  Future apicallAnimeRecomendation()async{
    http.Response response;
    response = await http.get(Uri.parse("https://api.jikan.moe/v4/anime"));
    if(response.statusCode == 200){
      setState(() {
        mapResponserecomendation = json.decode(response.body);
        listResponserecomendation = mapResponserecomendation!['data'];
      });
    }
  }

  Future apicallAnimeNextseason()async{
    http.Response response;
    response = await http.get(Uri.parse("https://api.jikan.moe/v4/seasons/upcoming"));
    if(response.statusCode == 200){
      setState(() {
        mapResponsenextseason = json.decode(response.body);
        listResponsenextseason = mapResponsenextseason!['data'];
      });
    }
  }

  Future apicallAnimeThisseason()async{
    http.Response response;
    response = await http.get(Uri.parse("https://api.jikan.moe/v4/seasons/now"));
    if(response.statusCode == 200){
      setState(() {
        mapResponsethisseason = json.decode(response.body);
        listResponsethisseason = mapResponsethisseason!['data'];
      });
    }
  }

  @override
  void initState(){
    apicallAnimeRecomendation();
    apicallAnimeThisseason();
    apicallAnimeNextseason();
    super.initState();
  }

  Widget build(BuildContext context) {
    if(listResponserecomendation == null){
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Container(
      child: ListView(
        children: [
          Container(
            child: Text("Anime Recomendation", style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
            ),),
          ),
          _animeRecomendation(),
          Container(
            padding: EdgeInsets.only(top: 5),
            child: Text("Anime This Season", style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
            ),),
          ),
          _animethisSeason(),
          Container(
            child: Text("Anime Next Season Upcoming", style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
            ),),
          ),
          _animenextSeason(),
        ],
      ),
    );
  }

  Widget _animeRecomendation(){
    return Container(
      padding: EdgeInsets.only(bottom: 5),
      child: Container(
        height: 350,
        child: ListView.builder(scrollDirection : Axis.horizontal,itemBuilder: (context, index){
          return Container(
            child: Column(
              children: [
                Padding(padding: const EdgeInsets.all(10.0),
                  child: Image.network(listResponserecomendation![index]['images']['webp']['image_url'],height: 300,fit: BoxFit.fill,),
                ),
                Text(listResponserecomendation![index]['title'])
              ],
            ),
          );
        },
          itemCount: listResponserecomendation!.length,
        ),
      ),
    );
  }

  Widget _animenextSeason(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Container(
        height: 350,
        child: ListView.builder(scrollDirection : Axis.horizontal,itemBuilder: (context, index){
          return Container(
            child: Column(
              children: [
                Padding(padding: const EdgeInsets.all(10.0),
                  child: Image.network(listResponsenextseason![index]['images']['webp']['image_url'],height: 300,fit: BoxFit.fill,),
                ),
                Text(listResponsenextseason![index]['title'])
              ],
            ),
          );
        },
          itemCount: listResponsenextseason!.length,
        ),
      ),
    );
  }

  Widget _animethisSeason(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Container(
        height: 350,
        child: ListView.builder(scrollDirection : Axis.horizontal,itemBuilder: (context, index){
          return Container(
            child: Column(
              children: [
                Padding(padding: const EdgeInsets.all(10.0),
                  child: Image.network(listResponsethisseason![index]['images']['webp']['image_url'],height: 300,fit: BoxFit.fill,),
                ),
                Text(listResponsethisseason![index]['title'])
              ],
            ),
          );
        },
          itemCount: listResponsethisseason!.length,
        ),
      ),
    );
  }

}
