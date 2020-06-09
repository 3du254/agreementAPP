import 'package:cars45_app/model/api_responce.dart';
import 'package:cars45_app/model/buyer_list_model.dart';
import 'package:cars45_app/model/login_model.dart';
import 'package:cars45_app/services/main_services.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'authentication/auth.dart';
import 'home/home.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  MainService get service => GetIt.I<MainService>();
  APIResponce<List<BuyerListModel>> _apiresponse;
  List<BuyerListModel> data;
  bool _isLoading = false;

  @override
  void initState() {
    _fetchLoginToken();
    //print(_apiresponse);
    super.initState();
  }

  _fetchLoginToken() async {
    setState(() {
      _isLoading = true;
    });

    //_apiresponse= await service.getAgreements();
    //data=_apiresponse.data;
    setState(() {
      _isLoading = true;
    });
    //print(data);
  }

  @override
  Widget build(BuildContext context) {
    final logins = Provider.of<LoginModel>(context);
    //print(logins.token);
    if (logins.token == null) {
      return Container(
        child: Authentication(),
      );
    } else {
      return Container(
        child: HomeScreen(),
      );
    }
  }
}
