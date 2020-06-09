import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'buyer_model.g.dart';

@JsonSerializable()
class BuyerModel with ChangeNotifier {
  int id;
  String firstName;
  int idNumber;
  String occupation;
  int phoneNumber;
  String email;
  String kraPIN;
  File profile;
  String profileUrl;
  String kinName;
  int kinPhoneNumber;
  String createdUser;
  DateTime createdDate;
  List items;

  BuyerModel(
      {this.id,
      this.firstName,
      this.idNumber,
      this.occupation,
      this.phoneNumber,
      this.email,
      this.kraPIN,
      this.profile,
      this.profileUrl,
      this.kinName,
      this.kinPhoneNumber,
      this.createdUser,
      this.items,
      this.createdDate});
  void setBuyerDetails(
      String firstName,
      int idNumber,
      String occupation,
      int phoneNumber,
      String email,
      String kraPIN,
      File profile,
      String kinName,
      int kinPhoneNumber,
      List items) {
    this.firstName = firstName;
    this.idNumber = idNumber;
    this.occupation = occupation;
    this.phoneNumber = phoneNumber;
    this.email = email;
    this.kraPIN = kraPIN;
    this.profile = profile;
    this.kinName = kinName;
    this.kinPhoneNumber = kinPhoneNumber;
    this.items = items;

    notifyListeners();
  }

  factory BuyerModel.fromjson(Map<String, dynamic> item) =>
      _$AgreementModelFromJson(item);
}
