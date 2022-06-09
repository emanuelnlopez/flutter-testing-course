import 'package:flutter/material.dart';
import 'package:testing/home_screen.dart';
import 'package:testing/validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _key,
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(hintText: 'Enter email'),
                key: const ValueKey('email'),
                validator: (value) => Validator.validateEmail(value ?? ''),
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(hintText: 'Enter password'),
                key: const ValueKey('pass'),
                obscureText: true,
                validator: (value) => Validator.validatePassword(value ?? ''),
              ),
              const SizedBox(
                height: 32.0,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_key.currentState?.validate() == true) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  }
                },
                child: const Text('Attempt login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
