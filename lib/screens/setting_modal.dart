import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/constants/app_colors.dart';
import 'package:notes_app/screens/login_screen.dart';

showSettings(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (context) => Container(
        padding: EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height * 0.52,
        decoration: BoxDecoration(
          color: AppColors.whiteBleached,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(FontAwesomeIcons.paintbrush),
                SizedBox(width: 20,),
                Text("Change theme", style: TextStyle(color: Colors.black, fontSize: 20),),
              ],
            ),
            Divider(thickness: 2, color: Colors.black,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(FontAwesomeIcons.fingerprint),
                SizedBox(width: 20,),
                Text("Enable Fingerprint", style: TextStyle(color: Colors.black, fontSize: 20),),
              ],
            ),
            Divider(thickness: 2, color: Colors.black,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(FontAwesomeIcons.file),
                SizedBox(width: 20,),
                Text("Export Notes", style: TextStyle(color: Colors.black, fontSize: 20),),
              ],
            ),
            Divider(thickness: 2, color: Colors.black,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(FontAwesomeIcons.fileCirclePlus),
                SizedBox(width: 20,),
                Text("Import Notes", style: TextStyle(color: Colors.black, fontSize: 20),),
              ],
            ),
            Divider(thickness: 2, color: Colors.black,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(FontAwesomeIcons.cloudBolt),
                SizedBox(width: 20,),
                Text("Drive backup", style: TextStyle(color: Colors.black, fontSize: 20),),
              ],
            ),
            Divider(thickness: 2, color: Colors.black,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(FontAwesomeIcons.handsHelping),
                SizedBox(width: 20,),
                Text("Suport development", style: TextStyle(color: Colors.black, fontSize: 20),),
              ],
            ),
            Divider(thickness: 2, color: Colors.black,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(FontAwesomeIcons.googlePlay),
                SizedBox(width: 20,),
                Text("Rate and review", style: TextStyle(color: Colors.black, fontSize: 20),),
              ],
            ),
            Divider(thickness: 2, color: Colors.black,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(FontAwesomeIcons.info),
                SizedBox(width: 20,),
                Text("About developer", style: TextStyle(color: Colors.black, fontSize: 20),),
              ],
            ),
            Divider(thickness: 2, color: Colors.black,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(FontAwesomeIcons.windowClose, color: Colors.red,),
                  SizedBox(width: 20,),
                  Text("Logout", style: TextStyle(color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),),
                ],
              ),
            ),
          ],
        )
    ),
  );
}