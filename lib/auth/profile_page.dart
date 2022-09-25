// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:less_chat/screens/home_screen.dart';
import 'package:less_chat/services/auth_services.dart';

import '../widgets/login_Field.dart';
import 'login_page.dart';

class ProfilePage extends StatefulWidget {
  String userName;
  String email;
  ProfilePage({Key? key, required this.email, required this.userName})
      : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        title: Text(
          "Profile",
          style: TextStyle(
            color: Colors.white,
            fontSize: 27,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: Drawer(
          child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 50),
        children: <Widget>[
          // ignore: prefer_const_constructors
          Icon(
            Icons.account_circle,
            size: 150,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            widget.userName,
            textAlign: TextAlign.center,
            // ignore: prefer_const_constructors
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Divider(
            height: 2,
          ),
          ListTile(
            onTap: () {
              nextScreen(context, HomeScreen());
            },
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            leading: Icon(Icons.group),
            title: const Text(
              "Chats",
              style: TextStyle(color: Colors.black),
            ),
          ),
          ListTile(
            onTap: () {},
            selected: true,
            selectedColor: Theme.of(context).primaryColor,
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            leading: Icon(Icons.group),
            title: const Text(
              "Profile",
              style: TextStyle(color: Colors.black),
            ),
          ),
          ListTile(
            onTap: () async {
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Logout"),
                      content: Text("Are you sure You Want to Logout?"),
                      actions: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.cancel,
                            color: Colors.red,
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            await authService.signOut();
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                                (route) => false);
                          },
                          icon: Icon(
                            Icons.done,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    );
                  });
              // authService.signOut().whenComplete(() {
                // nextScreen(context, LoginPage());
              // });
            },
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            leading: Icon(Icons.exit_to_app),
            title: const Text(
              "LOGOUT",
              style: TextStyle(color: Colors.black),
            ),
          ),
          Container(
            color: Colors.white60,
            child: ListTile(
              leading: Icon(Icons.adb),
              iconColor: Color.fromARGB(255, 255, 65, 116),
              title: Text(
                'Report Bug',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
              onTap: () {},
            ),
          ),
          Container(
            color: Colors.white60,
            child: ListTile(
              leading: Icon(Icons.star_half),
              iconColor: Color.fromARGB(255, 255, 65, 116),
              title: Text(
                'Premium Features',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
              onTap: () {},
            ),
          ),
          ExpansionTile(
            leading: Icon(
              Icons.account_circle_outlined,
              size: 50.0,
            ),
            iconColor: Colors.blueAccent,
            title: Text('Karan Gupta'),
            subtitle: Text('Flutter Developer'),
            collapsedBackgroundColor: Color(0xFFFFEFEE),
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              ListTile(
                title: Text('About The Developer'),
                leading: Icon(
                  Icons.person,
                  size: 40.0,
                ),
                iconColor: Colors.redAccent,
                onTap: () {},
              ),
            ],
          ),
        ],
      )),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 170),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Icon(
              Icons.account_circle,
              size: 200,
              color: Colors.grey,
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text(
                  "Full Name",
                  style: TextStyle(fontSize: 17),
                ),
                Text(
                  widget.userName,
                  style: TextStyle(fontSize: 17),
                ),
              ],
            ),
            Divider(
              height: 20,
            ),
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text(
                  "Email",
                  style: TextStyle(fontSize: 17),
                ),
                Text(
                  widget.email,
                  style: TextStyle(fontSize: 17),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
