import 'package:flutter/material.dart';
import 'package:project_ppkt/kongsiCoding/loading.dart';
import 'package:project_ppkt/services/auth.dart';

class DaftarProfil extends StatefulWidget {

  @override
  _DaftarProfilState createState() => _DaftarProfilState();


}



class _DaftarProfilState extends State<DaftarProfil> {


  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  bool loading = false;
  


  @override


  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        backgroundColor : Colors.purple[900],
        elevation: 0.0,
        title: Text('Daftar Profil Insiatif '),
        actions: <Widget>[
            FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('logout'),
            onPressed: () async {
              await _auth.signOut();
            }

          )

        ]


      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical:20.0, horizontal: 50.0 ),
        child: Form(
          key: _formkey,
        child: Column(
          children: <Widget>[
            TextField(
              
            )
          ],
          
        ),


        ),
      ),


    );

    
      
    
  }
}