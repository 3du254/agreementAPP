import 'package:cars45_app/model/api_responce.dart';
import 'package:cars45_app/model/login_model.dart';
import 'package:cars45_app/services/main_services.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  APIResponce<LoginModel> _apiresponse;
  MainService get service => GetIt.I<MainService>();
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool _isLoading = false;
  bool _isError = false;

  @override
  Widget build(BuildContext context) {
    final _loginModel = Provider.of<LoginModel>(context);
    _login(String username, String password) async {
      setState(() {
        _isLoading = true;
      });
      _apiresponse = await service.getLoginToken(username, password);
      if (_apiresponse.error) {
        print(_apiresponse.error);
        setState(() {
          _isError = true;
        });
      } else {
        String token = _apiresponse.data.token;
        _loginModel.setLogins(username, token);
      }
      setState(() {
        _isLoading = false;
      });
    }

    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                padding: EdgeInsets.fromLTRB(15.0, 120.0, 0.0, 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Cars45 Kenya',
                      style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.cyan,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
            Container(
              padding: EdgeInsets.only(top: 110.0, left: 15.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _username,
                    decoration: InputDecoration(
                        labelText: 'USERNAME',
                        labelStyle: TextStyle(
                            fontFamily: 'Montseraat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue))),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    controller: _password,
                    decoration: InputDecoration(
                        labelText: 'PASSWORD',
                        labelStyle: TextStyle(
                            fontFamily: 'Montseraat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue))),
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    alignment: Alignment(1, 0),
                    padding: EdgeInsets.only(top: 15.0, left: 15.0),
                    child: InkWell(
                      child: Text(
                        'forgot password',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  GestureDetector(
                    onTap: () async {
                      _login(
                          _username.text.toString(), _password.text.toString());
                    },
                    child: Container(
                      height: 50.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(14),
                        shadowColor: Colors.blueAccent,
                        color: Colors.cyan,
                        elevation: 5.2,
                        child: GestureDetector(
                          onTap: () {
                            //print('workin');
                            //_apiresponse = await service.getLoginToken(
                            //_username.text, _password.text);
                            //print(_apiresponse);
                          },
                          child: Center(
                            child: _isLoading
                                ? CircularProgressIndicator(
                                    backgroundColor: Colors.white,
                                  )
                                : Text(
                                    'Login',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    child: _isError
                        ? Text(
                            'Login Failed',
                            style: TextStyle(color: Colors.red),
                          )
                        : Text(''),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
/* Container(
                    height: 50.0,
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.blue,
                              style: BorderStyle.solid,
                              width: 1.0),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(14)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: Icon(Icons.arrow_forward),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Center(
                            child: Text(
                              'Click here',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  ) */
