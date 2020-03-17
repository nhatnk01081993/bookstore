import 'dart:async';

import 'package:book_store/core/models/book_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class BookProvider with ChangeNotifier {
  bool loading = true;
  List<Book> products;
  Stream<QuerySnapshot> fetchProductsAsStream() {
    return Firestore.instance.collection('book').snapshots();
  }

  getBook() {
    setLoading(true);
    Timer(Duration(seconds: 3), () {
      print("Yeah, this line is printed after 3 seconds");
    });
    Firestore.instance.collection('book').getDocuments();
    setLoading(false);
  }

  void setLoading(value) {
    loading = value;
    notifyListeners();
  }

  bool isLoading() {
    return loading;
  }
}
