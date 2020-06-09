import 'dart:ui';

import 'package:cars45_app/model/api_responce.dart';
import 'package:cars45_app/model/buyer_list_model.dart';
import 'package:cars45_app/model/buyer_model.dart';
import 'package:cars45_app/screens/home/agreement/create_agreement.dart';
import 'package:cars45_app/services/main_services.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transparent_image/transparent_image.dart';

class Agreement extends StatefulWidget {
  @override
  _AgreementState createState() => _AgreementState();
}

class _AgreementState extends State<Agreement> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  APIResponce<List<BuyerListModel>> _apiresponse;
  MainService get service => GetIt.I<MainService>();
  List<BuyerModel> _agreements = [];
  bool _isLoading = false;
  String errorMessage;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getAgreements();
  }

  _getAgreements() async {
    final SharedPreferences prefs = await _prefs;
    final String token = prefs.getString('token');
    setState(() {
      _isLoading = true;
    });

    _apiresponse = await service.getAgreements(token);

    if (_apiresponse.error) {
      errorMessage = _apiresponse.errorMSG;
    } else {
      setState(() {
        _agreements = _apiresponse.data[0].results;
      });
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 20.0,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateAgreement()),
          );
        },
        child: Icon(
          Icons.add,
          size: 30.0,
        ),
        backgroundColor: Colors.cyan,
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Agreements'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              child: Text('search'),
            ),
          ),
          Expanded(
            flex: 15,
            child: _isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.red,
                    ),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.all(8),
                    itemCount: _agreements.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child: Card(
                          child: ListTile(
                            leading: FadeInImage.memoryNetwork(
                              placeholder: kTransparentImage,
                              image: _agreements[index].profileUrl,
                            ),
                            //Image.network(_agreements[index].profileUrl),
                            // leading:  Icon(
                            //   Icons.assignment,
                            //   size: 47,
                            //   color: Colors.cyan,
                            // ),
                            title: Row(
                              children: <Widget>[
                                Text(
                                  'Name: ',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(_agreements[index].firstName),
                              ],
                            ),
                            subtitle: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(
                                      'Item: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                        '${_agreements[index].items[0]['make']} ${_agreements[index].items[0]['model']} - ${_agreements[index].items[0]['reg_number']}'),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      'Date: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                        '${DateFormat.yMMMMEEEEd().format(_agreements[index].createdDate)}'),
                                  ],
                                ),
                              ],
                            ),
                            isThreeLine: true,
                            trailing: Icon(Icons.arrow_drop_down),
                          ),
                        ), //Center(child: Text('${_agreements[index].email}')),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                  ),
          ),
        ],
      ),
    );
  }
}
