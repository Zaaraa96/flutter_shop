import 'package:flutter/material.dart';

class NewProduct extends StatelessWidget {
  //final Rect myRect = const Offset(1.0, 2.0) & const Size(3.0, 4.0);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.all(const Radius.circular(20)),
        child: Container(
            constraints: BoxConstraints(
                minWidth: 100, maxWidth: 170, minHeight: 100, maxHeight: 150),
            decoration: const BoxDecoration(
              image: const DecorationImage(
                alignment: Alignment.topCenter,
                image: AssetImage('images/new_shoe1.png'),
                fit: BoxFit.scaleDown,
              ),
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      RotatedBox(
                        quarterTurns: 3,
                        child: Container(
                          color: Colors.pink.shade500,
                          //Color(0xFFed829c),
                          height: 20,
                          width: 80,
                          child: Center(
                            child: Text(
                              'NEW',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.favorite_border,
                          color: Colors.black,
                          size: 30,
                        ),
                        tooltip: 'like',
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 10, 0, 0),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Text(
                            'NIKE AIR -MAX',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Text(
                            '\$150.00',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
