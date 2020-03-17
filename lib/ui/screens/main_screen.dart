import 'package:book_store/core/provider/app_provider.dart';
import 'package:book_store/util/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Store'),
      ),
      body: Container(
        child: Center(
          child: SwitchListTile(
            secondary: Icon(Feather.moon),
            title: Text("Dark Mode"),
            value:
                Provider.of<AppProvider>(context).theme == Constants.lightTheme
                    ? false
                    : true,
            onChanged: (v) {
              if (v) {
                Provider.of<AppProvider>(context, listen: false)
                    .setTheme(Constants.darkTheme, "dark");
              } else {
                Provider.of<AppProvider>(context, listen: false)
                    .setTheme(Constants.lightTheme, "light");
              }
            },
          ),
        ),
      ),
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
