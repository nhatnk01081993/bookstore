import 'dart:convert';

import 'package:book_store/core/models/album_model.dart';
import 'package:book_store/util/constant_url.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  List<Album> _list = new List<Album>();
  var isLoading = false;

  Future<List<Album>> get fetchPosts async {
    setState(() {
      isLoading = true;
    });
    http.Response response = await http.get(ApiUrl.urlTest);
    if (response.statusCode == 200) {
      List responseJson = json.decode(response.body);
      _list = responseJson.map((m) => new Album.fromJson(m)).toList();
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
            : ListView.builder(
                itemCount: _list.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    contentPadding: EdgeInsets.all(10.0),
                    title: new Text(
                      _list[index].title,
                      style: TextStyle(color: Colors.red),
                    ),
                  );
                }));
  }
}
