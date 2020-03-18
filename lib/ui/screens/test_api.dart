import 'dart:convert';

import 'package:book_store/core/models/book_model.dart';
import 'package:book_store/util/constant_url.dart';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:http/http.dart' as http;

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  List<Book> list = new List<Book>();
  var isLoading = false;
  _fetchData() async {
    setState(() {
      isLoading = true;
    });
    final response = await http.get(ApiUrl.urlBooks);
    if (response.statusCode == 200) {
      List<dynamic> values = new List<dynamic>();
      values = json.decode(response.body);
      if (values.length > 0) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            Map<String, dynamic> map = values[i];
            list.add(Book.fromJson(map));
            debugPrint('Id-------${map['id']}');
          }
        }
      }
    } else {
      throw Exception('Failed to load photos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: Column(
        children: <Widget>[
          isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      contentPadding: EdgeInsets.all(10.0),
                      title: new Text(list[index].name),
                      trailing: new Image.network(
                        list[index].thumbnail,
                        fit: BoxFit.cover,
                        height: 40.0,
                        width: 40.0,
                      ),
                    );
                  }),
          IconButton(
              icon: Icon(Feather.database),
              onPressed: () {
                _fetchData();
              })
        ],
      ),
    );
  }
}
