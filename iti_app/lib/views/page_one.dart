import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'navbar/nav_bar_page.dart';

class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Hello ITI'),
          centerTitle: true,
        ),
        body: Form(
          key: _formKey,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                children: [
                  const FlutterLogo(
                    size: 150,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (!value!.contains('@')) return 'invalid email';
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                    ),
                    onChanged: (value) => email = value,
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    validator: (value) {
                      if (value!.length < 7) return 'invalid password';
                    },
                    obscureText: isVisible,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isVisible = !isVisible;
                              });
                            },
                            icon: isVisible
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off))),
                    onChanged: (value) => password = value,
                  ),
                  const SizedBox(height: 5),
                  // TextFormField(
                  //   validator: (value) {
                  //     if (value!.isEmpty) return 'invalid phone';
                  //   },
                  //   keyboardType: TextInputType.phone,
                  //   decoration: const InputDecoration(
                  //     labelText: 'Phone',
                  //     prefixIcon: Icon(Icons.phone),
                  //   ),
                  // ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(elevation: 10),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          try {
                            final credential = await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: email, password: password);
                            if (credential != null) {
                              // ignore: use_build_context_synchronously
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const NavBarPage(),
                                ),
                              );
                            }
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              print('No user found for that email.');
                            } else if (e.code == 'wrong-password') {
                              print('Wrong password provided for that user.');
                            }
                            SnackBar snackBar = const SnackBar(
                                content:
                                    Text('The email or password is invalid'));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        }
                        final prefs = await SharedPreferences.getInstance();
                        await prefs.setString('email', email);
                      },
                      child: const Text('Log in')),
                  const SizedBox(height: 5),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot password?No yawa. Tap me',
                        style: TextStyle(color: Colors.black),
                      )),
                  const SizedBox(height: 25),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey, elevation: 10),
                      onPressed: () {},
                      child: const Text(
                        'No Account?Sign Up',
                        style: TextStyle(color: Colors.black),
                      )),
                ],
              ),
            ),
          ),
        ));
  }
}
