import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wineapp/connectivity/connectivity_bloc.dart';
import 'package:wineapp/connectivity/connectivity_state.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _obscurePassword = true;
  bool _isConnected = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ConnectivityBloc, ConnectivityState>(
      listener: (context, state) {
        if (state is ConnectivityOffline) {
          setState(() {
            _isConnected = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("No internet connection"),
              backgroundColor: Colors.red,
              duration: Duration(seconds: 3),
            ),
          );
        } else if (state is ConnectivityOnline) {
          setState(() {
            _isConnected = true;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Back online"),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 2),
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF0D1B1E), // Dark background
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  'Sign in',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 40),
                const Text(
                  'Email',
                  style: TextStyle(color: Color(0xFFFFC107)), // Mustard Yellow
                ),
                TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: 'email@email.com',
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFFFC107)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFFFC107)),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Password',
                  style: TextStyle(color: Color(0xFFFFC107)),
                ),
                TextField(
                  obscureText: _obscurePassword,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Color(0xFFFFC107),
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFFFC107)),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFFFC107)),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFC107),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      _isConnected
                          ? Navigator.pushReplacementNamed(context, '/home')
                          : {
                            ScaffoldMessenger.of(
                              context,
                            ).removeCurrentSnackBar(),
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("No internet connection"),
                                backgroundColor: Colors.red,
                                duration: Duration(seconds: 3),
                              ),
                            ),
                          };
                    },
                    child: const Text(
                      'Continue',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Can’t sign in?",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Recover password",
                      style: TextStyle(
                        color: Color(0xFFFFC107),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
