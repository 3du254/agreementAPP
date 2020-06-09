import 'package:cars45_app/model/buyer_model.dart';
import 'package:cars45_app/screens/home/agreement/agreement.dart';
import 'package:cars45_app/services/main_services.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WitnessDetail extends StatefulWidget {
  @override
  _WitnessDetailState createState() => _WitnessDetailState();
}

class _WitnessDetailState extends State<WitnessDetail> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  MainService get service => GetIt.I<MainService>();
  TextEditingController _witnessOneName = TextEditingController();
  TextEditingController _witnessOneIDNUmber = TextEditingController();
  TextEditingController _witnessOnePhoneNumber = TextEditingController();
  TextEditingController _witnessOneEmail = TextEditingController();
  TextEditingController _witnessTwoName = TextEditingController();
  TextEditingController _witnessTwoIDNUmber = TextEditingController();
  TextEditingController _witnessTwoPhoneNumber = TextEditingController();
  TextEditingController _witnessTwoEmail = TextEditingController();
  bool _isLoading = false;

  bool _sendEmail = false;
  @override
  Widget build(BuildContext context) {
    final _buyerModel = Provider.of<BuyerModel>(context);

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Witness Details'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding:
            EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                          'Witness one',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextField(
                        enableSuggestions: true,
                        controller: _witnessOneName,
                        decoration: inputDecoration('Name'),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextField(
                        enableSuggestions: true,
                        controller: _witnessOneIDNUmber,
                        decoration: inputDecoration('ID NUmber'),
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextField(
                          enableSuggestions: true,
                          controller: _witnessOnePhoneNumber,
                          decoration: inputDecoration('Phone Number'),
                          keyboardType: TextInputType.phone),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextField(
                          enableSuggestions: true,
                          controller: _witnessOneEmail,
                          decoration: inputDecoration('Email'),
                          keyboardType: TextInputType.emailAddress),
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
              Card(
                child: Container(
                  padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          'Witness two',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextField(
                        enableSuggestions: true,
                        controller: _witnessTwoName,
                        decoration: inputDecoration('Name'),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextField(
                          enableSuggestions: true,
                          controller: _witnessTwoIDNUmber,
                          decoration: inputDecoration('ID NUmber'),
                          keyboardType: TextInputType.number),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextField(
                          enableSuggestions: true,
                          controller: _witnessTwoPhoneNumber,
                          decoration: inputDecoration('Phone Number'),
                          keyboardType: TextInputType.phone),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextField(
                          enableSuggestions: true,
                          controller: _witnessTwoEmail,
                          decoration: inputDecoration('Email'),
                          keyboardType: TextInputType.emailAddress),
                      SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 10.0,
                ),
                height: 60.0,
                alignment: Alignment.centerRight,
                color: Colors.transparent,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Send email',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                          Checkbox(
                              value: _sendEmail,
                              activeColor: Colors.cyan,
                              checkColor: Colors.white,
                              onChanged: (value) {
                                print(value);
                                setState(() {
                                  _sendEmail = value;
                                });
                              }),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: _isLoading
                          ? Center(
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.cyan,
                              ),
                            )
                          : GestureDetector(
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
                                height: 40.0,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Center(
                                      child: Icon(
                                        Icons.save,
                                        color: Colors.cyan,
                                        size: 17.0,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    Center(
                                      child: Text(
                                        'Save',
                                        style: TextStyle(
                                            color: Colors.cyan,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              onTap: () async {
                                setState(() {
                                  _isLoading = true;
                                });
                                final SharedPreferences prefs = await _prefs;
                                final String token = prefs.getString('token');
                                List items = [
                                  {
                                    "make": _buyerModel.items[0]["make"],
                                    "model": _buyerModel.items[0]["model"],
                                    "colour": _buyerModel.items[0]["colour"],
                                    "year": _buyerModel.items[0]["year"],
                                    "reg_number": _buyerModel.items[0]
                                        ["reg_number"],
                                    "engine_number": _buyerModel.items[0]
                                        ["engine_number"],
                                    "chassis_number": _buyerModel.items[0]
                                        ["chassis_number"],
                                    "odometer_reading": _buyerModel.items[0]
                                        ["odometer_reading"],
                                    "regitered_car_owner": _buyerModel.items[0]
                                        ["regitered_car_owner"],
                                    "price": _buyerModel.items[0]["price"],
                                    "agreement": {
                                      "witness_one_name": _witnessOneName.text,
                                      "witness_one_id_number":
                                          _witnessOneIDNUmber.text,
                                      "witness_one_phone_number":
                                          _witnessOnePhoneNumber.text,
                                      "witness_one_email":
                                          _witnessOneEmail.text,
                                      "witness_two_name": _witnessTwoName.text,
                                      "witness_two_id_number":
                                          _witnessTwoIDNUmber.text,
                                      "witness_two_phone_number":
                                          _witnessTwoPhoneNumber.text,
                                      "witness_two_email": _witnessTwoEmail.text
                                    }
                                  }
                                ];
                                _buyerModel.setBuyerDetails(
                                    _buyerModel.firstName,
                                    _buyerModel.idNumber,
                                    _buyerModel.occupation,
                                    _buyerModel.phoneNumber,
                                    _buyerModel.email,
                                    _buyerModel.kraPIN,
                                    _buyerModel.profile,
                                    _buyerModel.kinName,
                                    _buyerModel.kinPhoneNumber,
                                    items);
                                Map res = await service.postAgreements2(
                                    token, _buyerModel, context, _sendEmail);
                                //print('AGREE' + res['agreement']);
                                if (res != null && res['agreement']) {
                                  Fluttertoast.showToast(
                                      msg: "Agreement Created Successfully",
                                      toastLength: Toast.LENGTH_SHORT,
                                      backgroundColor: Colors.green,
                                      textColor: Colors.white);

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Agreement()));
                                  //ModalRoute.withName('/agreement'));
                                }
                                setState(() {
                                  _isLoading = false;
                                });
                              },
                            ),
                    ),
                  ],
                ),
              )
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
