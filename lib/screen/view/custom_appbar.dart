import 'package:flutter/material.dart';
import 'package:mini_project_agatha/screen/view/login.dart';
import 'package:mini_project_agatha/screen/view/setting.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../view_model/view_model_login.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
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
    final modelview = Provider.of<LoginViewModel>(context, listen: false);
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 120,
        padding: const EdgeInsets.fromLTRB(20, 50, 10, 10),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background_appbar.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Setting(),
                      ),
                    );
                  },
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      modelview.fotoProfileUser,
                    ),
                    radius: 30,
                  ),
                ),
                const SizedBox(width: 5),
                Consumer<LoginViewModel>(
                  builder: (context, contactModel, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Text(modelview.name),
                        Text(modelview.nip),
                      ],
                    );
                  },
                ),
              ],
            ),
            IconButton(
              onPressed: () {
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
                                modelview.isLoading = false;
                                modelview.currentIndex = 1;
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
        ));
  }
}
