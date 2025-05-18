import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wineapp/connectivity/connectivity_bloc.dart';
import 'package:wineapp/connectivity/connectivity_state.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
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
        backgroundColor: const Color(0xFF0B1D23),
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/backgroundimage.png',
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Color(0xFF0F1A1A),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Welcome!',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Text text text',
                        style: TextStyle(color: Colors.white70),
                      ),
                      SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            _isConnected
                                ? Navigator.pushReplacementNamed(
                                  context,
                                  '/home',
                                )
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
                            ;
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFDB9F00),
                            padding: EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Scan bottle',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Have an account? ',
                            style: TextStyle(color: Colors.white70),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Navigate to sign-in
                            },
                            child: TextButton(
                              onPressed: () {
                                _isConnected
                                    ? Navigator.pushNamed(context, '/signIn')
                                    : {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).removeCurrentSnackBar(),
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            "No internet connection",
                                          ),
                                          backgroundColor: Colors.red,
                                          duration: Duration(seconds: 3),
                                        ),
                                      ),
                                    };
                                ;
                              },
                              child: Text(
                                'Sign in first',
                                style: TextStyle(
                                  color: Color(0xFFDB9F00),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
