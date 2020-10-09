import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../database.dart';
import 'chatBox.dart';

class MessageScreen extends StatefulWidget {
  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.white12,
          leading: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(Icons.navigate_before)),
          title: Text('Conversations', style: GoogleFonts.getFont('Montserrat',
              color: Colors.white,)),
          actions: [
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.add, color: Colors.white),
            ),
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: MediaQuery.of(context).size.height - 80,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              children: dataSet.map((data){
                return Container(
                  child: Column(
                    children: [
                      ListTile(
                        onTap: (){
                          print('${data.username}\'s message viewed');
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context)=>MessageChatBox()));
                        },
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image(image: NetworkImage(data.avatar),
                            fit: BoxFit.cover, height: 50, width: 50,
                          ),
                        ),
                        title: Text('${data.username}', style: GoogleFonts.getFont('Montserrat',
                          color: Colors.white,
                          fontSize: 15,
                        )),
                        subtitle: Text('${data.topic}', style: TextStyle(color: Colors.white54),),
                        trailing: Text('${data.time}', style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 12,
                        ),),
                      ),
                      Divider(color: Colors.white24),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
