import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_app/sideBar.dart';
import 'package:new_app/product.dart';
import 'package:new_app/new_product.dart';
import 'package:new_app/paint.dart';
import 'package:new_app/footer.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _offsetAnimation;

  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Nike'),
    Tab(text: 'Addidas'),
    Tab(text: 'Jordan'),
    Tab(text: 'Puma'),
    Tab(text: 'Reebok'),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(1.5, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.linearToEaseOut,
    ));
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();

    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
          child: Text(
            'Discover',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 25,
              color: Colors.black,
            ),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(4, 5, 4, 0),
            child: Ink(
              decoration: const ShapeDecoration(
                color: Color(0xFFf4f4f6),
                shape: CircleBorder(),
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 29,
                ),
                tooltip: 'search',
                onPressed: () {},
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(4, 5, 4, 0),
            child: Ink(
              decoration: const ShapeDecoration(
                color: Color(0xFFf4f4f6),
                shape: CircleBorder(),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.notifications_none,
                  color: Colors.black,
                  size: 29,
                ),
                tooltip: '',
                onPressed: () {},
              ),
            ),
          ),
        ],
        bottom: TabBar(
          tabs: myTabs,
          indicatorColor: Colors.white,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.blueGrey.shade200,
          // Color(0xFFf4f4f6)
          labelStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            shadows: [
              Shadow(
                  color: Colors.grey,
                  offset: Offset.fromDirection(1.5, 11.0),
                  blurRadius: 11.0)
            ],
          ),
          unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w600,
            backgroundColor: Colors.white,
          ),
          isScrollable: true,
          controller: _tabController,
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Center(
              child: CustomPaint(
                //                       <-- CustomPaint widget
                size: Size((MediaQuery.of(context).size.width),
                    (MediaQuery.of(context).size.height)),
                painter: CurvePainter(),
              ),
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 300,
                        width: 50,
                        child: VerticalAppBar(),
                      ),
                      ConstrainedBox(
                        constraints: new BoxConstraints(
                          minHeight: 250.0,
                          minWidth: 5.0,
                          maxHeight: 300.0,
                          maxWidth: (MediaQuery.of(context).size.width) - 50.0,
                        ),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          primary: false,
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          children: <Widget>[
                            Product(),
                            Product(),
                            Product(),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15.0, 0, 0, 0),
                        child: Text(
                          'More',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
                            size: 29,
                          ),
                          tooltip: 'more',
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      ConstrainedBox(
                        constraints: new BoxConstraints(
                          minHeight: 200.0,
                          minWidth: 200.0,
                          maxHeight: 200.0,
                          //maxWidth: 2000.0,
                        ),
//
                        child: ListView.builder(
                          primary: false,
                          itemCount: 4,
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          itemBuilder: (BuildContext context, int index) {
//                            return SlideTransition(
//                              position: _offsetAnimation,
                            child:
                            return NewProduct();
                            // );
                            //return NewProduct();
                          },
                          scrollDirection: Axis.horizontal,
//                          primary: false,
//                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
//                          children: <Widget>[
//                            NewProduct(),
//                            NewProduct(),
//                            NewProduct(),
//                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: FooterTab(),
                      ),
                    ],
                  ),
                ]),
          ],
        ),
      ),
    );
  }
}
