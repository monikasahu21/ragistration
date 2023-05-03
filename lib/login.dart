// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
  bool validatePassword(String pass) {
    String _password = pass.trim();
    if (pass_valid.hasMatch(_password)) {
      return true;
    } else {
      return false;
    }
  }

  late String _email;
  late String _password;
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Padding(
          padding: EdgeInsets.all(screenWidth * 0.05),
          child: Form(
            key: _formKey,
            child: Container(
              height: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email",
                    style: TextStyle(
                      fontSize: screenHeight * 0.02,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  TextFormField(
                    decoration: InputDecoration(
                        // labelText: 'example@mail.com',
                        border: OutlineInputBorder()),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _email = value!;
                    },
                  ),
                  SizedBox(height: 5),
                  Text("New Passward"),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter password";
                      } else {
                        //call function to check password
                        bool result = validatePassword(value);
                        if (result) {
                          // create account event
                          return null;
                        } else {
                          return " At least 8 characters, A lower case letter,An upper case letter,A special character,A number";
                        }
                      }
                    },
                    decoration: InputDecoration(
                        // labelText: 'Choose a secure password',
                        border: OutlineInputBorder()),
                    // obscureText: true,
                    // validator: (value) {
                    //   if (value!.isEmpty) {
                    //     return 'Please enter your password';
                    //   }
                    //   return null;
                    // },
                    // onSaved: (value) {
                    //   _password = value!;
                    // },
                  ),
                  SizedBox(height: 5),
                  Text("Re-enter New Passward"),
                  TextFormField(
                    decoration: InputDecoration(
                        // labelText: 'Choose a secure password',
                        border: OutlineInputBorder()),
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _password = value!;
                    },
                  ),
                  const SizedBox(height: 5),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Your passward must contain:'),
                      Row(
                        children: [
                          Checkbox(
                            value: _isChecked,
                            onChanged: (value) {
                              setState(() {
                                _isChecked = value!;
                              });
                            },
                          ),
                          Text("At least 8 characters"),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: _isChecked,
                            onChanged: (value) {
                              setState(() {
                                _isChecked = value!;
                              });
                            },
                          ),
                          Text("A lower case letter"),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: _isChecked,
                            onChanged: (value) {
                              setState(() {
                                _isChecked = value!;
                              });
                            },
                          ),
                          Text("An upper case letter"),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: _isChecked,
                            onChanged: (value) {
                              setState(() {
                                _isChecked = value!;
                              });
                            },
                          ),
                          Text("A special character"),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: _isChecked,
                            onChanged: (value) {
                              setState(() {
                                _isChecked = value!;
                              });
                            },
                          ),
                          Text("A number"),
                        ],
                      ),
                    ],
                  ),
                  ElevatedButton(
                    child: Text('Create account'),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        // Perform login action here
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
