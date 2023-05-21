import 'package:flutter/material.dart';
import 'package:fp_tpm_animelist/UserPage/List/DetailAnime.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AnimeRank extends StatefulWidget {
  const AnimeRank({Key? key}) : super(key: key);

  @override
  State<AnimeRank> createState() => _AnimeRankState();
}

class _AnimeRankState extends State<AnimeRank> {

  Map? mapResponserank;
  List? listResponserank;

  Future apicallAnimerank()async{
    http.Response response;
    response = await http.get(Uri.parse("https://api.jikan.moe/v4/top/anime"));
    if(response.statusCode == 200){
      setState(() {
        mapResponserank = json.decode(response.body);
        listResponserank = mapResponserank!['data'];
      });
    }
  }

  @override

  void initState(){
    apicallAnimerank();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: ListView.builder(
          itemCount: listResponserank!.length,
          itemBuilder:(context,index){
            return Card(
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>
                          DetailAnime(idAnime : listResponserank![index]['mal_id'].toString())));
                },
                child: Row(
                  children: [
                    SizedBox(width: 20,),
                    Container(
                      child: Text(listResponserank![index]['rank'].toString()),
                    ),
                    SizedBox(width: 20,),
                    Container(
                      child: Image.network(listResponserank![index]['images']['webp']['image_url'],height: 100,fit: BoxFit.fill,),
                    ),
                    SizedBox(width: 20,),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            child: Text(listResponserank![index]['title']),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Text("Score : "),
                                Text(listResponserank![index]['score'].toString())
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
