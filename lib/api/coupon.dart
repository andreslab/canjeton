import 'dart:convert';
import 'package:canjeton/api/data_offline.dart';

import '../utils/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart' show required;
import '../config.dart';
import '../utils/session.dart';
import './coupon.dart';

class CouponAPI {

  final _session = Session();

  Future<List> getCouponsList(BuildContext context) async {

    try {

      var uri = Uri.https(AppConfig.apiHost, "/api/v1/coupons");

      final http.Response response = await http.get(uri);
    
      //final responseString = response.body;

      print("GET COUPON LIST | URL: " + uri.toString());

      final parsed = jsonDecode(response.body);

      
      const dataOffline = true;

      if (dataOffline) {
        //DataOffL list = new DataOffL.fromJsonString(DataCanjeton().testJson);
        //print(list[0].Obj.Title);  // <- now prints "Volvo 140"

        DataOffL list = new DataOffL.fromJsonString(DataCanjeton().dataListCoupon);
        print(list[0].coupon_title);

        return list.toList();
      }

      if (response.statusCode == 200) {

        final data = parsed["data"] as List;
        print("response 200: ${response.body}");

        return data;
      }else if (response.statusCode == 500){
        //lanza excepcion
        throw PlatformException(code: "500", message: parsed["message"]);
      }

      throw PlatformException(code: "201", message: "Error getCouponsList");

    } on PlatformException catch(e){
      print("Error ${e.code}:${e.message}");
      Dialogs.alert(context, title: "ERROR", message: e.message, onOk: (){

      });
      return null;
    }
  }

  Future<bool> getCouponById(BuildContext context,
  {@required String id}) async {

    try {

      var uri = Uri.https(AppConfig.apiHost, "/api/v1/coupons/{$id}");

      final http.Response response = await http.get(uri);
    
      //final responseString = response.body;

      print("GET COUPON BY ID | URL: " + uri.toString());

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

      throw PlatformException(code: "201", message: "Error getCouponById");

    } on PlatformException catch(e){
      print("Error ${e.code}:${e.message}");
      Dialogs.alert(context, title: "ERROR", message: e.message, onOk: (){

      });
      return false;
    }
  }

  Future<bool> saveCouponByUser(BuildContext context, 
  {@required String idUser, 
  @required String idCoupon}) async {
    try {
      final url = "${AppConfig.apiHost}/api/auth/coupon";

      final http.Response response = await http.post(url,
      body: {
        "id_user": idUser,
        "id_coupon": idCoupon,});
    
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

      throw PlatformException(code: "201", message: "Error saveCouponByUser");

    } on PlatformException catch(e){
      print("Error ${e.code}:${e.message}");
      Dialogs.alert(context, title: "ERROR", message: e.message, onOk: (){
        
      });
      return false;
    }
  }
}


/*
//obtiene una respuesya futura
  Future<bool> noName(BuildContext context) async {

    Map<String, String> params = {
        "title": "Cerveza 20perla 20del 20pacifico 20cupon 201", 
        "description": "Nueva 20presentación", 
        "value_discount": "10",
        "given_coupon": "1",
        "start_date":"2019-11-01 2021:22:29",
        "end_date":"2019-11-30 2021:22:29",
        "status":"1",
        "category_id":"1",
        "type_discount_id":"1",
        "business_branch_id":"1"};

    try {

      var uri = Uri.https(AppConfig.apiHost, "/api/auth/coupons", params);

      final http.Response response = await http.get(uri);

    
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
*/