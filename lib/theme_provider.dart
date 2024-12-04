import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



class ShowTheme extends ChangeNotifier{
  static String CONTAINER_KEY = 'black_key';
  static String SCAFOLD_KEY = 'pink_key';
  Color black = Colors.black;
  Color cyan = Colors.red;
  ShowTheme(){
    toggleTheme();
  }
  toggleTheme() async {
    var instance  = await SharedPreferences.getInstance();
   black = Color(instance.getInt(CONTAINER_KEY)!);
   cyan = Color(instance.getInt(SCAFOLD_KEY)!);
   notifyListeners();

  }
}