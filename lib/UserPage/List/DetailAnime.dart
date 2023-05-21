import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';


class DetailAnime extends StatefulWidget {
  final idAnime;
  const DetailAnime({Key? key, required this.idAnime}) : super(key: key);

  @override
  State<DetailAnime> createState() => _DetailAnimeState();
}

class _DetailAnimeState extends State<DetailAnime> {

  late String stringResponsedetail;
  Map? mapResponsedetail;
  List? listResponsedetail;

  Future apicallAnimeDetail()async{
    http.Response response;
    response = await http.get(Uri.parse("https://api.jikan.moe/v4/anime/"+widget.idAnime+"/full"));
    if(response.statusCode == 200){
      setState(() {
        stringResponsedetail = response.body;
        mapResponsedetail = json.decode(response.body);
      });
    }
  }


  @override

  void initState(){
    apicallAnimeDetail();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Anime Detail"),
      ),
      body: _detailAnime(),
    );
  }

  Widget _detailAnime(){
    return ListView(
      children: [
        Center(
        child: Column(
        children: [
            _imageAnime(),
            SizedBox(height: 20,),
            _detailAnimedesc(),
            SizedBox(height: 20,),
            _animesynopsis()
        ],
        ),
        )
      ],
    );
  }

  Widget _imageAnime(){
    return Container(
      child: Image.network(mapResponsedetail!['data']['images']['webp']['large_image_url']),
    );
  }
  
  Widget _detailAnimedesc(){
    return Container(
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  SizedBox(width: 200,),
                  Text(mapResponsedetail!['data']['rating'].toString()),
                  SizedBox(width: 50,),
                  Text(mapResponsedetail!['data']['type']),
                  SizedBox(width: 50,),
                  Container(
                    child: Row(
                      children: [
                        Icon(Icons.star_rate),
                        Text(mapResponsedetail!['data']['score'].toString()),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
    );
  }

  Widget _animesynopsis(){
    return Container(
      child: Column(
        children: [
          Text("Synopsis"),
          SizedBox(height: 20,),
          Text(mapResponsedetail!['data']['synopsis'])
        ],
      ),
    );
  }

}
