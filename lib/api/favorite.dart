import 'dart:convert';
import '../utils/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart' show required;
import '../config.dart';

class FavoriteAPI {

  Future<List> getFavoriteByUser(BuildContext context, {@required String id}) async {

    try {

      var uri = Uri.https(AppConfig.apiHost, "/api/v1/favorites/3/user");

      final http.Response response = await http.get(uri, headers: {
          "Authorization" : "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6Ijk0NDBhYWU4MWZiMTExNzlhZGE4YzI3YjM3Y2U2MjAxOWQyNmM3NjUwNTllMDg2MmEzNzhmMGQ1MjU2NmEwY2E0OGZkMzE5YTA0MGUyZjkzIn0.eyJhdWQiOiIxIiwianRpIjoiOTQ0MGFhZTgxZmIxMTE3OWFkYThjMjdiMzdjZTYyMDE5ZDI2Yzc2NTA1OWUwODYyYTM3OGYwZDUyNTY2YTBjYTQ4ZmQzMTlhMDQwZTJmOTMiLCJpYXQiOjE1NzU5NTc2NjEsIm5iZiI6MTU3NTk1NzY2MSwiZXhwIjoxNjA3NTgwMDYxLCJzdWIiOiI0Iiwic2NvcGVzIjpbXX0.guzNhOwClNZBjWqGJc9nhOerwFpXk3hWqnZODgdEgGSKVjMLXYhOXgy7AW3QSGUZivUB3KPIvdiCA9_0zgQ8layvcT7iofFdQyzuKJl4wIgWIUTRZ5yW77hpGsmEePcFXmam06U7JgPCuET1woS-OVmTCurKMuPp_FKisBYZxgNAHyIc-jTiOoOza0ebIp_z-aqAro2_-JpRhY8AXYWdJ86dPc2hrlicYbPI2aJbD_MKE0zBWGTr_9rd0KedkX0KKaR_L1wvwRUTSZmWZNPwndZaaBxPpcApKEQi4dWTUB-fHZRiFw4Xfmc_ounG8sRqp4Bsz3m_2iunTBdVzjDvAWpHV0P7yozSd_0fShhZLt09e-vehZbIxGLOvTujYLdxRAPDv7iYFsoCU3xWsITxWbidPtSxqVShmxHkQFF15RBfCm7g5hvpfvQQMZ4g1tS3ZWv3kQLkl3DhJ-qQ4XpWYX2kRWjYFRkxoHr7U937ifrajR9lTr2wyHjFqC2RmqTfb4PNFRL_xjJlnabytXObtvxhkt55INiqdS27Dx9yq1989EiuefLN9NpTmF8bzHx0ga303HfI5em9ghBV86HCX-AxUxLxlYfXNlcTxlCnRJpE_vOCZVFfTU4-6ruBUWzDv0uL-eRJxsocwYSmjZwR5tl3cuN6PY7RwoLo1bCDkHk",
        });

      print("GET FAVORITE LIST | URL: " + uri.toString());

      final parsed = jsonDecode(response.body);
      if (response.statusCode == 200) {

        final data = parsed["data"] as List;
        print("response 200: ${response.body}");
        return data;
      }else if (response.statusCode == 500){
        //lanza excepcion
        throw PlatformException(code: "500", message: parsed["message"]);
      }

      throw PlatformException(code: "201", message: "Error getFavoriteList");

    } on PlatformException catch(e){
      print("Error ${e.code}:${e.message}");
      Dialogs.alert(context, title: "ERROR", message: e.message, onOk: (){

      });
      return null;
    }
  }

  Future<bool> saveCouponByUser(BuildContext context, 
  {@required String idCoupon, 
  @required String idUser}) async {
    try {
      final url = "${AppConfig.apiHost}/api/v1/favorites?coupon_id=${idCoupon}&user_id=${idUser}";

      final http.Response response = await http.post(url,
      headers: {
        "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6Ijk0NDBhYWU4MWZiMTExNzlhZGE4YzI3YjM3Y2U2MjAxOWQyNmM3NjUwNTllMDg2MmEzNzhmMGQ1MjU2NmEwY2E0OGZkMzE5YTA0MGUyZjkzIn0.eyJhdWQiOiIxIiwianRpIjoiOTQ0MGFhZTgxZmIxMTE3OWFkYThjMjdiMzdjZTYyMDE5ZDI2Yzc2NTA1OWUwODYyYTM3OGYwZDUyNTY2YTBjYTQ4ZmQzMTlhMDQwZTJmOTMiLCJpYXQiOjE1NzU5NTc2NjEsIm5iZiI6MTU3NTk1NzY2MSwiZXhwIjoxNjA3NTgwMDYxLCJzdWIiOiI0Iiwic2NvcGVzIjpbXX0.guzNhOwClNZBjWqGJc9nhOerwFpXk3hWqnZODgdEgGSKVjMLXYhOXgy7AW3QSGUZivUB3KPIvdiCA9_0zgQ8layvcT7iofFdQyzuKJl4wIgWIUTRZ5yW77hpGsmEePcFXmam06U7JgPCuET1woS-OVmTCurKMuPp_FKisBYZxgNAHyIc-jTiOoOza0ebIp_z-aqAro2_-JpRhY8AXYWdJ86dPc2hrlicYbPI2aJbD_MKE0zBWGTr_9rd0KedkX0KKaR_L1wvwRUTSZmWZNPwndZaaBxPpcApKEQi4dWTUB-fHZRiFw4Xfmc_ounG8sRqp4Bsz3m_2iunTBdVzjDvAWpHV0P7yozSd_0fShhZLt09e-vehZbIxGLOvTujYLdxRAPDv7iYFsoCU3xWsITxWbidPtSxqVShmxHkQFF15RBfCm7g5hvpfvQQMZ4g1tS3ZWv3kQLkl3DhJ-qQ4XpWYX2kRWjYFRkxoHr7U937ifrajR9lTr2wyHjFqC2RmqTfb4PNFRL_xjJlnabytXObtvxhkt55INiqdS27Dx9yq1989EiuefLN9NpTmF8bzHx0ga303HfI5em9ghBV86HCX-AxUxLxlYfXNlcTxlCnRJpE_vOCZVFfTU4-6ruBUWzDv0uL-eRJxsocwYSmjZwR5tl3cuN6PY7RwoLo1bCDkHk",});
    
      final parsed = jsonDecode(response.body);

      if (response.statusCode == 200) {
        final data = parsed["data"] as List;
        print("response 200: ${response.body}");
      
        return true;
      }else if (response.statusCode == 500){
        //lanza excepcion
        throw PlatformException(code: "500", message: parsed["message"]);
      }

      throw PlatformException(code: "201", message: "Error saveFavoriteByUser");

    } on PlatformException catch(e){
      print("Error ${e.code}:${e.message}");
      Dialogs.alert(context, title: "ERROR", message: e.message, onOk: (){
        
      });
      return false;
    }
  }
}