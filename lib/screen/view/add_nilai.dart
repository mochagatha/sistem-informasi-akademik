// ignore_for_file: no_logic_in_create_state, use_key_in_widget_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mini_project_agatha/screen/view_model/view_model_siswa.dart';
import 'package:provider/provider.dart';
import '../view_model/pdf.dart';

class AddNilai extends StatefulWidget {
  const AddNilai(
    this.idSiswa,
  );
  final int idSiswa;

  @override
  State<AddNilai> createState() => _AddNilaiState(
        idSiswa,
      );
}

class _AddNilaiState extends State<AddNilai> {
  _AddNilaiState(
    int selectedIndex,
  );

  @override
  Widget build(BuildContext context) {
    final modelview = Provider.of<SiswaViewModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Nilai"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Consumer<SiswaViewModel>(
                builder: (context, contactModel, child) {
                  final foto = modelview.studentDataID['data']['attributes']
                          ['foto_profile'] ??
                      "https://assets-a1.kompasiana.com/items/album/2021/03/24/blank-profile-picture-973460-1280-605aadc08ede4874e1153a12.png?t=o&v=1200";
                  final nama = modelview.studentDataID['data']['attributes']
                          ['nama_siswa'] ??
                      "";
                  final uh1 = modelview.studentDataID['data']['attributes']
                          ['ulangan_harian_1'] ??
                      0;
                  final uh2 = modelview.studentDataID['data']['attributes']
                          ['ulangan_harian_2'] ??
                      0;
                  final uh3 = modelview.studentDataID['data']['attributes']
                          ['ulangan_harian_3'] ??
                      0;
                  final uts =
                      modelview.studentDataID['data']['attributes']['uts'] ?? 0;
                  final uas =
                      modelview.studentDataID['data']['attributes']['uas'] ?? 0;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(foto),
                              radius: 40,
                            ),
                            const SizedBox(height: 10),
                            Text(nama),
                            Text("007139243${widget.idSiswa}"),
                          ],
                        ),
                      ),
                      const SizedBox(height: 50),
                      Form(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Center(
                              child: Text(
                                'Nilai Ulangan',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const Text("Ulangan Harian 1"),
                            TextFormField(
                              keyboardType: TextInputType.phone,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              enabled: modelview.isEditMode,
                              controller: modelview.inputUh1,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: modelview.isEditMode
                                    ? Colors.white
                                    : const Color.fromARGB(130, 158, 158, 158),
                                contentPadding: const EdgeInsets.all(16),
                                hintText: '$uh1',
                                hintStyle: TextStyle(
                                  color: modelview.isEditMode
                                      ? const Color(0xFF999999)
                                      : Colors.black,
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
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text("Ulangan Harian 2"),
                            TextFormField(
                              keyboardType: TextInputType.phone,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              enabled: modelview.isEditMode,
                              controller: modelview.inputUh2,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: modelview.isEditMode
                                    ? Colors.white
                                    : const Color.fromARGB(130, 158, 158, 158),
                                contentPadding: const EdgeInsets.all(16),
                                hintText: '$uh2',
                                hintStyle: TextStyle(
                                  color: modelview.isEditMode
                                      ? const Color(0xFF999999)
                                      : Colors.black,
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
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text("Ulangan Harian 3"),
                            TextFormField(
                              keyboardType: TextInputType.phone,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              enabled: modelview.isEditMode,
                              controller: modelview.inputUh3,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: modelview.isEditMode
                                    ? Colors.white
                                    : const Color.fromARGB(130, 158, 158, 158),
                                contentPadding: const EdgeInsets.all(16),
                                hintText: '$uh3',
                                hintStyle: TextStyle(
                                  color: modelview.isEditMode
                                      ? const Color(0xFF999999)
                                      : Colors.black,
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
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text("Ulangan Tengah Semester"),
                            TextFormField(
                              keyboardType: TextInputType.phone,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              enabled: modelview.isEditMode,
                              controller: modelview.inputUts,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: modelview.isEditMode
                                    ? Colors.white
                                    : const Color.fromARGB(130, 158, 158, 158),
                                contentPadding: const EdgeInsets.all(16),
                                hintText: '$uts',
                                hintStyle: TextStyle(
                                  color: modelview.isEditMode
                                      ? const Color(0xFF999999)
                                      : Colors.black,
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
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text("Ulangan Akhir Semester"),
                            TextFormField(
                              keyboardType: TextInputType.phone,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              enabled: modelview.isEditMode,
                              controller: modelview.inputUas,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: modelview.isEditMode
                                    ? Colors.white
                                    : const Color.fromARGB(130, 158, 158, 158),
                                contentPadding: const EdgeInsets.all(16),
                                hintText: '$uas',
                                hintStyle: TextStyle(
                                  color: modelview.isEditMode
                                      ? const Color(0xFF999999)
                                      : Colors.black,
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
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (!modelview.isEditMode)
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blueGrey,
                                    ),
                                    onPressed: () async {
                                      await printPDF(
                                          nama, uh1, uh2, uh3, uts, uas);
                                    },
                                    child: const Text("Cetak Nilai"),
                                  ),
                                const SizedBox(width: 10),
                                Row(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        modelview.toggleEditMode();
                                      },
                                      child: Text(modelview.isEditMode
                                          ? "Batal"
                                          : "Atur Nilai"),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: modelview.isEditMode
                                            ? Colors.red
                                            : Colors.blueGrey,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    if (modelview.isEditMode)
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.blueGrey,
                                        ),
                                        onPressed: () async {
                                          modelview.addNilaiStudent(
                                              widget.idSiswa,
                                              uh1,
                                              uh2,
                                              uh3,
                                              uts,
                                              uas);

                                          modelview.inputUh1.clear();
                                          modelview.inputUh2.clear();
                                          modelview.inputUh3.clear();
                                          modelview.inputUts.clear();
                                          modelview.inputUas.clear();

                                          await modelview.dataSiswa();
                                          modelview.toggleEditMode();
                                        },
                                        child: const Text("Simpan"),
                                      ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
