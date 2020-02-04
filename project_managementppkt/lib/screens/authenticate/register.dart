import 'package:flutter/material.dart';
import 'package:project_ppkt/kongsiCoding/loading.dart';
import 'package:project_ppkt/kongsiCoding/sama.dart';
import 'package:project_ppkt/services/auth.dart';

class Register extends StatefulWidget {

   final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth =AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text field state
  String email = '';
  String password = '';
  String error = '';


  @override
  Widget build(BuildContext context) {
    return loading ? Loading() :  Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        backgroundColor: Colors.purple[900],
        elevation: 0.0,
        title: Text('Daftar Masuk'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Log Masuk'),
            
            onPressed: () {
              widget.toggleView();
            }

          )
        
        ]
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
         child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Masukkan Email'),
                validator: (val) => val.isEmpty ? 'Masukkan email' :null,
                onChanged: (val) {
                  setState(() => email = val);


                }
              ),
              SizedBox(height:20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Masukkan Kata Laluan'),
                obscureText: true,
                validator: (val) => val.length < 6 ? 'Masukkan kata laluan enam atau lebih panjang ' :null,
                onChanged: (val){
                  setState(() => password = val);
                }
              ),
              SizedBox(height:20.0),
              RaisedButton(
                color: Colors.white,
                child: Text(
                  'Daftar',
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () async {
                 if(_formKey.currentState.validate()){
                   setState(()=> loading = true);
                   dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                    if(result == null){
                      setState(() {
                      error = 'Tolong Masukkan Email yang Didaftar';
                      loading = false;
                      });
                    }else {

                    }                   
                 }
                 
                }
              ),
              SizedBox(height:12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              )
            ],
          )
        ),
      )      
    );
  }
}