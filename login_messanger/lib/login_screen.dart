// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:login_messanger/splash_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

enum AuthMode { SignUp, Login }

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AuthMode _authMode = AuthMode.Login;

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool passwordVisible = true;
  bool confPasswordVisible = true;
  final Map<String, String> _authData = {'email': '', 'password': ''};
  final List<Map<String, String>> _authSignUp = [
    {'email': 'zainabhamdy24@gmail.com', 'password': '123456789'}
  ];
  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.SignUp;
      });
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
    }
    setState(() {
      passwordVisible = true;
      confPasswordVisible = true;
      emailController.text = '';
      passwordController.text = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _authMode == AuthMode.Login ? 'Login' : 'Sign Up',
                    style: const TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: 'Email Address',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (!value!.contains('@') || value.isEmpty) {
                        return 'Email is incorrect!';
                      } else if (_authMode == AuthMode.SignUp) {
                        for (var element in _authSignUp) {
                          if ((element['email'] == emailController.text) &&
                              (element['password'] ==
                                  passwordController.text)) {
                            return 'this email is already exist!';
                          }
                        }
                      }
                      return null;
                    },
                    onSaved: (newValue) => _authData['email'] = newValue!,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: passwordVisible,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            passwordVisible = !passwordVisible;
                          });
                        },
                      ),
                      labelText: 'Password',
                      border: const OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (_authMode == AuthMode.Login) {
                        for (final element in _authSignUp) {
                          if ((element['email'] == emailController.text) &&
                              (element['password'] ==
                                  passwordController.text)) {
                            return null;
                          }
                        }
                        return 'May Email or Password is incorrect!';
                      } else if (_authMode == AuthMode.SignUp) {
                        if (value!.isEmpty || value.length <= 6) {
                          return 'Password length must be more than 6!';
                        }
                      }
                      return null;
                    },
                    onSaved: (newValue) => _authData['password'] = newValue!,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  if (_authMode == AuthMode.SignUp)
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: confPasswordVisible,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(
                            confPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              confPasswordVisible = !confPasswordVisible;
                            });
                          },
                        ),
                        labelText: 'Confirm Password',
                        border: const OutlineInputBorder(),
                      ),
                      validator: (value) {
                        print(value);
                        print(passwordController.text);
                        if (value != passwordController.text) {
                          return 'Confirm Password is incorrect, Please try again!';
                        }
                        return null;
                      },
                    ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.blue,
                    child: MaterialButton(
                      onPressed: _submit,
                      child: Text(
                        _authMode == AuthMode.Login ? 'Login' : 'Sign Up',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(_authMode == AuthMode.Login
                          ? 'Don\'t have an account ?'
                          : ''),
                      TextButton(
                        onPressed: () => _switchAuthMode(),
                        child: Text(_authMode == AuthMode.Login
                            ? 'Register Now'
                            : 'Login'),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    if (_authMode == AuthMode.SignUp) {
      _formKey.currentState!.save();
      _authSignUp.add(_authData);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SplashScreen()),
      );
    } else if (_authMode == AuthMode.Login) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SplashScreen()),
      );
    }
  }
}
