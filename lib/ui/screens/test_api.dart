import 'dart:convert';

import 'package:book_store/core/models/album_model.dart';
import 'package:book_store/core/models/book_model.dart';
import 'package:book_store/ui/widgets/book_card.dart';
import 'package:book_store/util/constant_url.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  List<Book> _list = new List<Book>();
  var isLoading = false;

  Future<List<Book>> get fetchPosts async {
    setState(() {
      isLoading = true;
    });
    http.Response response = await http.get(ApiUrl.urlBooks);
    if (response.statusCode == 200) {
      List responseJson = json.decode(response.body);
      _list = responseJson.map((m) => new Book.fromJson(m)).toList();
      setState(() {
        isLoading = false;
      });
      return _list;
    } else {
      Fluttertoast.showToast(
        msg: 'value',
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIos: 1,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Fetch Data JSON"),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RaisedButton(
            child: new Text("Fetch Data"),
            onPressed: () {
              fetchPosts;
            },
          ),
        ),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : RefreshIndicator(
                onRefresh: () async {
                  fetchPosts;
                },
                child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    scrollDirection: Axis.horizontal,
                    itemCount: _list.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      Book book = _list[index];
                      return Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                        child: BookCard(
                          img: book.url,
                          book: book,
                        ),
                      );
                    }),
              ));
  }
}
