import 'dart:convert';

import 'package:book_store/core/models/book_model.dart';
import 'package:book_store/util/constant_url.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class BookProvider extends ChangeNotifier {
  BookProvider() {
    loadBook;
  }

  String message;
  List<Book> recentBook = new List<Book>();
  bool loading = true;

  Future<List<Book>> get loadBook async {
    setLoading(true);
    notifyListeners();
    http.Response response = await http.get(ApiUrl.mockApiBooks);
    if (response.statusCode == 200) {
      List responseJson = json.decode(response.body);
      recentBook =
          responseJson.map((m) => new Book.fromJson(m)).take(10).toList();
      setRecent(recentBook);
      setLoading(false);
    } else {
      setLoading(true);
    }
    return recentBook;
  }

  void setLoading(value) {
    loading = value;
    notifyListeners();
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
    recentBook = value;
    notifyListeners();
  }
}
