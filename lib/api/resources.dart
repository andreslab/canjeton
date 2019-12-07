import 'dart:convert';
import '../utils/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart' show required;
import '../config.dart';
import '../utils/session.dart';

class ResourcesAPI {

  final _session = Session();

  Future<bool> getResourcesList(BuildContext context) async {

    try {

      var uri = Uri.https(AppConfig.apiHost, "/api/v1/resources");

      final http.Response response = await http.get(uri);
    
      //final responseString = response.body;

      print("GET RESOURCES LIST | URL: " + uri.toString());

      final parsed = jsonDecode(response.body);

      if (response.statusCode == 200) {
        final token = parsed["token"] as String;
        final expiresIn = parsed["expiresIn"] as int;
        print("response 200: ${response.body}");
        
        //save token
        await _session.set(token, expiresIn);

        return true;
      }else if (response.statusCode == 500){
        //lanza excepcion
        throw PlatformException(code: "500", message: parsed["message"]);
      }

      throw PlatformException(code: "201", message: "Error /resource");

    } on PlatformException catch(e){
      print("Error ${e.code}:${e.message}");
      Dialogs.alert(context, title: "ERROR", message: e.message, onOk: (){

      });
      return false;
    }
  }

  Future<bool> getResourceById(BuildContext context,
  {@required String id}) async {

    try {

      var uri = Uri.https(AppConfig.apiHost, "/api/v1/resources/{$id}");

      final http.Response response = await http.get(uri);
    
      //final responseString = response.body;

      print("GET RESOURCE BY ID | URL: " + uri.toString());

      final parsed = jsonDecode(response.body);

      if (response.statusCode == 200) {
        final token = parsed["token"] as String;
        final expiresIn = parsed["expiresIn"] as int;
        print("response 200: ${response.body}");
        
        //save token
        await _session.set(token, expiresIn);

        return true;
      }else if (response.statusCode == 500){
        //lanza excepcion
        throw PlatformException(code: "500", message: parsed["message"]);
      }

      throw PlatformException(code: "201", message: "Error /resource");

    } on PlatformException catch(e){
      print("Error ${e.code}:${e.message}");
      Dialogs.alert(context, title: "ERROR", message: e.message, onOk: (){

      });
      return false;
    }
  }
}