import 'package:flutter/material.dart';
import 'package:fp_tpm_animelist/MainPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fp_tpm_animelist/login_page.dart';
import 'package:hive/hive.dart';

class userLogout extends StatefulWidget {
  const userLogout({Key? key}) : super(key: key);

  @override
  State<userLogout> createState() => _userLogoutState();
}

class _userLogoutState extends State<userLogout> {

  late SharedPreferences prefs;

  void initState(){
    super.initState();
    Initial();
  }

  void Initial() async{
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    Hive.close();
    return Scaffold(
      appBar: AppBar(
        title: Text("Logout"),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Container(
            height: 100,
            child: Center(
              child: Text("Are you Sure want to Logout?"),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            height: 100,
            child: Center(
              child: ElevatedButton(
                  onPressed: () {
                    prefs.remove("username");
                    //logindata!.setBool('login', true);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainPage(),
                        ),
                            (route) => false);
                  },
                  child: Text('Logout')),
            ),
          )
        ],
      ),
    );
  }

  void logoutpref() async{
    await prefs.remove("username");
  }

}

