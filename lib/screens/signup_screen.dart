import 'package:flutter/material.dart';

// for authentication and validation of entered fields
import 'package:firebase_auth/firebase_auth.dart';
import 'package:skillex/helper/firebase_auth.dart';
import 'package:skillex/helper/validator.dart';

// to navigate to student/working profile creation
import 'package:skillex/screens/student_profile_screen.dart';
import 'package:skillex/screens/working_profile_screen.dart';

// used to go to home screen, not in use anymore (for now)
//import 'package:skillex/HOME!!/homepage.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _registerFormKey = GlobalKey<FormState>();

  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _nameTextController = TextEditingController();
  final _lifePhaseTextController = TextEditingController();
  final _ageTextController = TextEditingController();
  final _phoneNumberTextController = TextEditingController();

  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();
  final _focusName = FocusNode();
  final _focuslifePhase = FocusNode();
  final _focusAge = FocusNode();
  final _focusPhoneNum = FocusNode();

  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusEmail.unfocus();
        _focusPassword.unfocus();
        _focusName.unfocus();
        _focuslifePhase.unfocus();
        _focusAge.unfocus();
        _focusPhoneNum.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          title: const Text('Create Account'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Form(
                    key: _registerFormKey,
                    child: Column(
                      children: <Widget>[
                        const Icon(Icons.person_pin_circle_rounded, size: 175),
                        const SizedBox(height: 12.0),
                        // name of the user
                        TextFormField(
                          controller: _nameTextController,
                          focusNode: _focusName,
                          decoration: InputDecoration(
                            icon: const Icon(
                              Icons.person,
                              color: Colors.black,
                            ),
                            hintText: "Name",
                            errorBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(6.0),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12.0),
        
                        // age of the user
                        TextFormField(
                          controller: _ageTextController,
                          focusNode: _focusAge,
                          decoration: InputDecoration(
                            icon: const Icon(
                              Icons.calendar_month,
                              color: Colors.black,
                            ),
                            hintText: "Age",
                            errorBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(6.0),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12.0),
        
                        // phone number of the user
                        TextFormField(
                          controller: _phoneNumberTextController,
                          focusNode: _focusPhoneNum,
                          decoration: InputDecoration(
                            icon: const Icon(Icons.phone_android,
                                color: Colors.black),
                            hintText: "Phone number",
                            errorBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(6.0),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12.0),
        
                        TextFormField(
                          controller: _emailTextController,
                          focusNode: _focusEmail,
                          validator: (value) => Validator.validateEmail(
                            email: value,
                          ),
                          decoration: InputDecoration(
                            icon: const Icon(
                              Icons.email,
                              color: Colors.black,
                            ),
                            hintText: "Email",
                            errorBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(6.0),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12.0),
                        TextFormField(
                          controller: _passwordTextController,
                          focusNode: _focusPassword,
                          obscureText: true,
                          validator: (value) => Validator.validatePassword(
                            password: value,
                          ),
                          decoration: InputDecoration(
                            icon: const Icon(
                              Icons.remove_red_eye,
                              color: Colors.black,
                            ),
                            hintText: "Password",
                            errorBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(6.0),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12.0),
                        TextFormField(
                          controller: _lifePhaseTextController,
                          focusNode: _focuslifePhase,
                          validator: (value) => Validator.validatelifePhase(
                            lifePhase: value,
                          ),
                          decoration: InputDecoration(
                            icon: const Icon(
                              Icons.school_sharp,
                              color: Colors.black,
                            ),
                            hintText: "Student/Working",
                            errorBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(6.0),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 60.0),
        
                        _isProcessing
                            ? const CircularProgressIndicator()
                            : Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        setState(() {
                                          _isProcessing = true;
                                        });
        
                                        if (_registerFormKey.currentState!
                                            .validate()) {
                                          User? user = await FirebaseAuthHelper
                                              .registerUsingEmailPassword(
                                            email:
                                                _emailTextController.text.trim(),
                                            password: _passwordTextController.text
                                                .trim(),
                                            name: _nameTextController.text.trim(),
                                            lifePhase: _lifePhaseTextController
                                                .text
                                                .trim(),
                                            age: int.parse(
                                                _ageTextController.text.trim()),
                                            phoneNumber: int.parse(
                                                _phoneNumberTextController.text
                                                    .trim()),
                                          );
        
                                          setState(() {
                                            _isProcessing = false;
                                          });
        
                                          if (user != null) {
                                            if (_lifePhaseTextController.text
                                                    .toLowerCase() ==
                                                "student") {
                                              print(_lifePhaseTextController.text
                                                  .toLowerCase());
                                              Navigator.of(context)
                                                  .pushAndRemoveUntil(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      StudentProfileScreen(),
                                                ),
                                                ModalRoute.withName('/'),
                                              );
                                            } else if (_lifePhaseTextController
                                                    .text
                                                    .toLowerCase() ==
                                                "working") {
                                              print(_lifePhaseTextController.text
                                                  .toLowerCase());
                                              Navigator.of(context)
                                                  .pushAndRemoveUntil(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      WorkingProfileScreen(),
                                                ),
                                                ModalRoute.withName('/'),
                                              );
                                            }
        
                                            // to revert back, remove everything under the nested if, including the nested if
                                            /*
                                            Navigator.of(context)
                                                .pushAndRemoveUntil(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    HomeScreen(user: user),
                                              ),
                                              ModalRoute.withName('/'),
                                            );
                                            */
                                          }
                                        } else {
                                          setState(() {
                                            _isProcessing = false;
                                          });
                                        }
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                const Color.fromARGB(
                                                    255, 0, 0, 0)),
                                      ),
                                      child: const Text(
                                        'Sign up',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
