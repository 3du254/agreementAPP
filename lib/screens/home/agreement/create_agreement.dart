import 'dart:io';
import 'package:cars45_app/model/buyer_model.dart';
import 'package:cars45_app/screens/home/agreement/item_details.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class CreateAgreement extends StatefulWidget {
  @override
  _CreateAgreementState createState() => _CreateAgreementState();
}

class _CreateAgreementState extends State<CreateAgreement> {
  File _image;
  TextEditingController _name = TextEditingController();
  TextEditingController _idNumber = TextEditingController();
  TextEditingController _occupation = TextEditingController();
  TextEditingController _phoneNumber = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _kraPin = TextEditingController();
  TextEditingController _kinName = TextEditingController();
  TextEditingController _kinPhoneNumber = TextEditingController();

  Future _getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _buyerModel = Provider.of<BuyerModel>(context);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Buyer Infomation'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding:
            EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Card(
                child: Container(
                  padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          'Buyer details',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.grey),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextField(
                        enableSuggestions: true,
                        controller: _name,
                        decoration: inputDecoration('Name'),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextField(
                        enableSuggestions: true,
                        controller: _idNumber,
                        decoration: inputDecoration('ID Number'),
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextField(
                        enableSuggestions: true,
                        controller: _occupation,
                        decoration: inputDecoration('Occupation'),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextField(
                          enableSuggestions: true,
                          controller: _phoneNumber,
                          decoration: inputDecoration('Phone Number'),
                          keyboardType: TextInputType.phone),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextField(
                          enableSuggestions: true,
                          controller: _email,
                          decoration: inputDecoration('Email'),
                          keyboardType: TextInputType.emailAddress),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextField(
                        enableSuggestions: true,
                        controller: _kraPin,
                        decoration: inputDecoration('KRA pin'),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Card(
                child: Container(
                  padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          'Next of kin',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.grey),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextField(
                        enableSuggestions: true,
                        controller: _kinName,
                        decoration: inputDecoration('Next of Kin Name'),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextField(
                          enableSuggestions: true,
                          controller: _kinPhoneNumber,
                          decoration:
                              inputDecoration('Next of Kin Phone Number'),
                          keyboardType: TextInputType.phone),
                      SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _image == null
                      ? Text('Take picture')
                      : Expanded(
                          flex: 1,
                          child: Image.file(
                            _image,
                            width: 100,
                            height: 100,
                          ),
                        ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      child: Icon(
                        Icons.add_a_photo,
                        color: Colors.cyan,
                        size: 40,
                      ),
                      onTap: () {
                        _getImage();
                      },
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Container(
                        height: 40.0,
                        alignment: Alignment.centerRight,
                        color: Colors.transparent,
                        child: GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.cyan,
                                    style: BorderStyle.solid,
                                    width: 2.0),
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(14)),
                            padding:
                                EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                            width: 100.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Center(
                                  child: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.cyan,
                                    size: 20.0,
                                  ),
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Center(
                                  child: Text(
                                    'Next',
                                    style: TextStyle(
                                        color: Colors.cyan,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                          onTap: () {
                            _buyerModel.setBuyerDetails(
                                _name.text,
                                int.parse(_idNumber.text),
                                _occupation.text,
                                int.parse(_phoneNumber.text),
                                _email.text,
                                _kraPin.text,
                                _image,
                                _kinName.text,
                                int.parse(_kinPhoneNumber.text),
                                null);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ItemDetails()),
                            );
                          },
                        ),
                      ))
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

InputDecoration inputDecoration(String lable) {
  return InputDecoration(
      labelText: lable,
      labelStyle: TextStyle(
          fontFamily: 'Montseraat',
          fontWeight: FontWeight.bold,
          color: Colors.grey,
          fontSize: 12.0),
      focusedBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.cyan)),
      border:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.grey[100])),
      focusColor: Colors.cyan,
      contentPadding: EdgeInsets.all(5.0));
}
