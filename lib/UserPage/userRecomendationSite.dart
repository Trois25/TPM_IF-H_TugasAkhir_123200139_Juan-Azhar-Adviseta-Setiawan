import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RecomendationSite extends StatefulWidget {
  const RecomendationSite({Key? key}) : super(key: key);

  @override
  State<RecomendationSite> createState() => _RecomendationSiteState();
}

class _RecomendationSiteState extends State<RecomendationSite> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recomendation Sites'),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background.jpg"), fit: BoxFit.cover,)
        ),
        child: Center(
          child: ListView(
            children: [
              Container(
                child: Column(
                  children: [
                    SizedBox(height:10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width: 300,
                            height: 50,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Illegal Sites", style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),),
                              SizedBox(width:15),
                              Icon(Icons.dangerous_outlined,),
                            ],
                          )
                        ),
                      ],
                    ),
                    SizedBox(height:15),
                    Container(
                      width: 300,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Column(
                        children: [
                          SizedBox(height:20),
                          Image(image: AssetImage('assets/images/samehadaku.png'),
                            width: 200,height: 100,fit: BoxFit.fill,),
                          TextButton(
                              onPressed: () async{
                                const url = 'https://samehadaku.day/';
                                if (await canLaunch(url)) {
                                  await launch(url, forceWebView: true, enableJavaScript: true);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                              child: Text("Samehadaku",style: TextStyle(
                                color: Colors.white
                              ),)),
                        ],
                      ),
                    ),
                    SizedBox(height:15),
                    Container(
                      width: 300,
                      height: 150,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Column(
                        children: [
                          SizedBox(height:20),
                          Image(image: AssetImage('assets/images/otakudesu.png'),
                            width: 200,height: 100,fit: BoxFit.fill,),
                          TextButton(
                              onPressed: () async{
                                const url = 'https://otakudesu.lol/';
                                if (await canLaunch(url)) {
                                  await launch(url, forceWebView: true, enableJavaScript: true);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                              child: Text("Otakudesu",style: TextStyle(
                                color: Colors.white
                              ),
                              )),
                        ],
                      ),
                    ),
                    SizedBox(height:15),
                    Container(
                      width: 300,
                      height: 150,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Column(
                        children: [
                          SizedBox(height:20),
                          Image(image: AssetImage('assets/images/anibatch.png'),
                            width: 200,height: 100,fit: BoxFit.fill,),
                          TextButton(
                              onPressed: () async{
                                const url = 'https://anibatch.anibatch.moe/';
                                if (await canLaunch(url)) {
                                  await launch(url, forceWebView: true, enableJavaScript: true);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                              child: Text("Anibatch",style: TextStyle(
                                  color: Colors.white
                              ),)),
                        ],
                      ),
                    ),
                    SizedBox(height:15),
                    Container(
                      width: 300,
                      height: 150,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Column(
                        children: [
                          SizedBox(height:20),
                          Image(image: AssetImage('assets/images/animeindo.png'),
                            width: 200,height: 100,fit: BoxFit.fill,),
                          TextButton(
                              onPressed: () async{
                                const url = 'https://185.224.82.193/';
                                if (await canLaunch(url)) {
                                  await launch(url, forceWebView: true, enableJavaScript: true);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                              child: Text("AnimeIndo",style: TextStyle(
                                  color: Colors.white
                              ),)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height:20),
              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width: 300,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Legal Sites", style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),),
                                SizedBox(width:15),
                                Icon(Icons.check,),
                              ],
                            )
                        ),
                      ],
                    ),
                    SizedBox(height:20),
                    Container(
                      width: 300,
                      height: 150,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Column(
                        children: [
                          SizedBox(height:20),
                          Image(image: AssetImage('assets/images/bstation.png'),
                            width: 200,height: 100,fit: BoxFit.fill,),
                          TextButton(
                              onPressed: () async{
                                const url = 'https://www.bilibili.tv/id/anime';
                                if (await canLaunch(url)) {
                                  await launch(url, forceWebView: true, enableJavaScript: true);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                              child: Text("BStation",style: TextStyle(
                                  color: Colors.white
                              ),)),
                        ],
                      ),
                    ),
                    SizedBox(height:15),
                    Container(
                      width: 300,
                      height: 150,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Column(
                        children: [
                          SizedBox(height:20),
                          Image(image: AssetImage('assets/images/museindonesia.png'),
                            width: 200,height: 100,fit: BoxFit.fill,),
                          TextButton(
                              onPressed: () async{
                                const url = 'https://www.youtube.com/@MuseIndonesia';
                                if (await canLaunch(url)) {
                                  await launch(url, forceWebView: true, enableJavaScript: true);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                              child: Text("Muse Indonesia",style: TextStyle(
                                  color: Colors.white
                              ),)),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
