import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/view_model_ai.dart';
import 'custom_appbar.dart';

class Ai extends StatelessWidget {
  const Ai({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final modelview = Provider.of<AiViewModel>(context, listen: false);
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
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(10.0),
                        height: 300,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: const AssetImage('assets/papan_tulis2.png'),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.6),
                              BlendMode.colorBurn,
                            ),
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Consumer<AiViewModel>(
                                builder: (context, contactModel, child) {
                                  return Expanded(
                                    child: ListView.builder(
                                            itemCount: modelview.dataAi.length,
                                            itemBuilder: (context, index) {
                                              return ListTile(
                                                title: Text(
                                                  modelview.dataAi[index]
                                                      ['text'],
                                                  textAlign: TextAlign.justify,
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Form(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Apa yang ingin anda tanyakan?"),
                            TextFormField(
                              controller: modelview.ai,
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Color(0xFFFAF9F9),
                                contentPadding: EdgeInsets.all(16),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Consumer<AiViewModel>(
                      builder: (context, contactModel, child) {
                        if (modelview.isLoading) {
                          return const CircularProgressIndicator();
                        }
                        final ambilSemuaData = modelview.keyAi['data'][0];
                        final key = ambilSemuaData['attributes']['key'] ?? "";
                        return ElevatedButton(
                          onPressed: () {
                            modelview.makeApiRequest(context, key);
                            modelview.ai.clear();
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color(0xFF21ABA5)),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                            ),
                          ),
                          child: const Text(
                            'Submit',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
