import 'package:dream_diary_app/Animation/FadeAnimation.dart';
import 'package:dream_diary_app/Components/CustomTextFormField.dart';
import 'package:dream_diary_app/Components/PasswordField.dart';
import 'package:dream_diary_app/Components/Primary%20Button.dart';
import 'package:dream_diary_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dream_diary_app/Account/registrationGoogle.dart';

class Registration extends StatefulWidget {
  static const String routeName = "registration";

  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final RegistrationGoogle _registrationGoogle = RegistrationGoogle();
  bool obscureText = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    super.dispose();
  }

  Future<void> registerWithGoogle() async {
    User? user = await _registrationGoogle.signInWithGoogle();

    if (user != null) {
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            FadeIn(
              1,
              Container(
                height: 400,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/regbackground.png'),
                        fit: BoxFit.fill)),
                child: Positioned(
                  child: FadeIn(
                    1,
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      child: Center(
                        child: Text("Create Account",
                            style: GoogleFonts.comfortaa(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            FadeIn(
              1,
              Padding(
                padding: const EdgeInsets.only(left: 35.0),
                child: Row(
                  children: [
                    Text("Username",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.comfortaa(
                            color: Colors.grey.shade600,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            FadeIn(
              1,
              Padding(
                padding:
                    const EdgeInsets.only(left: 30.0, right: 30.0, top: 5.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: Colors.grey.shade400,
                          width: 2.0,
                        ),
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 50.0,
                            padding: const EdgeInsets.only(left: 20.0),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    color: Colors.grey[100] ?? Colors.grey),
                              ),
                            ),
                            child: CustomTextFormField(
                                //Username Field
                                labelText: "",
                                hintText: "",
                                textInputType: TextInputType.name,
                                controller: usernameController),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FadeIn(
              1,
              Padding(
                padding: const EdgeInsets.only(left: 35.0),
                child: Row(
                  children: [
                    Text("Email Address",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.comfortaa(
                            color: Colors.grey.shade600,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            FadeIn(
              1,
              Padding(
                padding:
                    const EdgeInsets.only(left: 30.0, right: 30.0, top: 5.0),
                child: Column(
                  children: <Widget>[
                    Container(
                        padding: const EdgeInsets.all(0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            color: Colors.grey.shade400,
                            width: 2.0,
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 50.0,
                              padding: const EdgeInsets.only(left: 20.0),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      color: Colors.grey[100] ?? Colors.grey),
                                ),
                              ),
                              child: CustomTextFormField(
                                  //Email Field
                                  labelText: "",
                                  hintText: "",
                                  textInputType: TextInputType.name,
                                  controller: emailController),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FadeIn(
              1,
              Padding(
                padding: const EdgeInsets.only(left: 35.0),
                child: Row(
                  children: [
                    Text("Password",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.comfortaa(
                            color: Colors.grey.shade600,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            FadeIn(
              1,
              Padding(
                padding:
                    const EdgeInsets.only(left: 30.0, right: 30.0, top: 5.0),
                child: Column(
                  children: <Widget>[
                    Container(
                        padding: const EdgeInsets.all(0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            color: Colors.grey.shade400,
                            width: 2.0,
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 50.0,
                              padding: const EdgeInsets.only(left: 20.0),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      color: Colors.grey[100] ?? Colors.grey),
                                ),
                              ),
                              child: PasswordField(
                                  //Password Field
                                  labelText: "",
                                  hintText: "",
                                  obscureText: obscureText,
                                  onTap: setPasswordVisibility,
                                  controller: passwordController),
                            ),
                          ],
                        )),
                    const SizedBox(
                      height: 30,
                    ),
                    PrimaryButton(text: "Sign Up", onPressed: register),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void register() {
    final username = usernameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty || username.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: const Color.fromRGBO(182, 162, 209, 1),
          behavior: SnackBarBehavior.fixed,
          content: Text("All fields are required!",
              textAlign: TextAlign.center,
              style: GoogleFonts.comfortaa(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500)),
        ),
      );
    } else {
      // Perform registeration logic here
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    }
  }

  void setPasswordVisibility() {
    setState(() {
      obscureText = !obscureText;
    });
  }
}
