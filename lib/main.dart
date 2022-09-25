// ignore_for_file: deprecated_member_use, unused_import, prefer_const_constructors, equal_keys_in_map

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:less_chat/auth/login_page.dart';
import 'package:less_chat/helper/helper_function.dart';
import 'package:less_chat/models/message_model.dart';
import 'package:less_chat/models/user_model.dart';
import 'package:less_chat/screens/chat_screen.dart';
import 'package:less_chat/screens/home_screen.dart';
import 'package:less_chat/widgets/contacts_list.dart';
// import 'package:less_chat/widgets/menu_screen.dart';
import 'package:less_chat/widgets/search_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isSignedIN = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserLoggedInStatus();
  }

  getUserLoggedInStatus() async {
    await HelperFunctions.getUserLoggedInStatus().then((value) {
      if (value != null) {
        _isSignedIN = value;
        setState(() {
          _isSignedIN = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Less_Chat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: const Color(0xFFFEF9EB),
      ),
      home: _isSignedIN ? HomeScreen() : LoginPage(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/contactlist': (context) => ContactsList(),
        // '/menuscreen': (context) => Menu_Screen()
      },
    );
  }
}
