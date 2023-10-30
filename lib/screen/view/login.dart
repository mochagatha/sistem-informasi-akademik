// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:mini_project_agatha/screen/view/nav_bottom.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../view_model/view_model_login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late SharedPreferences logindata;
  late bool newUser;
  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    logindata = await SharedPreferences.getInstance();
    newUser = logindata.getBool('login') ?? true;

    if (newUser == false) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const BottomNavScreen(),
          ),
          (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final modelview = Provider.of<LoginViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: modelview.formKey,
            child: Column(
              children: [
                Image.asset(
                "assets/logo.png",
                width: 200,
                height: 200,
                fit: BoxFit.fill,
                ),
                const SizedBox(height: 30),
     
                TextFormField(
                  controller: modelview.email,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFFFAF9F9),
                    contentPadding: const EdgeInsets.all(16),
                    hintText: 'Email',
                    hintStyle: const TextStyle(
                      color: Color(0xFF999999),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                  ),
                  validator: (email) {
                    if (email != null && !EmailValidator.validate(email)) {
                      return 'Enter a valid email';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Consumer<LoginViewModel>(
                  builder: (context, contactModel, child) {
                    return TextFormField(
                      controller: modelview.password,
                      obscureText: !modelview.isPasswordVisible,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFFFAF9F9),
                        contentPadding: const EdgeInsets.all(16),
                        hintText: 'Password',
                        hintStyle: const TextStyle(
                          color: Color(0xFF999999),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            modelview.isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            modelview.togglePasswordVisibility();
                          },
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 30),
                Ink(
                  decoration: ShapeDecoration(
                    color: const Color(0xFF2DBAB1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: InkResponse(
                    onTap: () async {
                      final email = modelview.email.text;
                      final password = modelview.password.text;

                      if (await modelview.login(email, password)) {
                        debugPrint("Login berhasil");
                        modelview.email.clear();
                        modelview.password.clear();
                        logindata.setBool('login', false);
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BottomNavScreen(),
                          ),
                          (route) => false,
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Gagal login'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                    },
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
