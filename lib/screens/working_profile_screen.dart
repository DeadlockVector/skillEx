// use chool sharp icon
import 'package:flutter/material.dart';
import 'package:skillex/widgets/widgets.dart';

import 'package:skillex/helper/firebase_auth.dart';
import 'package:skillex/helper/helper_functions.dart';

import 'package:skillex/HOME!!/homepage.dart';

class WorkingProfileScreen extends StatefulWidget {
  String userName = '';
  WorkingProfileScreen({Key? key, required this.userName}) : super(key: key);

  @override
  State<WorkingProfileScreen> createState() => _WorkingProfileScreenState();
}

class _WorkingProfileScreenState extends State<WorkingProfileScreen> {
  final formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  String organisation = '';
  String city = '';
  String designation = '';
  String experience = '';
  // add profile links (github, insta, etc?)
  // add skills

  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return _isLoading 
        ? const Center (
          child: CircularProgressIndicator(color: Colors.black,),
        )
      : Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: const Text('Professional Details'),
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
                      Icon(Icons.access_alarm),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Welcome, ${widget.userName}",
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: textInputDecoration.copyWith(
                            labelText: 'Organisation',
                            prefixIcon: const Icon(
                              Icons.laptop,
                              color: Colors.black,
                            )),
                        onChanged: (val) {
                          setState(() {
                            organisation = val;
                          });
                        },
                        validator: (val) {
                          if (val!.isNotEmpty) {
                            return null;
                          } else {
                            return 'Please enter your University!';
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
                            labelText: 'Desgination @Organisation',
                            prefixIcon: const Icon(
                              Icons.assignment_ind_outlined,
                              color: Colors.black,
                            )),
                        onChanged: (val) {
                          setState(() {
                            designation = val;
                          });
                        },
                        validator: (val) {
                          if (val!.isNotEmpty) {
                            return null;
                          } else {
                            return 'Please enter your designation';
                          }
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: textInputDecoration.copyWith(
                            labelText: 'Years of Experience',
                            prefixIcon: const Icon(
                              Icons.schedule_outlined,
                              color: Colors.black,
                            )),
                        onChanged: (val) {
                          setState(() {
                            experience = val;
                          });
                        },
                        validator: (val) {
                          if (val!.isNotEmpty) {
                            return null;
                          } else {
                            return 'Enter your years of experience';
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
                      ),
                    ]
                  ),
                ),
              ),
            )
          );
  }


// define the authservide in firebase_auth.dart for working professionals
goAhead() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      await authService.addUserSecondaryInfoWorking(organisation, city, designation, experience);

      await HelperFunctions.userOrganisationName(organisation);
      await HelperFunctions.userCityName(city);
      await HelperFunctions.userDesignationName(designation);
      await HelperFunctions.userExperienceYears(experience);
      
      nextScreenReplace(context, Homepage(userName: widget.userName));
      
      /*
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: ((context) => Homepage(userName: widget.userName)
        )
      ));
      */
    }
  }
}
