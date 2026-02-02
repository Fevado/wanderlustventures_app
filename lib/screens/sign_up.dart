import 'package:flutter/material.dart';
import 'package:wanderlustventures_app/screens/log_in.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _passwordChars = false;

  // disposing off controllers when widget is removed
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // enabling access to the values when needed
  void _submitForm() {
    final String name = _nameController.text;
    final String email = _emailController.text;
    final String password = _passwordController.text;

    // adding a validator
    if (name.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => LogIn()));
    }
  }

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(_updateCheckbox);
  }

  void _updateCheckbox() {
    setState(() {
      _passwordChars = _passwordController.text.length >= 8;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
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
          TextFormField(
            controller: _nameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter name to proceed';
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: 'Enter your name',
              hintStyle: TextStyle(fontSize: 15),
              filled: true,
              fillColor: const Color(0xFFC5E9FC),
              prefixIcon: Icon(Icons.person),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22),
              ),
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
          TextFormField(
            controller: _emailController,
            validator: (value) {
              if (value == null || !value.contains('@')) {
                return 'Please enter valid email address';
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: 'Enter your Email',
              hintStyle: TextStyle(fontSize: 15),
              filled: true,
              fillColor: const Color(0xFFC5E9FC),
              prefixIcon: Icon(Icons.email_rounded),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22),
              ),
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
          TextFormField(
            controller: _passwordController,
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Password is required';
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: 'Enter Password',
              hintStyle: TextStyle(fontSize: 15),
              filled: true,
              fillColor: const Color(0xFFC5E9FC),
              prefixIcon: Icon(Icons.lock),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22),
              ),
            ),
          ),

          SizedBox(height: 10),

          Row(
            children: [
              Checkbox(
                value: _passwordChars,
                activeColor: const Color(0xFF0498E5),
                onChanged: null,
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
                if (_formKey.currentState!.validate()) {
                  _submitForm();
                }
              },
              // onPressed: () {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => LogIn()),
              //   );
              // },
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
      ),
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
