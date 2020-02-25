import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  Color backgroundColor;
  String brand;
  String model;
  String price;
  String url;
  Product(
      {@required backgroundColor,
      @required brand,
      @required model,
      @required price,
      @required url}) {
    this.backgroundColor = backgroundColor;
    this.brand = brand;
    this.model = model;
    this.url = url;
    this.price = price;
  }

  @override
  Widget build(BuildContext context) {
    //double height=;
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 50, 0),
      child: Stack(
        children: <Widget>[
          Container(
              width: 220,
              constraints: BoxConstraints(
                  minWidth: 100, maxWidth: 300, minHeight: 250, maxHeight: 300),
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 15.0,
                      offset: Offset(0.0, 0.75))
                ],
                color: backgroundColor,
                borderRadius: BorderRadius.all(const Radius.circular(20)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 7, 10, 7),
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 120, 10, 10),
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
                ],
              )),
          Container(
            width: 250,
            height: 250,
            margin: EdgeInsets.fromLTRB(5, 20, 0, 0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(url),
                fit: BoxFit.scaleDown,
              ),
              // boxShadow: <BoxShadow>[
//                BoxShadow(
//                    color: Colors.grey,
//                    blurRadius: 5.0,
//                    offset: Offset(0.0, 0.75))
//              ],
//              borderRadius: BorderRadius.all(const Radius.circular(20)),
            ),
          ),
        ],
      ),
    );
  }
}
