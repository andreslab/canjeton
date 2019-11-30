import 'dart:convert';
import '../utils/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart' show required;
import '../config.dart';
import '../utils/session.dart';

class AuthAPI {

  final _session = Session();
  //obtiene una respuesya futura
  Future<bool> register(BuildContext context, 
  {@required String name, 
  @required String email, 
  @required String password}) async {
    try {
      final url = "${AppConfig.apiHost}/api/auth/register";

      final http.Response response = await http.post(url,
      body: {
        "name": name, 
        "email": email, 
        "password": password,
        "password_confirmation": password},
        headers: {
          "Content-Type" : "application/x-www-form-urlencoded",
          "X-Requested-With":"XMLHttpRequest"
        });

    
      //final responseString = response.body;

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

      throw PlatformException(code: "201", message: "Error /register");

    } on PlatformException catch(e){
      print("Error ${e.code}:${e.message}");
      Dialogs.alert(context, title: "ERROR", message: e.message, onOk: (){

      });
      return false;
    }
  }

  Future<bool> login(BuildContext context, 
  {@required String email, 
  @required String password}) async {
    try {
      final url = "${AppConfig.apiHost}/oauth/token";

      final http.Response response = await http.post(url,
      body: {
        "client_id": "2",
        "client_secret": "In6mJSpHJBOXQg0VH9f561uDsAKEVCOj2Eg2IzO0",
        "username": email,  
        "password": password,
        "scope":""});
    
      //final responseString = response.body;

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

      throw PlatformException(code: "201", message: "Error /register");

    } on PlatformException catch(e){
      print("Error ${e.code}:${e.message}");
      Dialogs.alert(context, title: "ERROR", message: e.message, onOk: (){
        
      });
      return false;
    }
  }
}
