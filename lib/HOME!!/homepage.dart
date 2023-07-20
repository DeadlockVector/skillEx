import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:skillex/helper/helper_functions.dart';
import 'package:skillex/screens/profile_page.dart';

import 'package:skillex/widgets/largeText.dart';
import 'package:skillex/widgets/smallText.dart';

import 'package:skillex/screens/login_screen.dart';
import 'package:skillex/HOME!!/skillDisplay.dart';
import 'package:skillex/widgets/widgets.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String userName="Name";


  @override
  // void initState() {
  //   super.initState();
  //   gettingUserData();
  // }

  //   gettingUserData() async {
  //   await HelperFunctions.getUserNameFromSF().then((val) {
  //     setState(() {
  //       userName = val!;
  //     });
  //   });
  // }

  Widget build(BuildContext context) {
    //print("current height of the screen is: "+MediaQuery.of(context).size.height.toString());
    return Scaffold(
      appBar: AppBar(
        title: const Text("HOME"),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical:50),
          children: <Widget> [
            const Icon(
              Icons.account_circle_sharp,
              size: 150,
              color:Colors.white,
            ),
            const SizedBox(
              height: 30,
            ),
            const Divider(
              height: 2,
            ),
            ListTile(
              onTap: () {
                nextScreen(context,const MyProfile());
              },
              contentPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              leading: const Icon(Icons.account_circle_outlined,color: Colors.white,),
              title: const Text(
                "Profile",
                style: TextStyle(color:Colors.white),
              ),
            )
          ],

        ),
      
      ),
      body: Column(
        children: [
          //displays the header
          Container(
            margin: EdgeInsets.only(top: 15, bottom: 20),
            padding: EdgeInsets.only(right: 15, left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Largetext(
                      text: userName,
                    ),
                    Row(
                      children: [
                        Smalltext(
                          text: "Skills: ",
                        ),
                        const Icon(
                          Icons.add,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Smalltext(
                          text: "To learn: ",
                        ),
                        const Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                      ],
                    )
                  ],
                ),
                Center(
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black,
                    ),
                    child: const Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          //shows the body of the app.
          Expanded(
              child: SingleChildScrollView(
            child: Skilldsip(),
          )),
        ],
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  final User user;

  const HomeScreen({required this.user});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late User _currentUser;

  @override
  void initState() {
    _currentUser = widget.user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          final logout = await showDialog<bool>(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: new Text('Are you sure?'),
                content: new Text('Do you want to logout from this App'),
                actionsAlignment: MainAxisAlignment.spaceBetween,
                actions: [
                  TextButton(
                    onPressed: () {
                      Logout();
                    },
                    child: const Text('Yes'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    child: const Text('No'),
                  ),
                ],
              );
            },
          );
          return logout!;
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'EMAIL: ${_currentUser.email}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();

                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                child: const Text('Sign out'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> Logout() async {
    await FirebaseAuth.instance.signOut();

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
  }
}

/*
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:skillex/widgets/largeText.dart';
import 'package:skillex/widgets/smallText.dart';

import 'package:skillex/screens/login_screen.dart';
import 'package:skillex/helper/firebase_auth.dart';
import 'package:skillex/HOME!!/skillDisplay.dart';
*/

