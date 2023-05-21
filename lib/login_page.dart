
import 'package:flutter/material.dart';
import 'package:fp_tpm_animelist/UserPage/UserMainPage.dart';

//Hive
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:fp_tpm_animelist/model/loginModel.dart';
import 'package:fp_tpm_animelist/boxes.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String username = "";
  String password = "";
  bool isLoginSuccess = false;
  //late String username, password (bisa kosong dan baru bisa diakses ketika sudah diisi)

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: (isLoginSuccess)?Colors.lightGreenAccent:Colors.red,
            title: Text('Login Page'),
          ),
          body: Column(
            children: [
              _usernameField(),// _ menandakan kalau itu private
              _passwordField(),
              _loginButton(username,password),
            ],
          ),
        )
    );
  }
  Widget _usernameField(){
    return Container(
      padding: EdgeInsets.symmetric(vertical:10 ,horizontal:20 ),
      child: TextFormField(
        onChanged: (value){
          username = value;
        },
        decoration: InputDecoration(
          labelText: 'Username',
          labelStyle: TextStyle(
              color:(isLoginSuccess)?Colors.lightGreenAccent:Colors.red
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:BorderSide(
                  color: (username == "wawan")?Colors.lightGreenAccent:Colors.red
              )
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:BorderSide(color: (username == "wawan")?Colors.lightGreenAccent:Colors.red)
          ),
        ),
      ),
    );
  }
  Widget _passwordField(){
    return Container(
      padding: EdgeInsets.symmetric(vertical:10 ,horizontal:20 ),
      child: TextFormField(
        onChanged: (value){
          password = value;
        },
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Password',
          labelStyle: TextStyle(
              color:(password == "123200139")?Colors.lightGreenAccent:Colors.red
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:BorderSide(
                  color: (password == "123200139")?Colors.lightGreenAccent:Colors.red
              )
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:BorderSide(color: (isLoginSuccess)?Colors.lightGreenAccent:Colors.red)
          ),
        ),
      ),
    );
  }
  Widget _loginButton(String uname, String pass){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: (isLoginSuccess) ? Colors.lightGreenAccent: Colors.red
          ),
          onPressed: () {
            String text = "";
            if(username == "wawan" && password == "123200139"){

              addLoginData(String unames, String upass){
                final logindata = loginData()
                  ..username = unames
                  ..password = upass;

                final box = Boxes.getloginData();
                box.add(logindata);
              }

              setState(() { //menggenerate ulang tampilan
                addLoginData(uname, pass);//tambahkan ke hive
                isLoginSuccess = true;
                text = "Login bergasil";
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(
                    builder: (context)=>UserMainPage()
                    ),
                      (route) => false
                );
              });
            }else if(username == "wawan"){
              setState(() {
                text = "Login Gagal, password salah";
              });
            }else if(password == "123200139"){
              setState(() {
                text = "Login Gagal, username salah";
              });
            }
            else{
              setState(() {
                isLoginSuccess = false;
                text = "Login Gagal";
              });
            }
            SnackBar snackBar = SnackBar(content: Text(text),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          child: Text('Login')
      ),
    );
  }

}

