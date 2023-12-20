import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:space_museum/controllers/auth.dart';
import 'package:space_museum/views/pages/signup_page.dart';
import 'package:space_museum/views/pages/forgot_password_page.dart';
import 'package:space_museum/views/components/auth_textfield.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? signInError = '';

  Future<void> signInWithEmailAndPassword() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
      await Auth().signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
    } on FirebaseAuthException catch (error) {
      setState(() {
        signInError = error.message;
      });
    } finally {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();
    }
  }

  Widget errorMessage() {
    return Text(
      signInError != '' ? '$signInError' : '',
      style: const TextStyle(color: Color(0xFFF5425A)),
      textAlign: TextAlign.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 100.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Log in to an account',
              style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w900),
            ),
            AuthTextfield(
              controller: _emailController,
              placeholder: 'Email address',
              top: 50,
              bottom: 20,
            ),
            AuthTextfield(
              controller: _passwordController,
              placeholder: 'Password',
              isPassword: true,
              bottom: 10,
            ),
            errorMessage(),
            TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const ForgotPasswordPage()));
                },
                child: const Text('Forgot your password?')),
            const Padding(padding: EdgeInsets.only(bottom: 30)),
            FilledButton(
                onPressed: signInWithEmailAndPassword,
                child: const Text('Sign in')),
            const Padding(
              padding: EdgeInsets.only(top: 10),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const SignupPage()));
                },
                child: const Text('Don\'t have an account?')),
          ],
        ),
      ),
    );
  }
}
