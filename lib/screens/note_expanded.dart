import 'package:flutter/material.dart';
import 'package:notes_app/constants/app_colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/screens/folder_expanded.dart';

class NoteExpanded extends StatefulWidget {
  const NoteExpanded({Key? key}) : super(key: key);

  @override
  State<NoteExpanded> createState() => _NoteExpandedState();
}

class _NoteExpandedState extends State<NoteExpanded> {
  String headline = "";
  TextEditingController headControlleer = new TextEditingController();
  TextEditingController bodyContoller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBleached,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    FolderExpanded()));
                      },
                      child: Hero(
                        tag: "arrowTag",
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.bookmark_border,
                      color: Colors.black,
                      size: 30,
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                height: 20,
                width: double.infinity,
                child: Row(
                  children: [
                    Text(
                      "FOLDER NAME",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "- 21/09/2022",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                      padding: EdgeInsets.only(top: 15, left: 15, right: 35),
                      child: TextFormField(
                        controller: headControlleer,
                        onFieldSubmitted: (value){
                          setState(() {
                            headline = value;
                          });
                        },
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.next,
                        maxLines: 3,
                        minLines: 1,
                        maxLength: 50,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Headline...",
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 35,
                                fontWeight: FontWeight.bold)),
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 35),
                      ),
                    ),
              Container(
                padding: EdgeInsets.only(top: 15, left: 15, right: 35),
                child: TextFormField(
                  controller: bodyContoller,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.done,
                  maxLines: 500,
                  minLines: 1,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Start here.....",
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),

                ),

              ),
            ],
          ),
        ),
      ),
        floatingActionButton: FloatingActionButton(
          heroTag: "addBtn",
          splashColor: AppColors.darkbg,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: Colors.black,
          onPressed: () {

            Navigator.push(context, MaterialPageRoute(builder: (context) => FolderExpanded(headline: headControlleer.text, data: bodyContoller.text,)));
            print(headControlleer.text);
            print(bodyContoller.text);
          },
          child: Icon(
            Icons.save,
            color: Colors.white,
            size: 40,
          ),
        )
    );
  }
}
