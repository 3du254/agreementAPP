class APIResponce<T> {
  T data;
  bool error;
  String errorMSG;
  final errorOBJ;

  APIResponce({this.data, this.errorMSG, this.error = false,this.errorOBJ});
}
 