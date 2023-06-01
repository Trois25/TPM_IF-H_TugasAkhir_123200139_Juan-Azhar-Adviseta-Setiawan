import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:fp_tpm_animelist/login_page.dart';
import 'package:fp_tpm_animelist/model/loginModel.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  late Box<loginData> _datalogin;
  late SharedPreferences prefs;

  bool check = false;

  Future <void> _register() async{
    String username = usernameController.text;
    String password = passwordController.text;

    final hashedPass = sha256.convert(utf8.encode(password)).toString();
    _datalogin.add(loginData(username: username, password: hashedPass));
    await prefs.remove("username");

    if(usernameController.text == ''){
      _showSnackbar('Minimal masukin id');
    }else if(passwordController.text == ''){
      _showSnackbar('Minimal masukin password');
    }else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginPage()),);
      _showSnackbar('Register Succesfull!');
    }
  }

  void _showSnackbar(String message){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  void initState() {
    super.initState();
    initial();
    _datalogin = Hive.box('LoginModel');
  }

  void initial()async{
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title : Text("Registe Page")
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/Register.png"), fit: BoxFit.cover)
        ),
        padding: EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                      Text('Register Page', style: TextStyle(fontSize: 40)),
                      SizedBox(height: 5),
                      Text('Please register to login'),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                label: Text('Username'),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                label: Text('Password'),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(height: 10),
            Container(
                width: double.infinity,
                height: 40,
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _register();
                        }, child: Text('Register'),
                    ),
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}
