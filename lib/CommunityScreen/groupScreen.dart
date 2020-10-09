import 'package:flutter/material.dart';

class CommunityGroupScreen extends StatefulWidget {
  @override
  _CommunityGroupScreenState createState() => _CommunityGroupScreenState();
}

class _CommunityGroupScreenState extends State<CommunityGroupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(child: Text('Community Group Screen Demo')),
      ),
    );
  }
}
