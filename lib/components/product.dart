import 'package:flutter/material.dart';
//
//class Product extends StatelessWidget {
//  Color backgroundColor;
//  bool move;
//  String brand;
//  String model;
//  String price;
//  String url;
//  Product({
//    @required backgroundColor,
//    @required brand,
//    @required model,
//    @required price,
//    @required url,
//    @required move,
//  }) {
//    this.backgroundColor = backgroundColor;
//    this.brand = brand;
//    this.model = model;
//    this.url = url;
//    this.price = price;
//    this.move = move;
//  }
//
//  @override
//  ProductState createState() => ProductState(
//        backgroundColor: backgroundColor,
//        brand: brand,
//        model: model,
//        url: url,
//        price: price,
//        move: move,
//      );
//}

class Product extends StatelessWidget {
  Color backgroundColor;
  double xTranslate;
  String brand;
  String model;
  String price;
  String url;
  Product({
    @required backgroundColor,
    @required xTranslate,
    @required brand,
    @required model,
    @required price,
    @required url,
  }) {
    this.xTranslate = xTranslate;
    this.backgroundColor = backgroundColor;
    this.brand = brand;
    this.model = model;
    this.url = url;
    this.price = price;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 50, 0),
      child: Stack(
        children: <Widget>[
          Container(
              width: 220,
              constraints: BoxConstraints(
                  minWidth: 220, maxWidth: 300, minHeight: 250, maxHeight: 300),
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 7.0,
                      offset: Offset(0.0, 0.75))
                ],
                color: backgroundColor,
                borderRadius: BorderRadius.all(const Radius.circular(20)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 7, 10, 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          brand,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                            size: 25,
                          ),
                          tooltip: 'like',
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          model,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 7, 0, 0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          price,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 220,
                      alignment: Alignment.bottomRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          IconButton(
                            icon: const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 25,
                            ),
                            tooltip: 'forward',
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
          Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.002)
              ..translate(xTranslate),
            child: Container(
              width: 250,
              height: 250,
              margin: EdgeInsets.fromLTRB(5, 20, 0, 0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(url),
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
