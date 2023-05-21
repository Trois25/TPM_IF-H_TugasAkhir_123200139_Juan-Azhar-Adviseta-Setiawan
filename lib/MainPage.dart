import 'package:flutter/material.dart';
import 'package:fp_tpm_animelist/Page/AnimeListPage.dart';
import 'package:fp_tpm_animelist/Page/AnimeRankPage.dart';
import 'package:fp_tpm_animelist/login_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<String> Appbartitle = ['Anime List', 'Anime Rank'];
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    AnimeList(),
    AnimeRank()
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
                    builder: (context)=>LoginPage()));
              },
                icon: Icon(Icons.login))
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
                label:'Anime Rank'
            )
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
