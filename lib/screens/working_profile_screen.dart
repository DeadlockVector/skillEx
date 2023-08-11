// use chool sharp icon
import 'package:flutter/material.dart';

class WorkingProfileScreen extends StatefulWidget {
  String userName = '';
  WorkingProfileScreen({super.key, required this.userName});

  @override
  _WorkingProfileScreenState createState() => _WorkingProfileScreenState();
}

class _WorkingProfileScreenState extends State<WorkingProfileScreen> {
  final _registerFormKey = GlobalKey<FormState>();

  // add profile links (github, insta, etc?)
  // add skills
  final _organisationTextController = TextEditingController();
  final _locationTextController = TextEditingController();
  final _designationTextController = TextEditingController();
  final _experienceTextController = TextEditingController();

  final _focusOrganisation = FocusNode();
  final _focusLocation = FocusNode();
  final _focusDesignation = FocusNode();
  final _focusExperience = FocusNode();

  //bool _isProcession = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusOrganisation.unfocus();
        _focusLocation.unfocus();
        _focusDesignation.unfocus();
        _focusExperience.unfocus();
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
                          const Icon(Icons.laptop_chromebook_rounded,
                              size: 175),
                          const SizedBox(height: 24.0),
                          TextFormField(
                            controller: _organisationTextController,
                            focusNode: _focusOrganisation,
                            decoration: InputDecoration(
                              icon: const Icon(
                                Icons.logo_dev_rounded,
                                color: Colors.black,
                              ),
                              hintText: "Organisation",
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
                            controller: _designationTextController,
                            focusNode: _focusDesignation,
                            decoration: InputDecoration(
                              icon: const Icon(
                                Icons.book_online_rounded,
                                color: Colors.black,
                              ),
                              hintText: "Designation",
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
                            controller: _experienceTextController,
                            focusNode: _focusExperience,
                            decoration: InputDecoration(
                              icon: const Icon(
                                Icons.bookmark_add,
                                color: Colors.black,
                              ),
                              hintText: "Years of Experience",
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
