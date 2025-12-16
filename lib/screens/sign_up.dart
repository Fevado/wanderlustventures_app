import 'package:flutter/material.dart';
import 'package:wanderlustventures_app/screens/log_in.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Create an account',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),

        SizedBox(height: 5),

        Row(children: [Text('Set up your profile and travel smart.')]),

        SizedBox(height: 10),

        Row(
          children: [
            Text(
              'Name',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        SizedBox(height: 10),
        TextField(
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            hintText: 'Enter your name',
            hintStyle: TextStyle(fontSize: 15),
            filled: true,
            fillColor: const Color(0xFFC5E9FC),
            prefixIcon: Icon(Icons.person),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(22)),
          ),
        ),

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
            hintText: 'Enter your Email',
            hintStyle: TextStyle(fontSize: 15),
            filled: true,
            fillColor: const Color(0xFFC5E9FC),
            prefixIcon: Icon(Icons.email_rounded),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(22)),
          ),
        ),

        SizedBox(height: 10),

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
            hintText: 'Enter Password',
            hintStyle: TextStyle(fontSize: 15),
            filled: true,
            fillColor: const Color(0xFFC5E9FC),
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
            Text(
              'Password must be 8 characters',
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),

        SizedBox(height: 10),

        SizedBox(
          width: double.infinity,
          height: 46,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LogIn()),
              );
            },
             style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0498E5),
             ),
            child: Text(
              'Sign Up',
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
                Text('Already have an account?'),
                SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(
                      context,
                      MaterialPageRoute(builder: (context) => LogIn()),
                    );
                  },
                  child: Text(
                    'Log In',
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

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD7F0FD),
      appBar: AppBar(backgroundColor: const Color(0xFFD7F0FD)),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: [const SignUpForm()]),
          ),
        ),
      ),
    );
  }
}
