// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:skillex/HOME!!/homepage.dart';
// import 'package:skillex/screens/signup_screen.dart';

// import '../helper/firebase_auth.dart';
// import '../helper/validator.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final _formKey = GlobalKey<FormState>();

//   final _emailTextController = TextEditingController();
//   final _passwordTextController = TextEditingController();

//   final _focusEmail = FocusNode();
//   final _focusPassword = FocusNode();

//   bool _isProcessing = false;

//   Future<FirebaseApp> _initializeFirebase() async {
//     FirebaseApp firebaseApp = await Firebase.initializeApp();

//     User? user = FirebaseAuth.instance.currentUser;

//     if (user != null) {
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(
//           builder: (context) => HomeScreen(
//             user: user,
//           ),
//         ),
//       );
//     }

//     return firebaseApp;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         _focusEmail.unfocus();
//         _focusPassword.unfocus();
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: const Color.fromARGB(255, 0, 0, 0),
//           title: const Text('Skill-Ex'),
//         ),
//         body: SingleChildScrollView(
//           child: FutureBuilder(
//             future: _initializeFirebase(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.done) {
//                 return Padding(
//                   padding:
//                       const EdgeInsets.only(left: 24.0, right: 24.0, top: 48),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       const Icon(Icons.lock, size: 100),
//                       const Padding(
//                         padding: EdgeInsets.only(bottom: 75.0, top: 42),
//                         child: Text('Locked!',
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 40,
//                             )),
//                       ),
//                       Form(
//                         key: _formKey,
//                         child: Column(
//                           children: <Widget>[
//                             TextFormField(
//                               controller: _emailTextController,
//                               focusNode: _focusEmail,
//                               validator: (value) => Validator.validateEmail(
//                                 email: value,
//                               ),
//                               decoration: InputDecoration(
//                                 icon: const Icon(
//                                   Icons.email_rounded,
//                                   color: Colors.black,
//                                 ),
//                                 hintText: "Email",
//                                 errorBorder: UnderlineInputBorder(
//                                   borderRadius: BorderRadius.circular(6.0),
//                                   borderSide: const BorderSide(
//                                     color: Color.fromARGB(255, 0, 0, 0),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(height: 8.0),
//                             TextFormField(
//                               controller: _passwordTextController,
//                               focusNode: _focusPassword,
//                               obscureText: true,
//                               validator: (value) => Validator.validatePassword(
//                                 password: value,
//                               ),
//                               decoration: InputDecoration(
//                                 icon: const Icon(
//                                   Icons.remove_red_eye_rounded,
//                                   color: Colors.black,
//                                 ),
//                                 hintText: "Password",
//                                 errorBorder: UnderlineInputBorder(
//                                   borderRadius: BorderRadius.circular(6.0),
//                                   borderSide: const BorderSide(
//                                     color: Color.fromARGB(255, 0, 0, 0),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(height: 144.0),
//                             _isProcessing
//                                 ? const CircularProgressIndicator()
//                                 : Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Expanded(
//                                         child: ElevatedButton(
//                                           onPressed: () async {
//                                             _focusEmail.unfocus();
//                                             _focusPassword.unfocus();

//                                             if (_formKey.currentState!
//                                                 .validate()) {
//                                               setState(() {
//                                                 _isProcessing = true;
//                                               });

//                                               User? user =
//                                                   await FirebaseAuthHelper
//                                                       .signInUsingEmailPassword(
//                                                 email: _emailTextController.text,
//                                                 password:
//                                                     _passwordTextController.text,
//                                               );

//                                               setState(() {
//                                                 _isProcessing = false;
//                                               });

//                                               if (user != null) {
//                                                 Navigator.of(context)
//                                                     .pushReplacement(
//                                                   MaterialPageRoute(
//                                                     builder: (context) =>
//                                                         HomeScreen(user: user),
//                                                   ),
//                                                 );
//                                               }
//                                             }
//                                           },
//                                           style: ButtonStyle(
//                                             backgroundColor:
//                                                 MaterialStateProperty.all(
//                                                     const Color.fromARGB(
//                                                         255, 0, 0, 0)),
//                                           ),
//                                           child: const Text(
//                                             'Sign In',
//                                             style: TextStyle(color: Colors.white),
//                                           ),
//                                         ),
//                                       ),
//                                       const SizedBox(width: 24.0),
//                                       Expanded(
//                                         child: ElevatedButton(
//                                           onPressed: () {
//                                             Navigator.of(context).push(
//                                               MaterialPageRoute(
//                                                 builder: (context) =>
//                                                     const SignUpScreen(),
//                                               ),
//                                             );
//                                           },
//                                           style: ButtonStyle(
//                                             backgroundColor:
//                                                 MaterialStateProperty.all(
//                                                     const Color.fromARGB(
//                                                         255, 0, 0, 0)),
//                                           ),
//                                           child: const Text(
//                                             'SignUp',
//                                             style: TextStyle(color: Colors.white),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   )
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 );
//               }

//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:skillex/HOME!!/homepage.dart';
import 'package:skillex/helper/database_services.dart';
import 'package:skillex/helper/firebase_auth.dart';
import 'package:skillex/helper/helper_functions.dart';
import 'package:skillex/screens/signup_screen.dart';
import 'package:skillex/widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  bool _isLoading = false;
  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LOGIN'),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(color: Colors.black),
            )
          : SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
                child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "SKILL-EX",
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Image.asset('assets/skill.png'),
                        const SizedBox(height: 30),
                        TextFormField(
                          decoration: textInputDecoration.copyWith(
                              labelText: "Email",
                              prefixIcon: const Icon(
                                Icons.email,
                                color: Colors.black,
                              )),
                          onChanged: (val) {
                            setState(() {
                              email = val;
                            });
                          },

                          // check tha validation
                          validator: (val) {
                            return RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(val!)
                                ? null
                                : "Please enter a valid email";
                          },
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          obscureText: true,
                          decoration: textInputDecoration.copyWith(
                              labelText: "Password",
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: Colors.black,
                              )),
                          validator: (val) {
                            if (val!.length < 6) {
                              return "Password must be at least 6 characters";
                            } else {
                              return null;
                            }
                          },
                          onChanged: (val) {
                            setState(() {
                              password = val;
                            });
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))),
                            child: const Text(
                              "Sign In",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            onPressed: () {
                              login();
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text.rich(TextSpan(
                          text: "Don't have an account? ",
                          style: const TextStyle(
                              color: Colors.black, fontSize: 14),
                          children: <TextSpan>[
                            TextSpan(
                                text: "Register here",
                                style: const TextStyle(
                                    color: Colors.black,
                                    decoration: TextDecoration.underline),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    nextScreen(context, const RegisterPage());
                                  }),
                          ],
                        )),
                      ],
                    )),
              ),
            ),
    );
  }

  login() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await authService
          .loginWithUserNameandPassword(email, password)
          .then((value) async {
        if (value == true) {
          QuerySnapshot snapshot =
              await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
                  .gettingUserData(email);
          // saving the values to our shared preferences
          await HelperFunctions.saveUserLoggedInStatus(true);
          await HelperFunctions.saveUserEmailSF(email);
          await HelperFunctions.saveUserNameSF(snapshot.docs[0]['fullName']);
          String userName = '';
          await HelperFunctions.getUserNameFromSF().then((val) {
            setState(() {
              userName = val!;
            });
          });
          // ignore: use_build_context_synchronously
          nextScreenReplace(context, Homepage(userName: userName));
        } else {
          showSnackbar(context, Colors.red, value);
          setState(() {
            _isLoading = false;
          });
        }
      });
    }
  }
}
