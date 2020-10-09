import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpify/database.dart';

class PostScreen extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body:  GestureDetector(
        onTap: (){
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              Divider(color: Colors.white38),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text('Trending today', style: TextStyle(
                  color: Colors.white54,
                ),),
              ),
              SizedBox(height: 5),
              Container(
                height: 150,
                width: MediaQuery.of(context).size.height,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder:(context, int index){
                  return Padding(
                    padding: const EdgeInsets.only(left:4, right: 4),
                    child: Container(
                      child: GestureDetector(
                        onTap: (){},
                        child: Stack(
                          children: [
                            FadeInImage(
                                fadeOutDuration: const Duration(milliseconds: 10),
                                placeholder: AssetImage('assets/spin.gif'),
                                image: NetworkImage(dataSet[index].image),
                                fit: BoxFit.cover),
                            Padding(
                              padding: const EdgeInsets.only(left: 5, top: 110),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.black54,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
                                  child: Text('${dataSet[index].username}', style: GoogleFonts.getFont('Rubik',
                                    color: Colors.white,
                                    fontSize: 22.0,
                                  ),),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
              Divider(color: Colors.white38),
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
                          width: MediaQuery.of(context).size.width - 20,
                        ),
                        SizedBox(height: 5),
                        Container(
                          width: MediaQuery.of(context).size.width - 30,
                          child: Text('${e.message}',
                            textAlign: TextAlign.justify,
                            style: TextStyle(color: Colors.white) ,)
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
            ],
          ),
        ),
      ),
    );
  }
}

