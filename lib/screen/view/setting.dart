import 'package:flutter/material.dart';
// import 'package:mini_project_agatha/screen/view/login.dart';
import 'package:mini_project_agatha/screen/view_model/view_model_login.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import '../view_model/view_model_login.dart';

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
          title: const Text('Berhasil!!!'),
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
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: modelview.passwordLama,
                      maxLength: 20,
                      decoration: const InputDecoration(
                        labelText: 'Password Lama',
                        labelStyle: TextStyle(
                          color: Colors.blueGrey,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: modelview.passwordBaru,
                      decoration: const InputDecoration(
                        labelText: 'Password Baru',
                        labelStyle: TextStyle(
                          color: Colors.blueGrey,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password tidak boleh kosong';
                        } else if (value.length < 8) {
                          return 'Password harus memiliki setidaknya 8 karakter';
                        } else if (!RegExp(r'^(?=.*[a-zA-Z])(?=.*\d).+$')
                            .hasMatch(value)) {
                          return 'Password harus berupa kombinasi huruf dan angka';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: modelview.konfirmasiPassword,
                      decoration: const InputDecoration(
                        labelText: 'Konfirmasi Password-Baru',
                        labelStyle: TextStyle(
                          color: Colors.blueGrey,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Konfirmasi password tidak boleh kosong';
                        } else if (value != modelview.passwordBaru.text) {
                          return 'Password tidak sama';
                        }
                        return null;
                      },
                    ),
            ElevatedButton(
  onPressed: () async {
    if (formKey.currentState!.validate()) {
      bool success = await modelview.changePassword();
      if (!success) {
        _showErrorDialog(modelview.gagalUbahPassword);
      }
       else if (success) {
        _showSuccessDialog(modelview.berhasilUbahPassword);
      }
    }
  },
  child: const Text("Ubah Password"),
)

                  ],
                ),
              )
            ],
          ),
        ),
        
      ),
      
    );
    
  }
  
}
