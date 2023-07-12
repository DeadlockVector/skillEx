import 'package:flutter/material.dart';

// for authentication, validation of entered fields
import 'package:skillex/helper/firebase_auth.dart';
import 'package:skillex/helper/validator.dart';

class StudentProfileScreen extends StatefulWidget {
  const StudentProfileScreen({super.key});

  @override
  _StudentProfileScreenState createState() => _StudentProfileScreenState();
}

class _StudentProfileScreenState extends State<StudentProfileScreen> {
  final _registerFormKey = GlobalKey<FormState>();

  // add profile links (github, insta, etc?)
  // add skills
  final _universityTextController = TextEditingController();
  final _locationTextController = TextEditingController();
  final _branchTextController = TextEditingController();
  final _semesterTextController = TextEditingController();

  final _focusUniversity = FocusNode();
  final _focusLocation = FocusNode();
  final _focusBranch = FocusNode();
  final _focusSemester = FocusNode();

  //bool _isProcession = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusUniversity.unfocus();
        _focusLocation.unfocus();
        _focusBranch.unfocus();
        _focusSemester.unfocus();
      },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: const Text('Profile Information'),
          ),
          body: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Form(
                      key: _registerFormKey,
                      child: Column(
                        children: <Widget>[
                          const Icon(Icons.school_sharp, size: 175),
                          const SizedBox(height: 12.0),
                          TextFormField(
                            controller: _universityTextController,
                            focusNode: _focusUniversity,
                            decoration: InputDecoration(
                              icon: const Icon(
                                Icons.school_outlined,
                                color: Colors.black,
                              ),
                              hintText: "University",
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
                            controller: _locationTextController,
                            focusNode: _focusLocation,
                            decoration: InputDecoration(
                              icon: const Icon(
                                Icons.map_rounded,
                                color: Colors.black,
                              ),
                              hintText: "City",
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
                            controller: _branchTextController,
                            focusNode: _focusBranch,
                            decoration: InputDecoration(
                              icon: const Icon(
                                Icons.book_online_rounded,
                                color: Colors.black,
                              ),
                              hintText: "Branch of Study",
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
                            controller: _semesterTextController,
                            focusNode: _focusSemester,
                            decoration: InputDecoration(
                              icon: const Icon(
                                Icons.bookmark_add,
                                color: Colors.black,
                              ),
                              hintText: "Semester in Uni",
                              errorBorder: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(6.0),
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 60.0),
                        ],
                      ),
                    ),
                  ],
                ),
              ))),
    );
  }
}
