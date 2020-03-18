import 'package:book_store/ui/screens/home_screen.dart';
import 'package:book_store/ui/screens/test_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Store'),
      ),
      body: HomeScreen(),
      floatingActionButton: FloatingActionButton(onPressed: () {
        print('object');
      }),
      drawer: Drawer(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.grey[500],
        elevation: 20,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Feather.home), title: SizedBox()),
          BottomNavigationBarItem(
              icon: Icon(Feather.server), title: SizedBox()),
          BottomNavigationBarItem(icon: Icon(Feather.book), title: SizedBox()),
          BottomNavigationBarItem(icon: Icon(Feather.user), title: SizedBox()),
        ],
      ),
    );
  }
}
