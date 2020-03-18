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
                onRefresh: null,
                child: ListView(
                  children: <Widget>[
                    Container(
                      height: 200,
                      child: Center(
                        child: ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: bookProvider.recent.length,
                          itemBuilder: (BuildContext context, int index) {
                            Book book = bookProvider.recent[index];
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Hero(
                                tag: null,
                                child: Material(
                                  type: MaterialType.transparency,
                                  child: Text(
                                    book.name,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800,
                                      color: Theme.of(context).accentColor,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
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
