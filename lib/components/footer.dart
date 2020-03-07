import 'package:flutter/material.dart';

class FooterTab extends StatefulWidget {
  @override
  _FooterTabState createState() => _FooterTabState();
}

class _FooterTabState extends State<FooterTab> {
  final List<BottomNavigationBarItem> myIcons = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      backgroundColor: Colors.grey.shade200,
      title: Text(''),
      icon: const Icon(
        Icons.home,
        //color: Colors.grey,
        //size: 29,
      ),
    ),
    BottomNavigationBarItem(
      title: Text(''),
      icon: const Icon(
        Icons.favorite_border,
        //color: Colors.grey,
        //size: 29,
      ),
    ),
    BottomNavigationBarItem(
      title: Text(''),
      icon: const Icon(
        Icons.photo_camera,
        //color: Colors.grey,
        //size: 29,
      ),
    ),
    BottomNavigationBarItem(
      title: Text(''),
      icon: const Icon(
        Icons.shopping_cart,
        //color: Colors.grey,
        //size: 29,
      ),
    ),
    BottomNavigationBarItem(
      title: Text(''),
      icon: const Icon(
        Icons.person_outline,
        //color: Colors.grey,
        //size: 29,
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void select(index) {
    setState(() {
      currentIndex = index;
    });
  }

  int currentIndex = 2;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      currentIndex: currentIndex,
      backgroundColor: Colors.grey.shade200,
      selectedItemColor: Colors.pink,
      unselectedItemColor: Colors.blueGrey,
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 12,
      unselectedFontSize: 12,
      onTap: select,
      items: myIcons,
//      TabBar(
//        tabs: myIcons,
//        labelPadding: const EdgeInsets.fromLTRB(0.0, 0, 0, 0),
//        indicatorColor: Colors.blueGrey.shade50,
//        labelColor: Colors.pink,
//        unselectedLabelColor: Colors.blueGrey,
//        // Color(0xFFf4f4f6)
//        labelStyle: TextStyle(
//          fontWeight: FontWeight.w600,
//          fontSize: 20,
//        ),
//
//        isScrollable: false,
//        controller: _tabController,
//      ),
    );
  }
}
