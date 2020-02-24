import 'package:flutter/material.dart';

class FooterTab extends StatefulWidget {
  @override
  _FooterTabState createState() => _FooterTabState();
}

class _FooterTabState extends State<FooterTab>
    with SingleTickerProviderStateMixin {
  final List<Tab> myIcons = <Tab>[
    Tab(
      icon: const Icon(
        Icons.home,
        //color: Colors.grey,
        //size: 29,
      ),
    ),
    Tab(
      icon: const Icon(
        Icons.favorite_border,
        //color: Colors.grey,
        //size: 29,
      ),
    ),
    Tab(
      icon: const Icon(
        Icons.photo_camera,
        //color: Colors.grey,
        //size: 29,
      ),
    ),
    Tab(
      icon: const Icon(
        Icons.shopping_cart,
        //color: Colors.grey,
        //size: 29,
      ),
    ),
    Tab(
      icon: const Icon(
        Icons.person_outline,
        //color: Colors.grey,
        //size: 29,
      ),
    ),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myIcons.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      primary: false,
      elevation: 0,
      backgroundColor: Colors.grey.shade200,
      bottom: TabBar(
        tabs: myIcons,
        labelPadding: const EdgeInsets.fromLTRB(0.0, 0, 0, 0),
        indicatorColor: Colors.blueGrey.shade50,
        labelColor: Colors.pink,
        unselectedLabelColor: Colors.blueGrey,
        // Color(0xFFf4f4f6)
        labelStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),

        isScrollable: false,
        controller: _tabController,
      ),
    );
  }
}
