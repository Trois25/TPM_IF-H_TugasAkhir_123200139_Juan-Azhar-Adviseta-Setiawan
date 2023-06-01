import 'package:flutter/material.dart';
import 'package:fp_tpm_animelist/UserPage/List/DetailAnime.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class nextSeasonList extends StatefulWidget {
  const nextSeasonList({Key? key}) : super(key: key);

  @override
  State<nextSeasonList> createState() => _nextSeasonListState();
}

class _nextSeasonListState extends State<nextSeasonList> {

  Map? mapResponsenextseason;
  List? listResponsenextseason;

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

  @override

  void initState(){
    apicallAnimeNextseason();
    super.initState();
  }

  Widget build(BuildContext context) {
    if(listResponsenextseason == null){
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("Anime List next Season"),
      ),
      body: ListView.builder(
          itemCount: listResponsenextseason!.length,
          itemBuilder:(context,index){
            return Card(
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>
                          DetailAnime(idAnime : listResponsenextseason![index]['mal_id'].toString())));
                },
                child: ListTile(
                  leading: Image.network(listResponsenextseason![index]['images']['webp']['image_url'],height: 100,fit: BoxFit.fill,),
                  title: Text(listResponsenextseason![index]['title']),
                  subtitle: Text('Score : ' + listResponsenextseason![index]['score'].toString()),
                )
              ),
            );
          }
      ),
    );
  }
}
