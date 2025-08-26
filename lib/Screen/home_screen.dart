import 'package:first_task/Screen/login_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: Stack(
          children: [
            Align(
              alignment: const Alignment(0, 0.5),
              child: Builder(
                builder: (context) {
                  return ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>  LoginScreen(),
                        ),
                      );
                    },
                    child: const Text('Press here to log in',style: TextStyle(
                     color: Colors.black 
                    ),),
                  );
                },
              ),
            ),
             Align(
              alignment: Alignment(-0.01, -0.5),
              child: Text('Welcome to THE APP',style: TextStyle(
                color:Colors.black,),
                ),
            ),
          ],
        ),
      );
  }
}