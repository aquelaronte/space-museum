import 'package:flutter/material.dart';
import 'package:space_museum/views/components/auth_textfield.dart';
import 'package:space_museum/views/pages/signin_page.dart';
import 'package:space_museum/controllers/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? signUpError = '';

  Future<void> signUpWithEmailAndPassword() async {
    setState(() {
      signUpError = '';
    });
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
      await Auth().signUpWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
    } on FirebaseAuthException catch (error) {
      setState(() {
        signUpError = error.message;
      });
    } finally {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();
    }
    if (signUpError == '') {
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
                      const Text('Account was created successfully',
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
      signUpError != '' ? '$signUpError' : '',
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
              'Create an account',
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
            FilledButton(
                onPressed: signUpWithEmailAndPassword,
                child: const Text('Sign up')),
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
                child: const Text('Have already an account?'))
          ],
        ),
      ),
    );
  }
}
