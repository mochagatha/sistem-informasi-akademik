// ignore_for_file: await_only_futures

import 'package:flutter/material.dart';
import 'package:mini_project_agatha/screen/view/detail_berita.dart';
import 'package:mini_project_agatha/screen/view_model/view_model_berita.dart';
import 'package:provider/provider.dart';
import 'custom_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final modelview = Provider.of<BeritaViewModel>(context, listen: false);
    double screenHeight = MediaQuery.of(context).size.height - kToolbarHeight;
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      color: const Color(0xFF21ABA5),
      height: screenHeight,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          const CustomAppBar(),
          Container(
            height: screenHeight - 120,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: ListView.builder(
              itemCount: modelview.newsData['data'].length,
              itemBuilder: (context, index) {
                final berita = modelview.newsData['data'][index];
                final gambar = berita['attributes']['gambar'];
                final judul = berita['attributes']['judul'];
                final deskripsi = berita['attributes']['deskripsi'] ?? "";
                return ListTile(
                  title: Container(
                    height: 250.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(gambar),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          8.0,
                        ),
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                          child: Container(
                            height: 113.0,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(0, 255, 153, 0),
                            ),
                          ),
                        ),
                        Container(
                          color: const Color.fromARGB(185, 255, 255, 255),
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _truncateText(judul, 30),
                                style: const TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                _truncateText(deskripsi, 85),
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF2DBAB1),
                                  elevation: 1,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailBerita(
                                          judul: judul,
                                          gambar: gambar,
                                          deskripsi: deskripsi),
                                    ),
                                  );
                                },
                                child: const Row(
                                  children: [
                                    Text("Selanjutnya"),
                                    Icon(
                                      Icons.arrow_forward,
                                      size: 18.0,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    )));
  }

  String _truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    }
    return '${text.substring(0, maxLength)}...';
  }
}
