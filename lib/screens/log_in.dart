import 'package:flutter/material.dart';
import 'package:wanderlustventures_app/screens/sign_up.dart';
import 'package:wanderlustventures_app/screens/home.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class LogInForm extends StatefulWidget {
  const LogInForm({Key? key}) : super(key: key);

  @override
  _LogInFormState createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Log In',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 5),
        Row(children: [Text('Log In to continue your adventure.')]),
        SizedBox(height: 10),
        Row(
          children: [
            Text(
              'Email',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        SizedBox(height: 10),
        TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'Enter Email',
            hintStyle: TextStyle(fontSize: 15),
            filled: true,
            fillColor: const Color(0xFFC5E9FC),
            contentPadding: EdgeInsets.only(left: 12),
            prefixIcon: Icon(Icons.email_rounded),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(22)),
          ),
        ),
        SizedBox(height: 14),
        Row(
          children: [
            Text(
              'Password',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        SizedBox(height: 10),
        TextField(
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
            hintText: 'Enter password',
            hintStyle: TextStyle(fontSize: 15),
            filled: true,
            fillColor: const Color(0xFFC5E9FC),
            contentPadding: EdgeInsets.only(left: 12),
            prefixIcon: Icon(Icons.lock),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(22)),
          ),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Checkbox(
              value: true,
              activeColor: const Color(0xFF0498E5),
              onChanged: (_) {},
            ),
            Text('Keep me logged in', textAlign: TextAlign.left),
            // SizedBox(width: 68),
            Spacer(),
            Text(
              'Forgot password?',
              textAlign: TextAlign.right,
              style: TextStyle(color: const Color(0xFF0498E5)),
            ),
          ],
        ),

        SizedBox(height: 14),
        SizedBox(
          width: double.infinity,
          height: 46,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0498E5),
            ),
            child: Text(
              'Log In',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),

        SizedBox(height: 20),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account yet?"),
                SizedBox(width: 5),
                // making the sign up navigbke
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUp()),
                    );
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: const Color(0xFF0498E5)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD7F0FD),
      appBar: AppBar(backgroundColor: const Color(0xFFD7F0FD)),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: [const LogInForm()]),
          ),
        ),
      ),
    );
  }
}
