import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project_ppkt/services/auth.dart';
import 'package:project_ppkt/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_ppkt/screens/home/project_list.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();
 
  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
          value: DatabaseService().projects,
          child: Scaffold(

          drawer: Drawer(
          child: ListView(
           children: <Widget>[
             DrawerHeader( 
               decoration: BoxDecoration(
                gradient: LinearGradient(colors:<Color>[
                  Colors.deepOrange,
                  Colors.orangeAccent,

                ])
 
 
               ),

               child: Container(
                child: Column(
                  children: <Widget>[
                    Material(
                      borderRadius: BorderRadius.all(Radius.circular(50.0) ),
                      child: Image.asset('lib/gambar2/BannerPpkt1-50years_compressed.jpg')
                      
                      
                    )
                  ],
              
                )

               ),

               
               ),

          CustomListTile(Icons.folder,'Daftar Profil Inisiatif',()=>{}),
           CustomListTile(Icons.person,'Tambah Ahli Kumpulan',()=>{}),
       CustomListTile(Icons.folder,'Daftar Profil Inisiatif',()=>{}),
       CustomListTile(Icons.folder,'Daftar Profil Inisiatif',()=>{}),

      ],
  ),

        ),
        backgroundColor: Colors.white,
        appBar: AppBar(

          title: Text(' Project Management PPKT'),
          backgroundColor: Colors.purple[900],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                await _auth.signOut();

              },
            )
          ],

        ),
        body: ProjectList(),
      ),
    );
      

  
    
  }
}

class CustomListTile extends StatelessWidget{

  IconData icon;
  String text;
  Function onTap;

  CustomListTile(this.icon,this.text,this.onTap);

@override
Widget build(BuildContext context)  {

  // TODO: implement build

  return Padding(
    padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
    child: Container(
      decoration: BoxDecoration(
       border: Border (bottom: BorderSide(color: Colors.grey))

      ),
      child: InkWell( 
        splashColor: Colors.purpleAccent,

        onTap: onTap,
        child: Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            
            children: <Widget>[

              Row(
                children: <Widget>[
                  Icon(icon),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(text,style: TextStyle(
                      fontSize: 16.0

                    )),
                  ),

                ],
                
              ),

              Icon(Icons.arrow_forward)


          ],
          
          ),
        )



      ),
    ),
  );


}


}
