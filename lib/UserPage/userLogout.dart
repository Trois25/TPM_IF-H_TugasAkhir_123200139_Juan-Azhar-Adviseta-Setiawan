import 'package:flutter/material.dart';
import 'package:fp_tpm_animelist/MainPage.dart';
import 'package:hive/hive.dart';

class userLogout extends StatelessWidget {
  const userLogout({Key? key}) : super(key: key);

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
}
