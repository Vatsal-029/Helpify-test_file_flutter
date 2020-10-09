import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpify/CommunityScreen/communityScreen.dart';
import 'package:helpify/MessageScreen/messageScreen.dart';
import 'package:helpify/PostScreens/postScreen.dart';
import 'package:helpify/ProfileScreens/profileScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, initialIndex: 0, length: 2);
  }

  int _selectedIndex = 1;
  void _onTapped(int index){
    setState(() {
      // _selectedIndex = index;
      if(index == 0){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>MessageScreen()));
      } else if (index == 2){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
      } else { return HomeScreen();}
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  void _openEndDrawer(){
    _scaffoldKey.currentState.openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.black,
       appBar: AppBar(
         backgroundColor: Colors.white12,
         centerTitle: false,
         title: GestureDetector(
           onTap: (){},
           child: Text('Helpify', style:GoogleFonts.getFont('Hind Siliguri',
               fontSize: 30,
               fontWeight: FontWeight.bold,
               color: Colors.white), //Hexcolor('65247d')
           ),
         ),
         elevation: 1,
         bottom: TabBar(
           controller: _tabController,
           indicatorColor: Colors.amber,
           tabs: [
             Tab(
               icon: Icon(Icons.public, color: Colors.white, size: 30,), //Hexcolor('e0b802') // Posts
             ),
             Tab(
               icon: Icon(Icons.group, color: Colors.white, size: 30,), // Community
             ),
           ],
         ),
         actions: [
           IconButton(
             onPressed: (){},
             icon: Icon(Icons.search, color: Colors.white,),
           ),
           IconButton(
             onPressed: (){
               _openEndDrawer();
             },
             icon: Icon(Icons.more_vert, color: Colors.white),
           ),
         ],
       ),
        body: TabBarView(
          controller: _tabController,
          children: [
            PostScreen(),
            CommunityScreen(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onTapped,
          selectedItemColor: Colors.white70,
          unselectedItemColor: Colors.white70,
          backgroundColor: Colors.white10,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline),
              label: '',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: '',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.perm_identity),
              label: '',
            ),
          ],
        ),
        endDrawer: ClipRRect(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(250)),
          child: Container(
            width: 250,
            child: Drawer(
              child: Container(
                color: Colors.black87,
                child: Column(
                  children: [
                    SizedBox(height: 50),
                    ListTile(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfileScreen()));
                      },
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image(image: NetworkImage('https://images.pexels.com/photos/4467127/pexels-photo-4467127.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260'),
                          fit: BoxFit.cover, height: 50, width: 50,
                        ),
                      ),
                      title: Text('Vatsal Gala', style: GoogleFonts.getFont('Montserrat',
                        color: Colors.white,
                        fontSize: 15,
                      )),
                      subtitle: Text('dummyuser@mail.com', style: GoogleFonts.getFont('Montserrat',
                        color: Colors.white54, fontSize: 12,
                      )),
                    ),
                    SizedBox(height: 50),
                    ListTile(
                      onTap: (){},
                      leading: Icon(Icons.settings, color: Colors.white, size: 25,),
                      title: Text('Settings', style: GoogleFonts.getFont('Montserrat',
                        color: Colors.white,
                        fontSize: 20,
                      )),
                    ),
                    ListTile(
                      onTap: (){},
                      leading: Icon(Icons.grain, color: Colors.white, size: 25,),
                      title: Text('Volunteer', style: GoogleFonts.getFont('Montserrat',
                        color: Colors.white,
                        fontSize: 20,
                      )),
                    ),
                    ListTile(
                      onTap: (){},
                      leading: Icon(Icons.local_florist, color: Colors.white, size: 25,),
                      title: Text('Offer service', style: GoogleFonts.getFont('Montserrat',
                        color: Colors.white,
                        fontSize: 20,
                      )),
                    ),
                    ListTile(
                      onTap: (){},
                      leading: Icon(Icons.monetization_on, color: Colors.white, size: 25,),
                      title: Text('Contribute', style: GoogleFonts.getFont('Montserrat',
                        color: Colors.white,
                        fontSize: 20,
                      )),
                    ),
                    ListTile(
                      onTap: (){},
                      leading: Icon(Icons.share, color: Colors.white, size: 25,),
                      title: Text('Share', style: GoogleFonts.getFont('Montserrat',
                        color: Colors.white,
                        fontSize: 20,
                      )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}