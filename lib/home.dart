import 'package:flutter/material.dart';
import 'package:flutter_firebase_backend/loginScreen.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:flutter_firebase_backend/auth.dart';

class MyHomePage extends StatefulWidget {
  final String wid;
  const MyHomePage({super.key, required this.wid});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? email;
  late AuthFireBase auth;

  @override
  void initState() {
    auth = AuthFireBase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
          icon: const Icon(Icons.logout_sharp),
          tooltip: 'Logout',
          onPressed: () {
            _handleSignOut();
          },
        ),
      ]),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome $email"),
            Text("ID ${widget.wid}"),
          ],
        ),
      ),
    );
  }
  Future<void> _handleSignOut() async {
    try {
      await auth.signOut();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
    } catch (error) {
      print("Error signing out: $error");
      // Handle error jika terjadi kesalahan saat Sign Out
    }
  }
}