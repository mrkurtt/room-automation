import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  DatabaseReference authRef = FirebaseDatabase.instance.ref('users');

  String correctUname = 'iamadmin';
  String correctPassword = 'whoami';
  bool success = false;

  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';

  Future login() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print('Username: $_username, Password: $_password');

      if (_username != correctUname || _password != correctPassword) {
        Fluttertoast.showToast(
            msg: 'Incorrect username or password',
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: const Color.fromARGB(255, 77, 77, 77),
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        prefs.setInt('loggedIn', 1);

        Fluttertoast.showToast(
            msg: 'Login successful',
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: const Color.fromARGB(255, 77, 77, 77),
            textColor: Colors.white,
            fontSize: 16.0);

        Navigator.popAndPushNamed(context, '/home');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/iot-icon.png',
                  width: 100.0,
                  height: 100.0,
                ),
                Text(
                  'Room Automation',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
                SizedBox(height: 60.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                  onSaved: (newValue) => _username = newValue!,
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  onSaved: (newValue) => _password = newValue!,
                ),
                SizedBox(height: 30.0),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Color.fromARGB(255, 46, 160, 26),
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16.0),
                        ),
                        onPressed: login,
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: 15.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
