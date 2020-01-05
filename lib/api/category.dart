import 'dart:convert';
import '../utils/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import '../config.dart';
import '../utils/session.dart';

class CategoryAPI {

  final _category = Categories();

  Future<bool> getCategoriesList(BuildContext context) async {

    try {

      var uri = Uri.http(AppConfig.apiHost, "/api/v1/categories");

      final http.Response response = await http.get(uri);
    
      //final responseString = response.body;

      print("GET CATEGORY LIST | URL: " + uri.toString());

      final parsed = jsonDecode(response.body);

      if (response.statusCode == 200) {
        final categories = parsed["data"] as List;
        print("response 200: ${response.body}");
        print("response 200: ${categories.toString()}");
        
        //save categories
        for(var i = 0; i < categories.length; i++) {
          await _category.set(
            categories[i]["category_id"],
            categories[i]["category_name"],
            categories[i]["category_description"],
            categories[i]["category_resource_identifier"],
            categories[i]["category_order"],
            categories[i]["category_status"]);
        }
        
        return true;
      }else if (response.statusCode == 500){
        //lanza excepcion
        throw PlatformException(code: "500", message: parsed["message"]);
      }

      throw PlatformException(code: "201", message: "Error getCategoriesList");

    } on PlatformException catch(e){
      print("Error ${e.code}:${e.message}");
      Dialogs.alert(context, title: "ERROR", message: e.message, onOk: (){

      });
      return false;
    }
  }
}