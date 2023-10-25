// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:mini_project_agatha/screen/view_model/view_model_siswa.dart';
import 'package:provider/provider.dart';
import 'add_nilai.dart';
import 'custom_appbar.dart';

class DaftarSiswa extends StatefulWidget {
  const DaftarSiswa({Key? key}) : super(key: key);

  @override
  State<DaftarSiswa> createState() => _DaftarSiswaState();
}

class _DaftarSiswaState extends State<DaftarSiswa> {
  late SiswaViewModel modelview;
  @override
  void initState() {
    modelview = Provider.of<SiswaViewModel>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height - kToolbarHeight;
    return Scaffold(
      body: Container(
        color: const Color(0xFF21ABA5),
        height: screenHeight,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            const CustomAppBar(),
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(8),
                height: screenHeight - 120,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Consumer<SiswaViewModel>(
                  builder: (context, contactModel, child) {
                        if (contactModel.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                    return ListView.builder(
                      itemCount: modelview.studentData['data'].length,
                      itemBuilder: (context, index) {
                        final student = modelview.studentData['data'][index];
                        final idSiswa = student['id'];
                        final fotoProfile = student['attributes']
                                ['foto_profile'] ??
                            "https://assets-a1.kompasiana.com/items/album/2021/03/24/blank-profile-picture-973460-1280-605aadc08ede4874e1153a12.png?t=o&v=1200";
                        final studentName = student['attributes']['nama_siswa'];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage:
                                            NetworkImage(fotoProfile),
                                        radius: 27,
                                      ),
                                      const SizedBox(width: 5),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Nama: $studentName"),
                                          Text("Nis : 007139243$idSiswa"),
                                        ],
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    onPressed: () async {
                                      await modelview.siswaById(idSiswa);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => AddNilai(
                                            idSiswa,
                                          ),
                                        ),
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.arrow_forward_ios,
                                      size: 24.0,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const Divider(
                              thickness: 1,
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
