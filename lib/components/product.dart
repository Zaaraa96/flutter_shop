import 'package:flutter/material.dart';

class Product extends StatefulWidget {
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
      @required url,
      move}) {
    this.backgroundColor = backgroundColor;
    this.brand = brand;
    this.model = model;
    this.url = url;
    this.price = price;
  }

  @override
  _ProductState createState() => _ProductState(
        backgroundColor: backgroundColor,
        brand: brand,
        model: model,
        url: url,
        price: price,
      );
}

class _ProductState extends State<Product> with TickerProviderStateMixin {
  Color backgroundColor;
  String brand;
  String model;
  String price;
  String url;
  _ProductState({
    @required backgroundColor,
    @required brand,
    @required model,
    @required price,
    @required url,
  }) {
    this.backgroundColor = backgroundColor;
    this.brand = brand;
    this.model = model;
    this.url = url;
    this.price = price;
  }
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  double xTranslate = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 50, 0),
      child: Listener(
        onPointerMove: (ctx) {
          if (ctx.delta.dx < -2) {
            AnimationController _controller = AnimationController(
              duration: const Duration(milliseconds: 500),
              vsync: this,
            );
            Animation curve =
                CurvedAnimation(parent: _controller, curve: Curves.easeOut);
            _controller.forward();
            curve.addStatusListener((status) {
              if (status == AnimationStatus.completed) {
                _controller.reverse(from: 1);
              } else if (status == AnimationStatus.dismissed) {
                _controller.dispose();
              }
            });
            _controller.addListener(() {
              setState(() {
                xTranslate = 100 * _controller.value;
              });
            });
          }
        },
        child: Stack(
          children: <Widget>[
            Container(
                width: 220,
                constraints: BoxConstraints(
                    minWidth: 100,
                    maxWidth: 300,
                    minHeight: 250,
                    maxHeight: 300),
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
            Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.002)
                ..translate(-xTranslate),
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
      ),
    );
  }
}
