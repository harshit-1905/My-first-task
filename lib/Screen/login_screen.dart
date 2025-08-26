import 'package:first_task/Screen/listview_screen.dart';
import 'package:first_task/buisnesslogic/error_handler.dart';
import 'package:first_task/buisnesslogic/post_auth.dart';
import 'package:first_task/components/special_textfield.dart';
import 'package:flutter/material.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  // controlers for Textfields
  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  Future loadListView() async{
    String response= await postDataAuth(usernamecontroller.text, passwordcontroller.text);
    if(response=='success'){
       Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ListviewScreen(),
                    ),
                  );
    }
      else {
      errorHandler(context, response);
    }
  }
  @override
  void dispose() {
    usernamecontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(title: const Text('Login Screen')),
      body: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              // lock logo
              const Icon(Icons.lock, size: 100),
              const SizedBox(height: 20),
              // usename textfield
              SpecialTextfield(
                text: usernamecontroller, 
                hintText:'Username', obscureText:false),
              const SizedBox(height: 20),
              // password textfield
              SpecialTextfield(
                text: passwordcontroller, 
                hintText:'Password', obscureText:false),
              const SizedBox(height: 20),
              const SizedBox(height: 20),
              // login button
              ElevatedButton(
                onPressed: () {
                  // post request
                  loadListView();
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(150, 50),
                ),
                child: const Text('Log In'),
              ),
            ],
          ),
      ),
    );
  }
}
