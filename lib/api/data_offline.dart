import 'package:json_object_lite/json_object_lite.dart';


class DataOffline extends JsonObjectLite<dynamic> {
  DataOffline(); // default constructor (empty) implementation

  factory DataOffline.fromJsonString(String json) {
    // from JSON constructor implementation
    final DataOffline dataOffline =
        DataOffline(); // create an empty instance of this class
    // Create an instance of JsonObjectLite, populated with the json string and
    // injecting the _LanguageWebsite instance.
    final JsonObjectLite<dynamic> jsonObject =
        JsonObjectLite<dynamic>.fromJsonString(json, dataOffline);
    return jsonObject; // return the populated JsonObject instance
  }

  factory DataOffline.fromJsonObject(JsonObjectLite<dynamic> jsonObject) =>
      JsonObjectLite.toTypedJsonObjectLite(jsonObject, DataOffline());
}

class DataOffL extends JsonObjectLite<dynamic> {
  DataOffL(); // empty, default constructor

  factory DataOffL.fromJsonString(String json) =>
      JsonObjectLite<dynamic>.fromJsonString(json, DataOffL());
  // as _LangaugeWebsite, return an instance
  // of JsonObjectLite, containing the json string and
  // injecting a _Language instance
}

class DataCanjeton {
  var testJson = """
      [{"Dis":1111.1,"Flag":0,"Obj":{"ID":1,"Title":"Volvo 140"}},
      {"Dis":2222.2,"Flag":0,"Obj":{"ID":2,"Title":"Volvo 240"}}]""";

  var dataListCoupon = """
  [
    {
      "coupon_id": 0,
      "coupon_title": "Cerveza perla del pacifico cupon 1",
      "coupon_description": "Nueva presentación negra",
      "coupon_value_discount": "10",
      "coupon_given_coupon": "1",
      "coupon_status": "1",
      "time": {
        "format_date": "YYYY-MM-DD",
        "date_start": "2019-11-01",
        "hour_start": "21:22:29",
        "date_end": "2019-12-30",
        "hour_end": "21:22:29"
      },
      "type_discount": {
        "type_discount_id": 1,
        "type_discount_name": "descuento del 10%",
        "type_discount_symbol": "20",
        "type_discount_symbol_position": "left",
        "type_discount_text_discount": "Descuento de una cerveza perla del pacifico"
      },
      "category": {
        "category_id": 1,
        "category_name": "Restaurantes",
        "category_resource_identifier": "utensils-alt"
      },
      "business_branch": {
        "business_branch_id": 1,
        "business_branch_trade_name": "Perla del pacifico",
        "business_branch_business_name": null,
        "business_branch_address": "Sambo 334"
      }
    },
    {
      "coupon_id": 1,
      "coupon_title": "Cerveza perla del pacifico cupon 1",
      "coupon_description": "Nueva presentación negra",
      "coupon_value_discount": "10",
      "coupon_given_coupon": "1",
      "coupon_status": "1",
      "time": {
        "format_date": "YYYY-MM-DD",
        "date_start": "2019-11-01",
        "hour_start": "21:22:29",
        "date_end": "2019-12-30",
        "hour_end": "21:22:29"
      },
      "type_discount": {
        "type_discount_id": 1,
        "type_discount_name": "descuento del 10%",
        "type_discount_symbol": "20",
        "type_discount_symbol_position": "left",
        "type_discount_text_discount": "Descuento de una cerveza perla del pacifico"
      },
      "category": {
        "category_id": 1,
        "category_name": "Restaurantes",
        "category_resource_identifier": "utensils-alt"
      },
      "business_branch": {
        "business_branch_id": 1,
        "business_branch_trade_name": "Perla del pacifico",
        "business_branch_business_name": null,
        "business_branch_address": "Sambo 334"
      }
    }
  ]""";
}