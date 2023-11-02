import 'package:flutter/material.dart';
import 'package:flutter_firebase_backend/auth.dart';
import 'package:flutter_firebase_backend/home.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late AuthFireBase auth;

  @override
  void initState() {
    auth = AuthFireBase();
    auth.getUser().then((value){
      MaterialPageRoute route;
      if (value != null) {
        route = MaterialPageRoute(builder: (context) => MyHomePage(wid: value.uid));
        Navigator.pushReplacement(context, route);
      }
    }).catchError((err) => print(err));
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      onLogin: _loginUser,
      onRecoverPassword: _recoverPassword,
      onSignup: _onSignup,
      passwordValidator: (value) {
        if (value != null) {
          if(value.length < 6) {
            return "Password Must Be 6 Characters";
          }
        }
      },
      loginProviders: <LoginProvider>[
        LoginProvider(
          icon: FontAwesomeIcons.google,
          label: 'Google',
          callback: _onLoginGoogle,
        ),
      ],
      onSubmitAnimationCompleted: () {
        auth.getUser().then((value) {
          MaterialPageRoute route;
          if (value != null) {
            route =
                MaterialPageRoute(builder: (context) => MyHomePage(wid: value.uid));
          } else {
            route = MaterialPageRoute(builder: (context) => LoginScreen());
          }
          Navigator.pushReplacement(context, route);
        }).catchError((err) => print(err));
      },
    );
  }

  Future<String?> _loginUser(LoginData data) {
    return auth.login(data.name, data.password).then((value) {
      if(value != null) {
        MaterialPageRoute(builder: (context) => MyHomePage(wid: value));
      } else {
        final snackBar = SnackBar(
          content: const Text("Login Failed, User Not Found"),
          action: SnackBarAction(
            label: "OK",
            onPressed: () {
              
            },
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginScreen()));
      }
    });
  }

  Future <String>? _recoverPassword(String name) {
    return null;
  }

  Future<String?>? _onSignup(SignupData data) {
    return auth.signUp(data.name!, data.password!).then((value) {
      if (value != null) {
        final snackBar = SnackBar(
          content: const Text("Sign Up Successful"),
          action: SnackBarAction(
            label: "OK",
            onPressed: (){},
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
  }

  Future<String?>? _onLoginGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        return 'Google login canceled';
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential authResult = await FirebaseAuth.instance.signInWithCredential(credential);
      final User? user = authResult.user;

      if (user != null) {
        return user.uid;
      } else {
        return 'Google login failed';
      }
    } catch (e) {
      print('Google login error: $e');
      return 'Google login error';
    }
  }
}