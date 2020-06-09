// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buyer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BuyerModel _$AgreementModelFromJson(Map<String, dynamic> json) {
  return BuyerModel(
    id: json['id'] as int,
    firstName: json['first_name'] as String,
    idNumber: json['id_number'] as int,
    occupation: json['occupation'] as String,
    phoneNumber: json['phone_number'] as int,
    email: json['email'] as String,
    kraPIN: json['kra_pin'] as String,
    profileUrl: json['profile'],
    kinName: json['kin_name'] as String,
    kinPhoneNumber: json['kin_phone_number'] as int,
    createdUser: json['created_user'] as String,
    createdDate: DateTime.parse(json['created_date']),
    items: json['items'] as List,
  );
}

Map<String, dynamic> _$AgreementModelToJson(BuyerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'idNumber': instance.idNumber,
      'occupation': instance.occupation,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'kraPIN': instance.kraPIN,
      'profile': instance.profileUrl,
      'kinName': instance.kinName,
      'kinPhoneNumber': instance.kinPhoneNumber,
      'createdUser': instance.createdUser,
      'createdDate': instance.createdDate,
      'item': instance.items
    };
