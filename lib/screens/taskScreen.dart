import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_app/components/sideBar.dart';
import 'package:new_app/components/paint.dart';
import 'package:new_app/components/footer.dart';

import 'newProductList.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> with TickerProviderStateMixin {
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
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Text(
            'Discover',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24,
              color: Colors.black,
            ),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
            child: Ink(
              decoration: const ShapeDecoration(
                color: Color(0xFFf4f4f6),
                shape: CircleBorder(),
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 27,
                ),
                tooltip: 'search',
                onPressed: () {},
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
            child: Ink(
              decoration: const ShapeDecoration(
                color: Color(0xFFf4f4f6),
                shape: CircleBorder(),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.notifications_none,
                  color: Colors.black,
                  size: 27,
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
            fontSize: 19,
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
                size: Size((MediaQuery.of(context).size.width),
                    (MediaQuery.of(context).size.height)),
                painter: CurvePainter(),
              ),
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                      width: (MediaQuery.of(context).size.width),
                      child: VerticalAppBar()),
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
                  ConstrainedBox(
                    constraints: new BoxConstraints(
                      minHeight: 190.0,
                      minWidth: 200.0,
                      maxHeight: 190.0,
                      //maxWidth: 2000.0,
                    ),
                    child: ListView.builder(
                      primary: false,
                      itemCount: 4,
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      itemBuilder: (BuildContext context, int index) {
                        return newProductList[index];
                      },
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ]),
          ],
        ),
      ),
      bottomNavigationBar: FooterTab(),
    );
  }
}
