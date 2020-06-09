import 'package:cars45_app/model/api_responce.dart';
import 'package:cars45_app/model/buyer_list_model.dart';
import 'package:cars45_app/model/login_model.dart';
import 'package:cars45_app/screens/home/agreement/agreement.dart';
import 'package:cars45_app/services/main_services.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  APIResponce<List<BuyerListModel>> _apiresponse;

  MainService get service => GetIt.I<MainService>();

  @override
  Widget build(BuildContext context) {
    final _agreementModel = Provider.of<BuyerListModel>(context);
    final _loginModel = Provider.of<LoginModel>(context);

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        actions: <Widget>[
          GestureDetector(
            child: Container(
                padding: EdgeInsets.only(right: 20.0, left: 20.0),
                child: Center(
                    child: Text(
                  'Logout',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ))),
            onTap: () {
              _loginModel.setLogins(null, null);
            },
          )
        ],
        backgroundColor: Colors.grey[900],
        title: Text(
          'Cars45 Kenya',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        elevation: 0.1,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(10),
              color: Colors.cyan,
              child: Text(
                'Welcome ' + _loginModel.username,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
          Expanded(
            flex: 50,
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 10.0),
              crossAxisSpacing: 7,
              mainAxisSpacing: 10,
              crossAxisCount: 3,
              childAspectRatio: 0.75,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: Colors.grey[300],
                        width: 1.0,
                        style: BorderStyle.solid),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[200],
                          offset: Offset(0.0, 0.0), //(x,y)
                          blurRadius: 1.0,
                          spreadRadius: 1.0),
                    ],
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          child: Container(
                            padding: EdgeInsets.only(top: 25.0),
                            child: Icon(
                              Icons.rate_review,
                              color: Colors.cyan,
                              size: 50.0,
                              semanticLabel:
                                  'Text to announce in accessibility modes',
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Agreement()),
                            );
                          },
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text(
                            'Agreements',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[600]),
                          ),
                        ),
                      )
                    ],
                  ),
                  //color: Colors.white,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: Colors.grey[300],
                        width: 1.0,
                        style: BorderStyle.solid),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[200],
                          offset: Offset(0.0, 0.0), //(x,y)
                          blurRadius: 1.0,
                          spreadRadius: 1.0),
                    ],
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.only(top: 25.0),
                          child: Icon(
                            Icons.poll,
                            color: Colors.pink,
                            size: 50.0,
                            semanticLabel:
                                'Text to announce in accessibility modes',
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text(
                            'Sales',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[600]),
                          ),
                        ),
                      )
                    ],
                  ),
                  //color: Colors.white,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: Colors.grey[300],
                        width: 1.0,
                        style: BorderStyle.solid),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[200],
                          offset: Offset(0.0, 0.0), //(x,y)
                          blurRadius: 1.0,
                          spreadRadius: 1.0),
                    ],
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.only(top: 25.0),
                          child: Icon(
                            Icons.settings,
                            color: Colors.grey,
                            size: 50.0,
                            semanticLabel:
                                'Text to announce in accessibility modes',
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text(
                            'Settings',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[600]),
                          ),
                        ),
                      )
                    ],
                  ),
                  //color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
