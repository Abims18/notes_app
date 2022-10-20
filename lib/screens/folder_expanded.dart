import 'package:flutter/material.dart';
import 'package:notes_app/constants/app_colors.dart';
import 'package:notes_app/screens/home_page.dart';
import 'package:notes_app/screens/note_expanded.dart';


class FolderExpanded extends StatefulWidget {
  FolderExpanded({Key? key, String? headline, String? data});

  String headline = '';
  String data = "";


  @override
  State<FolderExpanded> createState() => _FolderExpandedState();
}

class _FolderExpandedState extends State<FolderExpanded> {

  List<String> headLines = [];
  List<String> bodyData = [];

  @override
  void initState() {
    // TODO: implement initState
    headLines.add(widget.headline);
    bodyData.add(widget.data);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.avgBlue,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => MyHomePage(title: "Notes")));
                    },
                    child: Hero(
                      tag: "arrowTag",
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                  Hero(
                    tag: "folderName",
                    child: Text(
                      "Personal",
                      style: TextStyle(
                          color: AppColors.strongWhite,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                  ),
                  headLines.length > 1 ?
                  Expanded(
                      child: GridView.builder(
                        itemCount: headLines.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 20,
                            childAspectRatio: 1 / 2,
                          ), itemBuilder: (context, index) {
                        return Container(
                          color: Colors.grey,
                          child: Column(
                            children: [
                              Text(headLines[index]),
                              Text(bodyData[index]),
                            ],
                          ),
                        );
                      })) : 
                      Container(
                        padding: EdgeInsets.all(100),
                        alignment: Alignment.center,
                        child: Text("No Notes yet", style: TextStyle(color: Colors.white),),
                      )

                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: "addBtn",
          splashColor: AppColors.darkbg,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: AppColors.strongWhite,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NoteExpanded()));
          },
          child: Icon(
            Icons.add,
            color: AppColors.avgBlue,
            size: 40,
          ),
        )
    );
  }

  showDialogForm() {
    TextEditingController foldername = new TextEditingController();
    return showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            backgroundColor: AppColors.eggBlue,
            content: Container(
              width: double.infinity,
              height: 150,
              color: AppColors.eggBlue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: foldername,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.eggBlue,
                      hintText: "Note Headline",
                      hintStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                      enabled: true,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.eggBlue)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.eggBlue)),
                    ),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.eggBlue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {

                      },
                      child: Text(
                        "CREATE",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ))
                ],
              ),
            ),
          );
        });
  }
}

