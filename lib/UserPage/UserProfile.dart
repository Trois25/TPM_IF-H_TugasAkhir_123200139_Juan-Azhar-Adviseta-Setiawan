import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:fp_tpm_animelist/model/loginModel.dart';
import 'package:fp_tpm_animelist/boxes.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipOval(
               child: Image(
                 width: 250,
                 height: 250,
                 image: AssetImage('assets/images/profile.jpg'),
                   fit: BoxFit.cover,
               ),
              ),
              Container(
                padding: EdgeInsets.all(15.0),
                child: Text("Juan Azhar Adviseta Setiawan",
                  style: TextStyle(fontSize: 18),),
              ),
              Container(
                child: Text("123200139",style: TextStyle(fontSize: 18),),
              ),
              SizedBox(height: 15,),
              Container(
                child: Text("Hobby : Drawing, Watchin Anime, Coding(?)",style: TextStyle(fontSize: 18),),
              ),
              SizedBox(height: 15,),
              Container(
                child: Text("Dreams : Lecturer",style: TextStyle(fontSize: 18),),
              ),
              SizedBox(height: 15,),
              Container(
                child: Text("Account : "),
              ),
              _accountuname()
            ],
          ),
        ),
      ),
    );
  }

  Widget _accountuname(){
    final mybox = Boxes.getloginData();
    return Container(
      child:Column(
        children: [
          Text(mybox.values.toString()),
        ],
      ),
    );
  }

}

