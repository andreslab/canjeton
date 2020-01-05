import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../api/category.dart';

class SplashPage extends StatelessWidget {

  final _categoryAPI = CategoryAPI();

  @override
  Widget build(BuildContext context) {

    _loadCatalog() async{
    
    //call request
    final isOk = await _categoryAPI.getCategoriesList(context);
      
    if (isOk){
      print("LOGIN");
      Navigator.pushNamed(context, "login");
    }
    
  }

  _loadCatalog();

    return Scaffold(
      body: Center(
        child: Container(
          child: Image.asset("res/img/img_logo.png"),
        ),
      ),
    );
  }
}