import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../database.dart';
import 'package:expandable/expandable.dart';


class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}


class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  void _openEndDrawer(){
    _scaffoldKey.currentState.openEndDrawer();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      key: _scaffoldKey,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: [
            SliverAppBar(
              leading: IconButton(
                onPressed: (){Navigator.pop(context);},
                icon: Icon(Icons.navigate_before, color: Colors.white),
              ),
              actions: [
                IconButton(
                  onPressed: (){
                    // _openEndDrawer();
                    },
                  icon: Icon(Icons.more_vert, color: Colors.white),
                ),
              ],
              backgroundColor: Colors.white12,
              collapsedHeight: 250,
              floating: false,
              pinned: false,
              elevation: 5,
              flexibleSpace: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image(image: NetworkImage('https://images.pexels.com/photos/4467127/pexels-photo-4467127.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260'),
                        fit: BoxFit.cover, height: 100, width: 100,
                      ),
                    ),
                    Text('Vatsal Gala', style: GoogleFonts.getFont('Montserrat',
                      color: Colors.white, fontSize: 20)),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Icon(Icons.auto_awesome, color: Colors.white54, size: 25,),
                            Text('Contributions', style: TextStyle(fontSize: 15, color: Colors.white54),),
                            SizedBox(height: 5),
                            Text('2,510', style: TextStyle(fontSize: 25, color: Colors.white),),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.group_add, color: Colors.white54, size: 25,),
                            Text('Followers', style: TextStyle(fontSize: 15, color: Colors.white54),),
                            SizedBox(height: 5),
                            Text('2,510', style: TextStyle(fontSize: 25, color: Colors.white),),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.monetization_on, color: Colors.white54, size: 25,),
                            Text('Donations', style: TextStyle(fontSize: 15, color: Colors.white54),),
                            SizedBox(height: 5),
                            Text('2,510', style: TextStyle(fontSize: 25, color: Colors.white),),
                          ],
                        ),
                      ],),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 50, left: 20),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber),
                      ),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white),),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: 'New post',
                      labelStyle: TextStyle(color: Colors.white),
                      hintText: 'Add your story here..',
                      hintStyle: TextStyle(color: Colors.white54),
                    ),
                    cursorColor: Colors.white,
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    children: dataSet.map((e){
                      return Column(
                        children: [
                          ListTile(
                            onTap: (){},
                            leading: CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.white24,
                              backgroundImage: NetworkImage(e.avatar),
                            ),
                            title: Text('${e.username}', style: GoogleFonts.getFont('Montserrat',
                              color: Colors.white,
                            ),),
                            subtitle: Text('${e.topic}', style: TextStyle(color: Colors.white54),),
                            trailing: IconButton(
                              onPressed: (){},
                              icon: Icon(Icons.navigate_next, color: Colors.white,),
                            ),
                          ),
                          SizedBox(height: 5),
                          FadeInImage(
                            placeholder: AssetImage('assets/spin.gif'),
                            fadeOutDuration: Duration(milliseconds: 20),
                            image: NetworkImage(e.image),
                            fit: BoxFit.cover, height: 200,
                            width: MediaQuery.of(context).size.width - 20,),
                          SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: ExpandablePanel(
                              header: Text('Click here to read ${e.username}\'s story',
                                textAlign: TextAlign.justify,
                                style: TextStyle(color: Colors.white),
                              ),

                              expanded: Text('${e.message}',
                                textAlign: TextAlign.justify,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(height: 2),
                          Container(
                            padding: EdgeInsets.only(right: 10),
                            alignment: Alignment.bottomRight,
                            child: Text('${e.time}', style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 12,
                            ),),
                          ),
                          Divider(color: Colors.white38),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ]),
            ),
          ],
        ),
        endDrawer: Drawer(
          child: Container(
            color: Colors.black87,
            child: Column(
              children: [
                SizedBox(height: 50),
                ListTile(
                  onTap: (){
                    Navigator.pop(context);
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
                  trailing: Icon(Icons.navigate_next, color: Colors.white54,),
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
    );
  }
}
