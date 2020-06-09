import 'package:cars45_app/model/buyer_model.dart';
import 'package:flutter/foundation.dart';

class BuyerListModel with ChangeNotifier {
  int count;
  String next;
  String previous;
  List<BuyerModel> results = [];

  BuyerListModel({this.count, this.next, this.previous, this.results});

  void setAgreements(
      int count, String next, String previous, List<BuyerModel> results) {
    this.count = count;
    this.next = next;
    this.previous = previous;
    this.results = results;
    notifyListeners();
  }
}
