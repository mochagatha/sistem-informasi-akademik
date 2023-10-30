// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:mini_project_agatha/screen/view_model/view_model_login.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  late SharedPreferences logindata;
  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
  }

  void _showErrorDialog(String errorMessage) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Peringatan!'),
            content: Text(errorMessage),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        });
  }

  void _showSuccessDialog(String berhasilUbahPassword) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Berhasil'),
            content: Text(berhasilUbahPassword),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final modelview = Provider.of<LoginViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Center(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    modelview.fotoProfileUser,
                  ),
                  radius: 40,
                ),
              ),
              Text(
                modelview.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Reset Password',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Consumer<LoginViewModel>(
                          builder: (context, contactModel, child) {
                            return TextFormField(
                              obscureText: !modelview.isPasswordLama,
                              controller: modelview.passwordLama,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color(0xFFFAF9F9),
                                contentPadding: const EdgeInsets.all(16),
                                hintText: 'Password Lama',
                                hintStyle: const TextStyle(
                                  color: Color(0xFF999999),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(35),
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(35),
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(35),
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    modelview.isPasswordLama
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: () {
                                    modelview.togglePasswordLamaVisibility();
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                        Consumer<LoginViewModel>(
                          builder: (context, contactModel, child) {
                            return TextFormField(
                              obscureText: !modelview.isPasswordBaru,
                              controller: modelview.passwordBaru,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color(0xFFFAF9F9),
                                contentPadding: const EdgeInsets.all(16),
                                hintText: 'Password Baru',
                                hintStyle: const TextStyle(
                                  color: Color(0xFF999999),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(35),
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(35),
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(35),
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    modelview.isPasswordBaru
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: () {
                                    modelview.togglePasswordBaruVisibility();
                                  },
                                ),
                              ),
                              validator: (value) =>
                                  modelview.validatePasswordBaru(value!),
                            );
                          },
                        ),
                        const SizedBox(height: 2),
                        Consumer<LoginViewModel>(
                          builder: (context, contactModel, child) {
                            return TextFormField(
                              obscureText: !modelview.isKonfirmasiPassword,
                              controller: modelview.konfirmasiPassword,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color(0xFFFAF9F9),
                                contentPadding: const EdgeInsets.all(16),
                                hintText: 'Konfirmasi Password-Baru',
                                hintStyle: const TextStyle(
                                  color: Color(0xFF999999),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(35),
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(35),
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(35),
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    modelview.isKonfirmasiPassword
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: () {
                                    modelview
                                        .toggleKonfirmasiPasswordVisibility();
                                  },
                                ),
                              ),
                              validator: (value) =>
                                  modelview.validateKonfirmasiPassword(value!),
                            );
                          },
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              bool success = await modelview.changePassword();
                              if (!success) {
                                _showErrorDialog(modelview.gagalUbahPassword);
                              } else if (success) {
                                _showSuccessDialog(
                                    modelview.berhasilUbahPassword);
                                modelview.hapus();
                              }
                            }
                          },
                          child: const Text("Reset"),
                                  style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(const Color(0xFF21ABA5)),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                      ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
