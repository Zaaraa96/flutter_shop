import 'package:flutter/material.dart';
import 'productList.dart';
import 'package:new_app/components/product.dart';

import 'package:provider/provider.dart';

class VerticalAppBar extends StatefulWidget {
  @override
  _VerticalAppBarState createState() => _VerticalAppBarState();
}

class _VerticalAppBarState extends State<VerticalAppBar>
    with TickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'New'),
    Tab(text: 'Featured'),
    Tab(text: 'Upcoming'),
  ];
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<double> y_rotate = [0.0, 0.0, 0.0, 0.0];
  int productNum = 4;
  ScrollController listController =
      ScrollController(initialScrollOffset: 0, keepScrollOffset: true);
  double xTranslate = 0;
  @override
  Widget build(BuildContext context) {
    double offset = 300.0;

    return ChangeNotifierProvider<Data>(
      create: (context) {
        return Data();
      },
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 50,
            height: 300,
            child: RotatedBox(
              quarterTurns: 3,
              child: AppBar(
                elevation: 0,
                backgroundColor: Colors.white,
                title: TabBar(
                  tabs: myTabs,
                  labelPadding: const EdgeInsets.fromLTRB(0.0, 5, 7, 10),
                  indicatorColor: Colors.white,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  // Color(0xFFf4f4f6)
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                  unselectedLabelStyle: TextStyle(
                    backgroundColor: Colors.white,
                  ),
                  isScrollable: false,
                  controller: _tabController,
                ),
              ),
            ),
          ),
          SizedBox(
            width: (MediaQuery.of(context).size.width) - 50,
            height: 300.0,
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: 250.0,
                    minWidth: 5.0,
                    // maxHeight: 260.0,
                    maxWidth: (MediaQuery.of(context).size.width) - 50.0,
                  ),
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    controller: listController,
                    itemCount: 4,
                    primary: false,
                    padding: const EdgeInsets.fromLTRB(10, 0, 100, 0),
                    separatorBuilder: (BuildContext context, int index) {
                      return Listener(
                          child: Container(
                            width: 40,
                            height: 300,
                            child: Text(""),
                            //color: Colors.blueAccent,
                          ),
                          onPointerMove: (ctx) {
                            if (ctx.delta.dx < 0) {
                              //print('flag');
                              listController.animateTo(
                                  offset * (index + 1).toDouble(),
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.linear);
                            }
                            if (ctx.delta.dx > 0) {
                              //print('flag');
                              listController.animateTo(
                                  offset * (index - 1).toDouble(),
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.linear);
                            }
                          });
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return Listener(
                        child: Transform(
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.002)
                            ..rotateY(-0.3 * y_rotate[index]),
                          child: Product(
                            backgroundColor: productList[index]
                                ['backgroundColor'],
                            brand: productList[index]['brand'],
                            model: productList[index]['model'],
                            price: productList[index]['price'],
                            url: productList[index]['url'],
                            xTranslate:
                                Provider.of<Data>(context).xTranslate[index],
                          ),
                        ),
                        onPointerMove: (ctx) {
                          if (ctx.delta.dx < 0) {
                            listController.animateTo(
                                offset * (index + 1).toDouble(),
                                duration: Duration(milliseconds: 600),
                                curve: Curves.linear);
                            bool startNext = false;
                            AnimationController _controller =
                                AnimationController(
                              duration: const Duration(milliseconds: 300),
                              vsync: this,
                            );
                            Animation curve = CurvedAnimation(
                                parent: _controller, curve: Curves.decelerate);
                            _controller.forward();
                            // bool firstTime = true;
                            curve.addStatusListener((status) {
                              if (status == AnimationStatus.completed) {
                                startNext = true;
                                _controller.reverse(from: 1);
                              } else if (status == AnimationStatus.dismissed) {
//                                        if (firstTime) {
//                                          _controller.forward();
//                                          firstTime = false;
//                                        } else {
                                _controller.dispose();
                                // }
                              }
                            });
                            _controller.addListener(() {
                              setState(() {
                                y_rotate[index] = _controller.value;

                                if (index + 1 < productNum) {
                                  y_rotate[index + 1] = -1;
                                  Provider.of<Data>(context, listen: false)
                                      .changeX(0.4, index + 1);
                                  if (startNext) {
                                    //print(_controller.value);
                                    if (_controller.value <= 0.2) {
                                      Provider.of<Data>(context, listen: false)
                                          .changeX(
                                              2 * _controller.value, index + 1);
                                    }

                                    y_rotate[index + 1] =
                                        -2 * _controller.value;
                                  }
                                }
                                Provider.of<Data>(context, listen: false)
                                    .changeX(-_controller.value, index);
                              });
                            });
                          } else if (ctx.delta.dx > 0) {
                            listController.animateTo(
                                offset * (index - 1).toDouble(),
                                duration: Duration(milliseconds: 300),
                                curve: Curves.linear);
                          }
                        },
                      );
                    },
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: 250.0,
                    minWidth: 5.0,
                    // maxHeight: 260.0,
                    maxWidth: (MediaQuery.of(context).size.width) - 50.0,
                  ),
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    controller: listController,
                    itemCount: 4,
                    primary: false,
                    padding: const EdgeInsets.fromLTRB(10, 0, 100, 0),
                    separatorBuilder: (BuildContext context, int index) {
                      return Listener(
                          child: Container(
                            width: 40,
                            height: 300,
                            child: Text(""),
                            //color: Colors.blueAccent,
                          ),
                          onPointerMove: (ctx) {
                            if (ctx.delta.dx < 0) {
                              //print('flag');
                              listController.animateTo(
                                  offset * (index + 1).toDouble(),
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.linear);
                            }
                            if (ctx.delta.dx > 0) {
                              //print('flag');
                              listController.animateTo(
                                  offset * (index - 1).toDouble(),
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.linear);
                            }
                          });
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return Listener(
                        child: Transform(
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.002)
                            ..rotateY(-0.3 * y_rotate[index]),
                          child: Product(
                            backgroundColor: productList[index]
                                ['backgroundColor'],
                            brand: productList[index]['brand'],
                            model: productList[index]['model'],
                            price: productList[index]['price'],
                            url: productList[index]['url'],
                            xTranslate:
                                Provider.of<Data>(context).xTranslate[index],
                          ),
                        ),
                        onPointerMove: (ctx) {
                          if (ctx.delta.dx < 0) {
                            listController.animateTo(
                                offset * (index + 1).toDouble(),
                                duration: Duration(milliseconds: 600),
                                curve: Curves.linear);
                            bool startNext = false;
                            AnimationController _controller =
                                AnimationController(
                              duration: const Duration(milliseconds: 300),
                              vsync: this,
                            );
                            Animation curve = CurvedAnimation(
                                parent: _controller, curve: Curves.decelerate);
                            _controller.forward();
                            // bool firstTime = true;
                            curve.addStatusListener((status) {
                              if (status == AnimationStatus.completed) {
                                startNext = true;
                                _controller.reverse(from: 1);
                              } else if (status == AnimationStatus.dismissed) {
//                                        if (firstTime) {
//                                          _controller.forward();
//                                          firstTime = false;
//                                        } else {
                                _controller.dispose();
                                // }
                              }
                            });
                            _controller.addListener(() {
                              setState(() {
                                y_rotate[index] = _controller.value;

                                if (index + 1 < productNum) {
                                  y_rotate[index + 1] = -1;
                                  Provider.of<Data>(context, listen: false)
                                      .changeX(0.4, index + 1);
                                  if (startNext) {
                                    //print(_controller.value);
                                    if (_controller.value <= 0.2) {
                                      Provider.of<Data>(context, listen: false)
                                          .changeX(
                                              2 * _controller.value, index + 1);
                                    }

                                    y_rotate[index + 1] = -_controller.value;
                                  }
                                }
                                Provider.of<Data>(context, listen: false)
                                    .changeX(-_controller.value, index);
                              });
                            });
                          } else if (ctx.delta.dx > 0) {
                            listController.animateTo(
                                offset * (index - 1).toDouble(),
                                duration: Duration(milliseconds: 300),
                                curve: Curves.linear);
                          }
                        },
                      );
                    },
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: 250.0,
                    minWidth: 5.0,
                    // maxHeight: 260.0,
                    maxWidth: (MediaQuery.of(context).size.width) - 50.0,
                  ),
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    controller: listController,
                    itemCount: 4,
                    primary: false,
                    padding: const EdgeInsets.fromLTRB(10, 0, 100, 0),
                    separatorBuilder: (BuildContext context, int index) {
                      return Listener(
                          child: Container(
                            width: 40,
                            height: 300,
                            child: Text(""),
                            //color: Colors.blueAccent,
                          ),
                          onPointerMove: (ctx) {
                            if (ctx.delta.dx < 0) {
                              //print('flag');
                              listController.animateTo(
                                  offset * (index + 1).toDouble(),
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.linear);
                            }
                            if (ctx.delta.dx > 0) {
                              //print('flag');
                              listController.animateTo(
                                  offset * (index - 1).toDouble(),
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.linear);
                            }
                          });
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return Listener(
                        child: Transform(
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.002)
                            ..rotateY(-0.3 * y_rotate[index]),
                          child: Product(
                            backgroundColor: productList[index]
                                ['backgroundColor'],
                            brand: productList[index]['brand'],
                            model: productList[index]['model'],
                            price: productList[index]['price'],
                            url: productList[index]['url'],
                            xTranslate:
                                Provider.of<Data>(context).xTranslate[index],
                          ),
                        ),
                        onPointerMove: (ctx) {
                          if (ctx.delta.dx < 0) {
                            listController.animateTo(
                                offset * (index + 1).toDouble(),
                                duration: Duration(milliseconds: 600),
                                curve: Curves.linear);
                            bool startNext = false;
                            AnimationController _controller =
                                AnimationController(
                              duration: const Duration(milliseconds: 300),
                              vsync: this,
                            );
                            Animation curve = CurvedAnimation(
                                parent: _controller, curve: Curves.decelerate);
                            _controller.forward();
                            // bool firstTime = true;
                            curve.addStatusListener((status) {
                              if (status == AnimationStatus.completed) {
                                startNext = true;
                                _controller.reverse(from: 1);
                              } else if (status == AnimationStatus.dismissed) {
//                                        if (firstTime) {
//                                          _controller.forward();
//                                          firstTime = false;
//                                        } else {
                                _controller.dispose();
                                // }
                              }
                            });
                            _controller.addListener(() {
                              setState(() {
                                y_rotate[index] = _controller.value;

                                if (index + 1 < productNum) {
                                  y_rotate[index + 1] = -1;
                                  Provider.of<Data>(context, listen: false)
                                      .changeX(0.4, index + 1);
                                  if (startNext) {
                                    //print(_controller.value);
                                    if (_controller.value <= 0.2) {
                                      Provider.of<Data>(context, listen: false)
                                          .changeX(
                                              2 * _controller.value, index + 1);
                                    }

                                    y_rotate[index + 1] = -_controller.value;
                                  }
                                }
                                Provider.of<Data>(context, listen: false)
                                    .changeX(-_controller.value, index);
                              });
                            });
                          } else if (ctx.delta.dx > 0) {
                            listController.animateTo(
                                offset * (index - 1).toDouble(),
                                duration: Duration(milliseconds: 300),
                                curve: Curves.linear);
                          }
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Data extends ChangeNotifier {
  List<double> xTranslate = [0, 0, 0, 0];
  void changeX(data, index) {
    xTranslate[index] = 200 * data;
    notifyListeners();
  }
}
