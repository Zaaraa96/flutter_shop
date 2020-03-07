import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  final Color backgroundColor;
  final double xTranslate;
  final String brand;
  final String model;
  final String price;
  final String url;
  Product({
    @required this.backgroundColor,
    @required this.xTranslate,
    @required this.brand,
    @required this.model,
    @required this.price,
    @required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Stack(
        children: <Widget>[
          Container(
              width: 220,
              height: 300,
              constraints: BoxConstraints(
                minWidth: 220,
                maxWidth: 300,
              ),
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
                    padding: const EdgeInsets.fromLTRB(20.0, 7, 10, 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          brand,
                          style: const TextStyle(
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
                          style: const TextStyle(
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
                          style: const TextStyle(
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
          Container(
            height: 300,
            child: Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.002)
                ..translate(xTranslate),
              child: Container(
                width: 260,
                height: 260,
                padding: const EdgeInsets.fromLTRB(5, 20, 0, 0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(url),
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
