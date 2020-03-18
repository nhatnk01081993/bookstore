import 'package:book_store/core/models/book_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BookProvider extends ChangeNotifier {
  String message;
  List<Book> recent = List();
  bool loading = true;

  void setLoading(value) {
    loading = value;
    notifyListeners();
  }

  bool isLoading() {
    return loading;
  }

  void setMessage(value) {
    message = value;
    Fluttertoast.showToast(
      msg: value,
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIos: 1,
    );
    notifyListeners();
  }

  String getMessage() {
    return message;
  }

  void setRecent(value) {
    recent.add(value);
    notifyListeners();
  }

  List<Book> getRecent() {
    return recent;
  }
}
