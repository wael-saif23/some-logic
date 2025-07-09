import 'package:flutter/material.dart';

class FormFeature extends StatefulWidget {
  const FormFeature({super.key});

  @override
  State<FormFeature> createState() => _FormFeatureState();
}

class _FormFeatureState extends State<FormFeature> {
  bool _obscureText = true;
  String? _requistText;
  String? _emailText;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 32, left: 32, right: 32),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  // email form field
                  TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email is required";
                      }
                      if (value.contains("@") == false) {
                        return "Email must contain '@' symbol";
                      }
                      return null;
                    },

                    maxLines: 1,
                    cursorColor: Colors.white,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email, color: Colors.white),
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.white70),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(width: 3, color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(width: 1, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  // password form field
                  TextFormField(
                    controller: _passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password is required";
                      }
                      if (value.length < 8) {
                        return "Password must be at least 8 characters long";
                      }
                      return null;
                    },
                    maxLines: 1,
                    obscureText: _obscureText,
                    cursorColor: Colors.white,
                    textInputAction: TextInputAction.done,

                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock, color: Colors.white),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.white70),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(width: 3, color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(width: 1, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 32),
                  // login button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text("Login"),
                    onPressed: () {
                      setState(() {
                        if (_formKey.currentState!.validate()) {
                          _requistText = "requisted";
                          _emailText = _emailController.text.replaceAll(
                            " ",
                            "",
                          );
                        } else {
                          _requistText = "not requisted";
                        }
                      });
                    },
                  ),

                  SizedBox(height: 150),
                  // requist text
                  Text(
                    "* requist : $_requistText",
                    style: TextStyle(color: Colors.white70),
                  ),

                  SizedBox(height: 16),

                  Text(
                    "* email : $_emailText",
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
