import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fp_tpm_animelist/UserPage/List/DetailAnime.dart';
import 'package:fp_tpm_animelist/login_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RecomendationList extends StatefulWidget {
  const RecomendationList({Key? key}) : super(key: key);

  @override

  State<RecomendationList> createState() => _RecomendationListState();
}

class _RecomendationListState extends State<RecomendationList> {

  Map? mapResponserecomendation;
  List? listResponserecomendation;

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

  @override

  void initState(){
    apicallAnimeRecomendation();
    super.initState();
  }

  Widget build(BuildContext context) {
    if(listResponserecomendation == null){
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("Recomendation Anime List"),
      ),
      body: ListView.builder(
          itemCount: listResponserecomendation!.length,
          itemBuilder:(context,index){
            return Card(
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>
                          DetailAnime(idAnime : listResponserecomendation![index]['mal_id'].toString())));
                },
                child: ListTile(
                  leading: Image.network(listResponserecomendation![index]['images']['webp']['image_url'],height: 100,fit: BoxFit.fill,),
                  title: Text(listResponserecomendation![index]['title'], textAlign: TextAlign.left,),
                  subtitle: Text("Score : " + listResponserecomendation![index]['score'].toString(),textAlign: TextAlign.left,),
                )
              ),
            );
          }
          )
    );
  }
}
