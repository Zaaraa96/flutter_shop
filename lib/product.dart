import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  //final Rect myRect = const Offset(1.0, 2.0) & const Size(3.0, 4.0);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: SizedBox(
        height: 350,
        width: 270,
        child: Stack(
          children: <Widget>[
            Container(
                width: 220,
                constraints: BoxConstraints(
                    minWidth: 100,
                    maxWidth: 300,
                    minHeight: 250,
                    maxHeight: 290),
                decoration: const BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 15.0,
                        offset: Offset(0.0, 0.75))
                  ],
                  color: Colors.purple,
                  borderRadius: BorderRadius.all(const Radius.circular(20)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 10, 10, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Nike',
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
                            'AIR-270',
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
                      padding: const EdgeInsets.fromLTRB(20.0, 10, 0, 0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            '\$150.00',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 90, 10, 10),
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
              decoration: const BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('images/shoe1.png'),
                  fit: BoxFit.contain,
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
      ),
    );
  }
}
