import 'package:flutter/material.dart';
import 'package:project_ppkt/kongsiCoding/loading.dart';
import 'package:project_ppkt/kongsiCoding/sama.dart';
import 'package:project_ppkt/services/auth.dart';

class SignIn extends StatefulWidget {

   final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth =AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text field state
  String email = '';
  String password = '';
  String error ='';


  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        backgroundColor: Colors.purple[900],
        elevation: 0.0,
        title: Text('Log Masuk'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Daftar Masuk'),
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
                  'Log Masuk',
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () async {
                 if(_formKey.currentState.validate()){
                   setState(()=> loading = true);
                  dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                   if(result == null){
                    setState(() {
                      error = 'Tidak dapat Log Masuk dengan Email dan Kata Laluan itu';
                      loading = false;
                    });
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