import 'package:book_store/core/models/book_model.dart';
import 'package:book_store/core/provider/book_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Book> products;
  @override
  Widget build(BuildContext context) {
    return Consumer<BookProvider>(builder:
        (BuildContext context, BookProvider bookProvider, Widget child) {
      return Scaffold(
        body: bookProvider.loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : RefreshIndicator(
                onRefresh: () => bookProvider.getBook(),
                child: ListView(
                  children: <Widget>[
                    Container(
                      height: 200,
                      child: Center(
                        child: ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {},
                        ),
                      ),
                    ),
                  ],
                )),
        floatingActionButton: FloatingActionButton(onPressed: () {
          bookProvider.setLoading(false);
        }),
      );
    });
  }
}
