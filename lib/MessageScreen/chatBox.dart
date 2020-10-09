import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpify/database.dart';

class MessageChatBox extends StatefulWidget {
  @override
  _MessageChatBoxState createState() => _MessageChatBoxState();
}

class _MessageChatBoxState extends State<MessageChatBox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.white24,
        title: Text('Messages', style: GoogleFonts.getFont('Montserrat',
          color: Colors.white,)),
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.navigate_before)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Colors.white,
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width - 80,
                child: Center(child: Text('Sample message box')),
              ),
            ),
            Divider(color: Colors.white54,),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
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
                  labelText: 'New message',
                  labelStyle: TextStyle(color: Colors.white),
                  hintText: 'Add your message here..',
                  hintStyle: TextStyle(color: Colors.white54),
                ),
                cursorColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
