import 'package:flutter/material.dart';
import 'package:project_ppkt/screens/authenticate/authenticate.dart';
import 'package:project_ppkt/screens/home/home.dart';
import 'package:provider/provider.dart';
import 'package:project_ppkt/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    print(user);

    // return either home or Authenticate widget
    if (user == null) {
          return Authenticate(
      
    );

    } else {
      return Home();
      
    }
     
  
  }
}