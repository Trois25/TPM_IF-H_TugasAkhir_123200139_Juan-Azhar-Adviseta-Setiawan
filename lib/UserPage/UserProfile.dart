import 'package:flutter/material.dart';
import 'package:fp_tpm_animelist/UserPage/userConvert.dart';
import 'package:fp_tpm_animelist/boxes.dart';
import 'package:intl/intl.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  DateTime Date = DateTime.now();

  List<DropdownMenuItem<String>> get dropdownItems{
    List<DropdownMenuItem<String>> zone = [
      DropdownMenuItem(child: Text("London"),value: "London"),
      DropdownMenuItem(child: Text("WIB"),value: "WIB"),
      DropdownMenuItem(child: Text("WITA"),value: "WITA"),
      DropdownMenuItem(child: Text("WIT"),value: "WIT"),
    ];
    return zone;
  }

  String selectedZone = "London";
  int hours = 1;

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
              _accountuname(),
              SizedBox(height: 20,),
              Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          "${DateFormat().format(Date.toUtc().add(Duration(hours: hours)))} $selectedZone"
                      ),
                      SizedBox(width: 15,),
                      DropdownButton(
                          value: selectedZone,
                          onChanged: (String? newZone){
                            setState(() {
                              selectedZone = newZone!;
                              if(selectedZone == "WITA"){
                                hours = 8;
                              }else if (selectedZone == "WIT"){
                                hours = 9;
                              }else if (selectedZone == "WIB"){
                                hours = 7;
                              }else{
                                hours = 1;
                              }
                            });
                          },
                          items: dropdownItems
                      ),

                    ],
                  )
              ),
              SizedBox(height: 15,),
              Container(
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context)=>userConverter()));
                  },
                  child: Text("Money Conversion"),
                ),
              )
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

