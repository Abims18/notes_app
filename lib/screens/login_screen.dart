import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/constants/app_colors.dart';
import 'package:notes_app/screens/home_page.dart';
import 'package:notes_app/screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: Image.asset(
                  "assets/login.jpg",
                  fit: BoxFit.contain,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 30),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Login",
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
                    TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(FontAwesomeIcons.at, color: Colors.black),
                        hintStyle: TextStyle(color: Colors.black45, fontSize: 17),
                        hintText: "abc@email.com",
                      ),
                      style: TextStyle(fontSize: 17),
                    ),
                    TextField(
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
                    Container(
                      alignment: Alignment.centerRight,
                      child: Text("Don't remember?", style: TextStyle(color: AppColors.someBlue),),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.end,
                ),
              ),

              //two buttons
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(title: "Notify")));
                      },
                      child: Hero(
                        tag: "buttontag",
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                              color: AppColors.someBlue,
                            borderRadius: BorderRadius.circular(6)
                          ),

                          width: double.infinity,
                          height: 50,
                          child: Center(
                            child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 20),),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      alignment: Alignment.center,
                      child: Text("OR"),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(6)
                      ),

                      width: double.infinity,
                      height: 50,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                                radius: 16,
                                backgroundColor: Colors.transparent,
                                child: Image.asset("assets/google.png")),
                            SizedBox(width: 7,),
                            Text("Login with Google", style: TextStyle(color: Colors.white, fontSize: 18),),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("New to Notify? ", style: TextStyle(fontSize: 16),),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
                            },
                              child: Text("Sign Up", style: TextStyle(fontSize: 16, color: AppColors.someBlue),)),
                        ],
                      ),
                    )
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
