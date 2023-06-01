import 'package:hive/hive.dart';

part 'loginModel.g.dart';

@HiveType(typeId: 1)
class loginData extends HiveObject{
  @HiveField(0)
  late String username;

  @HiveField(1)
  late String password;

  loginData({required this.username, required this.password});

}


//setelah selesai buat HIVE db jalankan command :
//flutter packages pub run build_runner build