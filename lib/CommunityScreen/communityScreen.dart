import 'package:flutter/material.dart';
import 'package:helpify/CommunityScreen/forumScreen.dart';
import 'package:helpify/CommunityScreen/groupScreen.dart';
import 'package:hexcolor/hexcolor.dart';

class CommunityScreen extends StatefulWidget {
  @override
  _CommunityScreenState createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> with SingleTickerProviderStateMixin {
  TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, initialIndex: 0, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 50,
        elevation: 0,
        bottom: TabBar(
          controller: _controller,
          indicatorColor: Hexcolor('e0b802'),
          indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
          tabs: [
            Tab(
              icon: Icon(Icons.poll, color: Colors.black, size: 30,), // Forum
            ),
            Tab(
              icon: Icon(Icons.group_add, color: Colors.black, size: 30,), // Groups
            ),
          ],
        ),
      ),
      body:  TabBarView(
        controller: _controller,
        children: [
          ForumScreen(),
          CommunityGroupScreen(),
        ],
      ),
    );
  }
}
