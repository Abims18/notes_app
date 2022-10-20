import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/constants/app_colors.dart';
import 'package:notes_app/screens/folder_expanded.dart';
import 'package:notes_app/screens/setting_modal.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int nofcards = 1;
  bool clicker = true;
  List<String> folderNames = ["Personal"];

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.darkbg,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "folders",
                          style: TextStyle(
                              color: AppColors.strongWhite,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                        InkWell(
                          onTap: (){
                            showSettings(context);
                          },
                            child: Icon(Icons.settings, color: Colors.white, size: 36,))
                      ],
                    ),
                  ),
                  nofcards != 0
                      ? InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => FolderExpanded()));
                    },
                        child: Container(
                            padding: EdgeInsets.only(top: 20),
                            height: MediaQuery.of(context).size.height,
                            width: double.infinity,
                            child: GridView.builder(
                                itemCount: nofcards,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1,
                                  mainAxisExtent: 150,
                                  mainAxisSpacing: 20,
                                ),
                                itemBuilder: (context, index) {
                                  return Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    color: AppColors.avgBlue,
                                    elevation: 20,
                                    child: Container(
                                      padding: EdgeInsets.all(15),
                                      alignment: Alignment.topCenter,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Hero(
                                                tag: "folderName",
                                                child: Text(
                                                  folderNames[index],
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12),
                                                ),
                                              ),
                                              Hero(
                                                tag: "arrowTag",
                                                child: Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: Colors.white,
                                                  size: 15,
                                                ),
                                              )
                                            ],
                                          ),
                                          Container(
                                            child: Text(
                                              "0",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 46),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                })),
                      )
                      : Container(
                          padding: EdgeInsets.all(30),
                          child: Text(
                            "No folders",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 30),
                          ))
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
          backgroundColor: AppColors.avgBlue,
          onPressed: () {
            showDialogForm();
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
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
            backgroundColor: AppColors.avgBlue,
            content: Container(
              width: double.infinity,
              height: 150,
              color: AppColors.avgBlue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: foldername,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.avgBlue,
                      hintText: "Enter folder title here",
                      hintStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                      enabled: true,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.avgBlue)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.avgBlue)),
                    ),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.avgBlue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        setState(() {
                          if (foldername != null) {
                            folderNames.add(foldername.text);
                            nofcards += 1;
                          }
                          print(folderNames);
                          Navigator.pop(context);
                        });
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

  showAdd() {
    return AlertDialog(
      backgroundColor: AppColors.eggBlue,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      actions: [
        Container(
          color: Colors.black,
          height: 20,
          width: 100,
          child: Text(
            "CREATE",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
      content: TextField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: "Enter folder title",
            enabled: true,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white))),
      ),
    );
  }

  showModal() {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height * 0.3,
        decoration: BoxDecoration(
          color: AppColors.eggBlue,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
        ),
        child: Center(
            child: TextField(
          textAlign: TextAlign.center,
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: "Enter folder title",
              enabled: true,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white))),
        )),
      ),
    );
  }



}
