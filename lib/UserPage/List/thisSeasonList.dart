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
                child: Row(
                  children: [
                    SizedBox(width: 20,),
                    Container(
                      child: Image.network(listResponsethisseason![index]['images']['webp']['image_url'],height: 100,fit: BoxFit.fill,),
                    ),
                    SizedBox(width: 20,),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            child: Text(listResponsethisseason![index]['title']),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Text("Score"),
                                Text(listResponsethisseason![index]['score'].toString())
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}
