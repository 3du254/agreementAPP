import 'dart:convert';
import 'dart:io';
import 'package:cars45_app/model/api_responce.dart';
import 'package:cars45_app/model/buyer_list_model.dart';
import 'package:cars45_app/model/buyer_model.dart';
import 'package:cars45_app/model/login_model.dart';
import 'package:cars45_app/screens/home/agreement/agreement.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

class MainService {
  static const aPI = 'http://192.168.43.39:8000';
  Future<APIResponce<LoginModel>> getLoginToken(
      String username, String password) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return await http.post(aPI + '/api/account/login',
        body: {"username": username, "password": password}).then((res) {
      if (res.statusCode == 200) {
        final jsonData = json.decode(res.body);
        final logins = LoginModel(username: 'admin', token: jsonData['token']);

        _prefs.setString('token', jsonData['token']);
        return APIResponce<LoginModel>(data: logins);
      }

      return APIResponce<LoginModel>(error: true, errorMSG: 'ERROR');
    }).catchError(
        (onError) => APIResponce<LoginModel>(error: true, errorMSG: onError));
  }

  Future<APIResponce<List<BuyerListModel>>> getAgreements(String token) {
    return http.get(aPI + '/api/agreement/list',
        headers: {'Authorization': 'token ' + token}).then((res) {
      if (res.statusCode == 200) {
        final jsonData = json.decode(res.body);
        final results = <BuyerModel>[];
        if (jsonData['results'].length >= 1) {
          for (var item in jsonData['results']) {
            results.add(BuyerModel.fromjson(item));
          }
        }
        final data = <BuyerListModel>[
          new BuyerListModel(
              count: jsonData['count'],
              next: jsonData['next'],
              previous: jsonData['previous'],
              results: results)
        ];
        return APIResponce<List<BuyerListModel>>(data: data);
      }
      return APIResponce<List<BuyerListModel>>(error: true, errorMSG: 'ERROR');
    }).catchError((onError) =>
        APIResponce<List<BuyerListModel>>(error: true, errorMSG: 'Error'));
  }

  Future<bool> postAgreements(String token, BuyerModel data) async {
    print(data.items[0]["agreement"]['witness_one_id_number']);
    var request =
        http.MultipartRequest("POST", Uri.parse(aPI + '/api/agreement/create'));
    request.headers['authorization'] = 'token ' + token;
    request.fields['first_name'] = data.firstName;
    request.fields['id_number'] = data.idNumber.toString();
    request.fields['occupation'] = data.occupation;
    request.fields['phone_number'] = data.phoneNumber.toString();
    request.fields['email'] = data.email;
    request.fields['kra_pin'] = data.kraPIN;
    request.fields['kin_name'] = data.kinName;
    request.fields['kin_phone_number'] = data.kinPhoneNumber.toString();
    request.fields['items[0]make'] = data.items[0]["make"];
    request.fields['items[0]model'] = data.items[0]["model"];
    request.fields['items[0]colour'] = data.items[0]["colour"];
    request.fields['items[0]year'] = data.items[0]["year"];
    request.fields['items[0]reg_number'] = data.items[0]["reg_number"];
    request.fields['items[0]engine_number'] = data.items[0]["engine_number"];
    request.fields['items[0]chassis_number'] = data.items[0]["chassis_number"];
    request.fields['items[0]odometer_reading'] =
        data.items[0]["odometer_reading"];
    request.fields['items[0]regitered_car_owner'] =
        data.items[0]["regitered_car_owner"];
    request.fields['items[0]price'] = data.items[0]["price"];
    request.fields['items[0]agreement.witness_one_name'] =
        data.items[0]["agreement"]['witness_one_name'];
    request.fields['items[0]agreement.witness_one_id_number'] =
        data.items[0]["agreement"]['witness_one_id_number'];
    request.fields['items[0]agreement.witness_one_phone_number'] =
        data.items[0]["agreement"]['witness_one_name'];
    request.fields['items[0]agreement.witness_one_email'] =
        data.items[0]["agreement"]['witness_one_email'];
    request.fields['items[0]agreement.witness_two_name'] =
        data.items[0]["agreement"]['witness_two_name'];
    request.fields['items[0]agreement.witness_two_id_number'] =
        data.items[0]["agreement"]['witness_two_id_number'];
    request.fields['items[0]agreement.witness_two_phone_number'] =
        data.items[0]["agreement"]['witness_two_phone_number'];
    request.fields['items[0]agreement.witness_two_email'] =
        data.items[0]["agreement"]['witness_two_email'];

    var res = await request.send();
    print(res);
    return true;
  }

  Future<Map<String, dynamic>> postAgreements2(String token, BuyerModel data,
      BuildContext context, bool sendEmail) async {
    Response response;
    var dio = Dio();
    FormData formData = new FormData.fromMap({
      "first_name": data.firstName,
      "id_number": data.idNumber,
      "occupation": data.occupation,
      "phone_number": data.phoneNumber,
      "email": data.email,
      "profile": await MultipartFile.fromFile(
        data.profile.path,
      ),
      "kra_pin": data.kraPIN,
      "kin_name": data.kinName,
      "kin_phone_number": data.kinPhoneNumber,
      "items[0]make": data.items[0]["make"],
      "items[0]model": data.items[0]["model"],
      "items[0]colour": data.items[0]["colour"],
      "items[0]year": data.items[0]["year"],
      "items[0]reg_number": data.items[0]["reg_number"],
      "items[0]engine_number": data.items[0]["engine_number"],
      "items[0]chassis_number": data.items[0]["chassis_number"],
      "items[0]odometer_reading": data.items[0]["odometer_reading"],
      "items[0]regitered_car_owner": data.items[0]["regitered_car_owner"],
      "items[0]price": data.items[0]["price"],
      "items[0]agreement.witness_one_name": data.items[0]["agreement"]
          ['witness_one_name'],
      "items[0]agreement.witness_one_id_number": data.items[0]["agreement"]
          ['witness_one_id_number'],
      "items[0]agreement.witness_one_phone_number": data.items[0]["agreement"]
          ['witness_one_phone_number'],
      "items[0]agreement.witness_one_email": data.items[0]["agreement"]
          ['witness_one_email'],
      "items[0]agreement.witness_two_name": data.items[0]["agreement"]
          ['witness_two_name'],
      "items[0]agreement.witness_two_id_number": data.items[0]["agreement"]
          ['witness_two_id_number'],
      "items[0]agreement.witness_two_phone_number": data.items[0]["agreement"]
          ['witness_two_phone_number'],
      "items[0]agreement.witness_two_email": data.items[0]["agreement"]
          ['witness_two_email'],
    });

    try {
      response = await dio.post(aPI + "/api/agreement/create",
          data: formData,
          options: Options(
              contentType: 'multipart/form-data',
              headers: {'Authorization': 'token ' + token}));
      Map<String, dynamic> res;
      if (response.statusCode == 201) {
        Response resEmail;
        print(sendEmail);
        if (sendEmail) {
          await http.get(
              aPI + '/api/agreement/pdf/' + response.data['id'].toString(),
              headers: {'Authorization': 'token ' + token}).then((res) {
            Map jsonData;
            if (res.statusCode == 200) {
              jsonData = json.decode(res.body);
            }
            return jsonData;
          }).catchError((onError) => {print(onError)});
          // var dio2 = Dio();
          // try {
          //   resEmail = await dio2.get(
          //       aPI + '/api/agreement/pdf/' + response.data['id'].toString(),
          //       options: Options(headers: {'Authorization': 'token ' + token}));
          //   print(resEmail);
          // } catch (e) {
          //   print("Error Upload: " + e.toString());
          // }
        }
        res = {"agreement": true, "sendEmail": resEmail};
      }
      return res;
    } catch (e) {
      print("Error Upload: " + e.toString());
      return null;
    }
  }
}
