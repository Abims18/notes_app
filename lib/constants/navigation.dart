import 'package:flutter/material.dart';

void pushAndRemove(BuildContext context, Widget page) {
  Navigator.pushReplacement<void, void>(
    context,
    MaterialPageRoute<void>(
      builder: (BuildContext context) => page,
    ),
  );
}

void GoTo(BuildContext context, Widget page){
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}