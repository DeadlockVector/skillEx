import 'package:flutter/material.dart';
import 'package:flutter_multiselect/flutter_multiselect.dart';
import 'package:skillex/HOME!!/homepage.dart';

// for authentication, validation of entered fields
import 'package:skillex/helper/firebase_auth.dart';
import 'package:skillex/helper/helper_functions.dart';
import 'package:skillex/helper/validator.dart';
import 'package:skillex/widgets/widgets.dart';

class StudentProfileScreen extends StatefulWidget {
  String userName = '';
  StudentProfileScreen({Key? key, required this.userName}) : super(key: key);

  @override
  _StudentProfileScreenState createState() => _StudentProfileScreenState();
}

class _StudentProfileScreenState extends State<StudentProfileScreen> {
  final formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String university = '';
  String city = '';
  String branch = '';
  String semesters = '';

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(color: Colors.black),
          )
        : Scaffold(
            appBar: AppBar(
              title: const Text('Student Details'),
              backgroundColor: Colors.black,
              centerTitle: true,
            ),
            body: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset("assets/skill.png"),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Welcome, " + widget.userName,
                        style: const TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: textInputDecoration.copyWith(
                            labelText: 'University',
                            prefixIcon: const Icon(
                              Icons.school_outlined,
                              color: Colors.black,
                            )),
                        onChanged: (val) {
                          setState(() {
                            university = val;
                          });
                        },
                        validator: (val) {
                          if (val!.isNotEmpty) {
                            return null;
                          } else {
                            return 'Please enter your Location';
                          }
                        },
                      ),

                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: textInputDecoration.copyWith(
                            labelText: 'City',
                            prefixIcon: const Icon(
                              Icons.location_city_outlined,
                              color: Colors.black,
                            )),
                        onChanged: (val) {
                          setState(() {
                            city = val;
                          });
                        },
                        validator: (val) {
                          if (val!.isNotEmpty) {
                            return null;
                          } else {
                            return 'Please enter your Location';
                          }
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: textInputDecoration.copyWith(
                            labelText: 'Branch of Study',
                            prefixIcon: const Icon(
                              Icons.assignment_ind_outlined,
                              color: Colors.black,
                            )),
                        onChanged: (val) {
                          setState(() {
                            branch = val;
                          });
                        },
                        validator: (val) {
                          if (val!.isNotEmpty) {
                            return null;
                          } else {
                            return 'Please enter your branch of study';
                          }
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: textInputDecoration.copyWith(
                            labelText: 'Semester',
                            prefixIcon: const Icon(
                              Icons.schedule_outlined,
                              color: Colors.black,
                            )),
                        onChanged: (val) {
                          setState(() {
                            semesters = val;
                          });
                        },
                        validator: (val) {
                          if (val!.isNotEmpty) {
                            return null;
                          } else {
                            return 'Enter your semester';
                          }
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
                            "Submit",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          onPressed: () {
                            goAhead();
                          },
                        ),
                      )
                    ],
                  )),
            )),
          );
  }

  goAhead() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      await HelperFunctions.userUniversityName(university);
      await HelperFunctions.userCityName(city);
      await HelperFunctions.userBranchName(branch);
      await HelperFunctions.userCurrentSem(semesters);
      nextScreenReplace(context, Homepage(userName: widget.userName));
    }
  }
}
