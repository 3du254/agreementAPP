import 'package:cars45_app/model/buyer_model.dart';
import 'package:cars45_app/screens/home/agreement/witness_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemDetails extends StatefulWidget {
  @override
  _ItemDetailsState createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  TextEditingController _make = TextEditingController();
  TextEditingController _model = TextEditingController();
  TextEditingController _color = TextEditingController();
  TextEditingController _year = TextEditingController();
  TextEditingController _regNo = TextEditingController();
  TextEditingController _engineNumber = TextEditingController();
  TextEditingController _chasisNumber = TextEditingController();
  TextEditingController _odimeterReading = TextEditingController();
  TextEditingController _registeredCarOwner = TextEditingController();
  TextEditingController _price = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final _buyerModel = Provider.of<BuyerModel>(context);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Item Details'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding:
            EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 20.0),
        child: SingleChildScrollView(
          child: Card(
            child: Container(
              padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    enableSuggestions: true,
                    controller: _make,
                    decoration: inputDecoration('Make'),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    enableSuggestions: true,
                    controller: _model,
                    decoration: inputDecoration('Model'),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    enableSuggestions: true,
                    controller: _color,
                    decoration: inputDecoration('Color'),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                      enableSuggestions: true,
                      controller: _year,
                      decoration: inputDecoration('Year'),
                      keyboardType: TextInputType.number),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    enableSuggestions: true,
                    controller: _regNo,
                    decoration: inputDecoration('Registration Number'),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    enableSuggestions: true,
                    controller: _engineNumber,
                    decoration: inputDecoration('Engine Number'),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    enableSuggestions: true,
                    controller: _chasisNumber,
                    decoration: inputDecoration('Chasis Number'),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                      enableSuggestions: true,
                      controller: _odimeterReading,
                      decoration: inputDecoration('Odimeter Reading'),
                      keyboardType: TextInputType.number),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    enableSuggestions: true,
                    controller: _registeredCarOwner,
                    decoration: inputDecoration('Registered Car Owner'),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                      enableSuggestions: true,
                      controller: _price,
                      decoration: inputDecoration('Price(KSH)'),
                      keyboardType: TextInputType.number),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
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
                        padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
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
                        List items = [
                          {
                            "make": _make.text,
                            "model": _model.text,
                            "colour": _color.text,
                            "year": _year.text,
                            "reg_number": _regNo.text,
                            "engine_number": _engineNumber.text,
                            "chassis_number": _chasisNumber.text,
                            "odometer_reading": _odimeterReading.text,
                            "regitered_car_owner": _registeredCarOwner.text,
                            "price": _price.text
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

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WitnessDetail()),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
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
