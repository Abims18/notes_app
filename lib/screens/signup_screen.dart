import 'package:flutter/material.dart';
import 'package:notes_app/constants/app_colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/screens/home_page.dart';
import 'package:notes_app/screens/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * 0.4,
                child: Image.asset(
                  "assets/signup.jpg",
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 30),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Sign up",
                  style: TextStyle(
                      color: AppColors.purpleBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    SizedBox(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(FontAwesomeIcons.userAstronaut, color: Colors.black),
                          hintStyle: TextStyle(color: Colors.black45, fontSize: 17),
                          hintText: "John Doe",
                        ),
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    SizedBox(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(FontAwesomeIcons.at, color: Colors.black),
                          hintStyle: TextStyle(color: Colors.black45, fontSize: 17),
                          hintText: "doej@email.com",
                        ),
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    SizedBox(
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(FontAwesomeIcons.unlockKeyhole, color: Colors.black),
                          suffixIcon: Icon(FontAwesomeIcons.eyeSlash, color: Colors.black, size: 17,),
                          hintStyle: TextStyle(color: Colors.black45, fontSize: 17),
                          hintText: "password",
                        ),
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(FontAwesomeIcons.repeat, color: Colors.black),
                          hintStyle: TextStyle(color: Colors.black45, fontSize: 17),
                          hintText: "password again",
                        ),
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(title: "Notify")));
                },
                child: Hero(
                  tag: "buttontag",
                  child: Container(
                    margin: EdgeInsets.only(top: 10, right: 30, left: 30),
                    decoration: BoxDecoration(
                        color: AppColors.someBlue,
                        borderRadius: BorderRadius.circular(6)
                    ),

                    width: double.infinity,
                    height: 50,
                    child: Center(
                      child: Text("Continue", style: TextStyle(color: Colors.white, fontSize: 20),),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already done that? ", style: TextStyle(fontSize: 16),),
                    InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                        },
                        child: Text("Login", style: TextStyle(fontSize: 16, color: AppColors.someBlue),)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
