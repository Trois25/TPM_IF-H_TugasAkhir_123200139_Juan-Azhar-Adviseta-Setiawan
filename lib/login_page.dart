import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fp_tpm_animelist/UserPage/UserMainPage.dart';
import 'package:fp_tpm_animelist/register_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:crypto/crypto.dart';

//Hive
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:fp_tpm_animelist/model/loginModel.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  late Box<loginData> _datalogin;
  late SharedPreferences prefs;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var error = '';
  bool login = false;

  void initState(){
    super.initState();
      _checkprefLog();
  }

  void _showSnackbar(String message){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  void _checkprefLog() async{
    prefs = await SharedPreferences.getInstance();
    _datalogin = await Hive.openBox('LoginModel');

    bool? isLogin = (prefs.getString("username")!=null) ? true:false;

    if(isLogin && mounted){
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
          builder: (context) => UserMainPage()
      ),
              (route) => false);
    }

  }

  void _login() async{
    bool found = false;
    String username = usernameController.text.trim();
    String password = passwordController.text.trim();
    final hashedPass = sha256.convert(utf8.encode(password)).toString();
    found = checkLogin(username, hashedPass);

    if(!found){
      _showSnackbar('Username or Password false');
    }else{
      await prefs.setString('username', username); //pindahin ke main page
      if(mounted){
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context)=>UserMainPage())
            , (route) => false);
      }
      _showSnackbar("Login Succes");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/Login.jpg"), fit: BoxFit.cover)
            ),
            padding: EdgeInsets.all(20),
            height: MediaQuery.of(context).size.height,
            child: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.blueAccent
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text('Login Page', style: TextStyle(fontSize: 40)),
                              SizedBox(height: 5),
                              Text('Please login to continue'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(

                      decoration: const BoxDecoration(
                          color: Colors.white
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          TextField(
                            controller: usernameController,
                            decoration: InputDecoration(
                              label: Text('Username'),
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 10),
                          TextField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              label: Text('Password'),
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 15,),
                          Row(
                            children: [
                              Text("Don't have account yet ?"),
                              TextButton(onPressed: (){
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => RegisterPage()));
                              }, child: Text('Register here'))
                            ],
                          ),
                        ],
                      ),
                    ),
                    Text(error, style: TextStyle(color: Colors.red, fontSize: 12)),
                    Container(
                        width: double.infinity,
                        height: 100,
                        child: Column(
                          children: [
                            ElevatedButton(
                              onPressed:() {
                                _login();
                              },
                              child: Text('Login'),
                            ),
                            SizedBox(height: 20,),
                          ],
                        )
                    ),
                  ],
                )
              ],
            ),
          ),
    );
  }

  int getLength() {
    return _datalogin.length;
  }

  bool checkLogin(String username, String password) {
    bool found = false;
    for (int i = 0; i < getLength(); i++) {
      if (username == _datalogin.getAt(i)!.username &&
          password == _datalogin.getAt(i)!.password) {
        ("Login Success");
        found = true;
        break;
      } else {
        found = false;
      }
    }

    return found;
  }

  bool checkUsers(String username) {
    bool found = false;
    for (int i = 0; i < getLength(); i++) {
      if (username == _datalogin.getAt(i)!.username) {
        found = true;
        break;
      } else {
        found = false;
      }
    }
    return found;
  }

}

