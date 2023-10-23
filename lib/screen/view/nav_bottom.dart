import 'package:flutter/material.dart';
import 'package:mini_project_agatha/screen/view/daftar_siswa.dart';
import 'package:mini_project_agatha/screen/view/ai.dart';
import 'package:mini_project_agatha/screen/view/home.dart';
import 'package:mini_project_agatha/screen/view_model/view_model_login.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  @override
  Widget build(BuildContext context) {
    final modelview = Provider.of<LoginViewModel>(context, listen: false);
    return Scaffold(
      body: Consumer<LoginViewModel>(
        builder: (context, contactModel, child) {
          final List<Widget> screens = [
            
            const DaftarSiswa(),
            const HomeScreen(),
            const Ai(),
          ];
          return screens[modelview.currentIndex];
        },
      ),
      bottomNavigationBar: Consumer<LoginViewModel>(
        builder: (context, contactModel, child) {
          return GNav(
            gap: 8,
            activeColor: Colors.black,
            iconSize: 24,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: const Duration(milliseconds: 500),
            tabBackgroundColor: const Color(0xFF21ABA5),
            tabs: const [
              GButton(
                icon: Icons.task,
                text: 'Siswa',
              ),
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.emoji_objects,
                text: 'AI',
              ),
            ],
            selectedIndex: contactModel.currentIndex,
            onTabChange: (index) {
              contactModel.changeIndex(index);
            },
          );
        },
      ),
    );
  }
}
