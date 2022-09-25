// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:less_chat/auth/login_page.dart';
import 'package:less_chat/auth/profile_page.dart';
import 'package:less_chat/services/auth_services.dart';
import 'package:less_chat/widgets/category_selector.dart';
import 'package:less_chat/widgets/favourite_contacts.dart';
import 'package:less_chat/widgets/login_Field.dart';
import 'package:less_chat/widgets/search_list.dart';

import '../helper/helper_function.dart';
import '../widgets/recent_chats.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String userName = "";
  String email = "";
  AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    gettingUserData();
  }

  gettingUserData() async {
    await HelperFunctions.getUserEmailFromSF().then((value) {
      setState(() {
        email = value!;
      });
    });
    await HelperFunctions.getUserNameFromSF().then((val) {
      setState(() {
        userName = val!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
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
            userName,
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
            onTap: () {},
            selectedColor: Theme.of(context).primaryColor,
            selected: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            leading: Icon(
              Icons.group,
              color: Color.fromARGB(255, 255, 65, 116),
            ),
            title: const Text(
              "Chats",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              nextScreenReplace(
                  context,
                  ProfilePage(
                    userName: userName,
                    email: email,
                  ));
            },
            selectedColor: Theme.of(context).primaryColor,
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            leading: Icon(
              Icons.account_circle,
              color: Color.fromARGB(255, 255, 65, 116),
            ),
            title: const Text(
              "Profile",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
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
            leading: Icon(
              Icons.exit_to_app,
              color: Color.fromARGB(255, 255, 65, 116),
            ),
            title: const Text(
              "LOGOUT",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
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
      appBar: AppBar(
        title: const Text(
          'Chats',
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {
              nextScreen(context, SearchList());
            },
          ),
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const AboutDialog(
                  applicationIcon: FlutterLogo(),
                  applicationLegalese: 'Legalese',
                  applicationName: 'LessChat',
                  applicationVersion: 'version 1.0.0',
                  children: [
                    Text('About LessChat'),
                  ],
                ),
              );
            },
          )
          // IconButton(
          // icon: const Icon(Icons.logout),
          // onPressed: () {
          // authService.signOut();
          // },
          // ),
        ],
      ),
      body: Column(
        children: <Widget>[
          CategorySelector(),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Favourite_contacts(),
                  RecentChats(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MySearchDelegate extends SearchDelegate {
  List<String> searchResults = [
    'James',
    'Olivia',
    'John',
    'Sophia',
    'Steven',
    'Gerg',
  ];
  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => close(context, null),
      );
  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
        ),
      ];
  @override
  Widget buildResults(BuildContext context) => Center(
        child: Text(
          query,
          style: const TextStyle(fontSize: 30.0),
        ),
      );
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = searchResults.where((searchResult) {
      final result = searchResult.toLowerCase();
      final input = query.toLowerCase();

      return result.contains(input);
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];

        return ListTile(
          title: Text(suggestion),
          onTap: () {
            query = suggestion;

            showResults(context);
          },
        );
      },
    );
  }
}
