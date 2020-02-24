import 'package:flutter/material.dart';

class VerticalAppBar extends StatefulWidget {
  @override
  _VerticalAppBarState createState() => _VerticalAppBarState();
}

class _VerticalAppBarState extends State<VerticalAppBar>
    with SingleTickerProviderStateMixin {
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

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 3,
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: TabBar(
          tabs: myTabs,
          labelPadding: const EdgeInsets.fromLTRB(0.0, 5, 10, 10),
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
    );
  }
}
