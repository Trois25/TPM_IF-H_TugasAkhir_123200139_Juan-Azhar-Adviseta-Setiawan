import 'package:hive/hive.dart';
import 'package:fp_tpm_animelist/model/loginModel.dart';

class Boxes {
  static Box<loginData> getloginData()=>
      Hive.box<loginData>('loginModel');
}