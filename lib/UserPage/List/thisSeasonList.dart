import 'package:flutter/material.dart';
import 'package:fp_tpm_animelist/UserPage/List/DetailAnime.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class thisSeasonList extends StatefulWidget {
  const thisSeasonList({Key? key}) : super(key: key);

  @override
  State<thisSeasonList> createState() => _thisSeasonListState();
}

class _thisSeasonListState extends State<thisSeasonList> {

  Map? mapResponsethisseason;
  List? listResponsethisseason;

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
    apicallAnimeThisseason();
    super.initState();
  }

  Widget build(BuildContext context) {
    if(listResponsethisseason == null){
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("Anime List this Season"),
      ),
      body: ListView.builder(
          itemCount: listResponsethisseason!.length,
          itemBuilder:(context,index){
            return Card(
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>
                          DetailAnime(idAnime : listResponsethisseason![index]['mal_id'].toString())));
                },
                child: ListTile(
                  leading: Image.network(listResponsethisseason![index]['images']['webp']['image_url'],height: 100,fit: BoxFit.fill,),
                  title: Text(listResponsethisseason![index]['title']),
                  subtitle: Text('Score : ' + listResponsethisseason![index]['score'].toString()),
                )
              ),
            );
          }
      ),
    );
  }
}
