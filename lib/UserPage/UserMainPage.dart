import 'package:flutter/material.dart';
import 'package:fp_tpm_animelist/Page/AnimeRankPage.dart';
import 'package:fp_tpm_animelist/UserPage/UserProfile.dart';
import 'package:fp_tpm_animelist/UserPage/userAnimeListPage.dart';
import 'package:fp_tpm_animelist/UserPage/userKonversiUang.dart';
import 'package:fp_tpm_animelist/UserPage/userKonversiWaktu.dart';
import 'package:fp_tpm_animelist/UserPage/userLogout.dart';
import 'package:fp_tpm_animelist/UserPage/userMenuSaran.dart';

class UserMainPage extends StatefulWidget {
  const UserMainPage({Key? key}) : super(key: key);

  @override
  State<UserMainPage> createState() => _UserMainPageState();
}

class _UserMainPageState extends State<UserMainPage> {
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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(Appbartitle[_selectedIndex]),
          actions: [
            IconButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>KonversiUang()));
                },
                icon: Icon(Icons.monetization_on_outlined)),
            IconButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>KonversiWaktu()));
                },
                icon: Icon(Icons.access_time_outlined)),
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
          selectedItemColor: Colors.blue,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
