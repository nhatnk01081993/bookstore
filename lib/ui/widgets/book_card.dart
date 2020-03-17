import 'package:book_store/core/models/book_model.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Book productDetails;

  ProductCard({@required this.productDetails});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('object');
      },
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Card(
          elevation: 5,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.45,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        productDetails.name,
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 22,
                            fontStyle: FontStyle.italic),
                      ),
                      Text(
                        '${productDetails.votes} \$',
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 22,
                            fontStyle: FontStyle.italic,
                            color: Colors.orangeAccent),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
