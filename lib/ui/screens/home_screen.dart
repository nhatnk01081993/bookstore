import 'package:book_store/core/models/book_model.dart';
import 'package:book_store/core/provider/book_provider.dart';
import 'package:book_store/ui/widgets/book_card.dart';
import 'package:book_store/util/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<BookProvider>(
      builder: (BuildContext context, BookProvider bookProvider, Widget child) {
        return Scaffold(
          body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: 100.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: Text("Collapsing Toolbar",
                          style: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontSize: 16.0,
                          )),
                      background: Image.network(
                        "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=120",
                        fit: BoxFit.cover,
                      )),
                )
              ];
            },
            body: bookProvider.loading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : RefreshIndicator(
                    onRefresh: () => bookProvider.loadBook,
                    child: ListView(
                      children: <Widget>[
                        Text(
                          bookProvider.recentBook.length.toString(),
                          style: TextStyle(color: Colors.lightBlue),
                        ),
                        Container(
                          height: Constants.topRecentHeight,
                          child: Center(
                            child: ListView.builder(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              scrollDirection: Axis.horizontal,
                              itemCount: bookProvider.recentBook.length,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                Book book = bookProvider.recentBook[index];
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: Constants.topRecentHorizontal,
                                      vertical: Constants.topRecentVertical),
                                  child: BookCard(
                                    img: book.url,
                                    book: book,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Categories",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Recently Added",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        );
      },
    );
  }
}
