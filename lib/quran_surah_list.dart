// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'http_service.dart';
import 'surah_model.dart';
import 'surah_detail.dart';

class QuranSurahList extends StatefulWidget {
  const QuranSurahList({super.key});

  @override
  _QuranSurahListState createState() => _QuranSurahListState();
}

class _QuranSurahListState extends State<QuranSurahList> {
  final HttpService httpService = HttpService();
  late Future<List<Surah>> futureSurahs;

  @override
  void initState() {
    super.initState();
    futureSurahs = httpService.fetchSurahs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Daftar Surah Al-Quran',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: FutureBuilder<List<Surah>>(
        future: futureSurahs,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(
              child: Text(
                "Gagal memuat data.",
                style: TextStyle(color: Colors.white),
              ),
            );
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            List<Surah> surahs = snapshot.data!;
            return ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: surahs.length,
              itemBuilder: (context, index) {
                bool isMe = index % 2 == 0;
                return GestureDetector(
                  onTap: () async {
                    final surahDetail =
                        await httpService.fetchSurahDetail(surahs[index].nomor);
                    Navigator.push(
                      // ignore: use_build_context_synchronously
                      context,
                      MaterialPageRoute(
                        builder: (context) => SurahDetail(surah: surahDetail),
                      ),
                    );
                  },
                  child: Align(
                    alignment:
                        isMe ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      margin: const EdgeInsets.symmetric(vertical: 6.0),
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.7),
                      decoration: BoxDecoration(
                        color: isMe ? Colors.blue[700] : Colors.grey[800],
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(12.0),
                          topRight: const Radius.circular(12.0),
                          bottomLeft:
                              isMe ? const Radius.circular(12.0) : Radius.zero,
                          bottomRight:
                              isMe ? Radius.zero : const Radius.circular(12.0),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            surahs[index].nama,
                            style: const TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 4.0),
                          Text(
                            surahs[index].arti,
                            style: const TextStyle(
                              fontSize: 12.0,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text(
                "Tidak ada data.",
                style: TextStyle(color: Colors.white),
              ),
            );
          }
        },
      ),
    );
  }
}
