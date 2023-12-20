import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:space_museum/controllers/auth.dart';
import 'package:space_museum/views/components/auth_textfield.dart';
import 'package:space_museum/views/pages/signin_page.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  String? forgotPasswordError = '';

  Future<void> recoverPassword() async {
    setState(() {
      forgotPasswordError = '';
    });
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
      await Auth().resetPassword(email: _emailController.text);
    } on FirebaseAuthException catch (error) {
      setState(() {
        forgotPasswordError = error.message;
      });
    } finally {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();
    }
    if (forgotPasswordError == '') {
      // ignore: use_build_context_synchronously
      showDialog(
          context: context,
          builder: (context) {
            return Center(
              child: SizedBox(
                width: 300,
                height: 200,
                child: Card(
                    child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Text('Check your email inbox',
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center),
                      const SizedBox(
                        height: 20,
                      ),
                      FilledButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Ok'))
                    ],
                  ),
                )),
              ),
            );
          });
    }
  }

  Widget errorMessage() {
    return Text(
      forgotPasswordError != '' ? '$forgotPasswordError' : '',
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Reset your password',
              style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w900),
            ),
            AuthTextfield(
              controller: _emailController,
              placeholder: 'Email address',
              top: 50,
            ),
            errorMessage(),
            const SizedBox(height: 10),
            FilledButton(
                onPressed: recoverPassword, child: const Text('Send email')),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const SigninPage()));
                },
                child: const Text('Back to login'))
          ],
        ),
      ),
    );
  }
}
