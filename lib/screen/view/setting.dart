import 'package:flutter/material.dart';
import 'package:mini_project_agatha/screen/view/login.dart';
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

  @override
  Widget build(BuildContext context) {
    // final modelview = Provider.of<LoginViewModel>(context, listen: false);
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
                          IconButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const Setting(),
                //   ),
                // );
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Peringatan!!!"),
                      content: const Text("Apakah anda yakin ingin keluar?"),
                      actions: <Widget>[
                        TextButton(
                          child: const Text("Tidak"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: const Text("Ya"),
                          onPressed: () {
                            Navigator.of(context).pop();
                            logindata.setBool('login', true);
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                                (route) => false);
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.logout_outlined,
                size: 24.0,
              ),
            ),
            ],
          ),
        ),
      ),
    );
  }
}
