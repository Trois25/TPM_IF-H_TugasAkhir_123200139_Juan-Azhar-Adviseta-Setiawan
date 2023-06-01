import 'package:flutter/material.dart';
import 'package:fp_tpm_animelist/UserPage/userRecomendationSite.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:fp_tpm_animelist/Page/AnimeRankPage.dart';
import 'package:fp_tpm_animelist/UserPage/UserProfile.dart';
import 'package:fp_tpm_animelist/UserPage/userAnimeListPage.dart';
import 'package:fp_tpm_animelist/UserPage/userSearchAnime.dart';
import 'package:fp_tpm_animelist/UserPage/userLogout.dart';
import 'package:fp_tpm_animelist/UserPage/userMenuSaran.dart';

class UserMainPage extends StatefulWidget {
  const UserMainPage({Key? key}) : super(key: key);

  @override
  State<UserMainPage> createState() => _UserMainPageState();
}

class _UserMainPageState extends State<UserMainPage> {

  late SharedPreferences logindata;

  void initState(){
    super.initState();
    init();
  }

  void init() async{
    logindata = await SharedPreferences.getInstance();
  }

  List<String> Appbartitle = [
    'Anime List', 'Anime Rank','Menu Saran', 'Profile'
  ];
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    AnimeList(),
    AnimeRank(),
    MenuSaran(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey
      ),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(Appbartitle[_selectedIndex]),
            actions: [
              IconButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context)=>SearchAnime()));
                  },
                  icon: Icon(Icons.search)),
              IconButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context)=>RecomendationSite()));
                  },
                  icon: Icon(Icons.recommend)),
              IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context)=> userLogout()));
              }, icon: Icon(Icons.logout))
            ],
          ),
          body: Padding(
            padding: EdgeInsets.all(10),
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.grey,
            items: const[
              BottomNavigationBarItem(
                  icon: Icon(Icons.video_collection),
                  label: 'Anime List'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.book),
                  label: 'Anime Rank'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.book_rounded),
                  label:'Menu Saran'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_rounded),
                  label: 'Profile'
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.white,
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
          ),
        ),
      ),
    );
  }
}
