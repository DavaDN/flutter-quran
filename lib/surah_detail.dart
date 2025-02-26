import 'package:flutter/material.dart';
import 'surah_model.dart';

class SurahDetail extends StatelessWidget {
  final Surah surah;

  const SurahDetail({super.key, required this.surah});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(surah.nama, style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.grey[900],
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                color: Colors.grey[900],
                elevation: 8,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        surah.namaLatin,
                        style: const TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        'Arti: ${surah.arti}',
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.white70,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      const Divider(color: Colors.white24),
                      ListTile(
                        leading: const Icon(Icons.format_list_numbered, color: Colors.white),
                        title: const Text("Nomor Surah", style: TextStyle(color: Colors.white)),
                        subtitle: Text("${surah.nomor}", style: const TextStyle(color: Colors.white70)),
                      ),
                      ListTile(
                        leading: const Icon(Icons.menu_book, color: Colors.white),
                        title: const Text("Jumlah Ayat", style: TextStyle(color: Colors.white)),
                        subtitle: Text("${surah.jumlahAyat} ayat", style: const TextStyle(color: Colors.white70)),
                      ),
                      ListTile(
                        leading: const Icon(Icons.location_on, color: Colors.white),
                        title: const Text("Tempat Turun", style: TextStyle(color: Colors.white)),
                        subtitle: Text(surah.tempatTurun, style: const TextStyle(color: Colors.white70)),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Ayat-Ayat:',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10.0),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: surah.ayat.length,
                itemBuilder: (context, index) {
                  final ayat = surah.ayat[index];
                  return Card(
                    color: Colors.grey[800],
                    margin: const EdgeInsets.symmetric(vertical: 4.0),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey[700],
                        child: Text(
                          '${ayat.nomorAyat}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(
                        ayat.teksArab,
                        style: const TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ayat.teksLatin,
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.white70,
                            ),
                          ),
                          const Divider(color: Colors.white24),
                          Text(
                            ayat.teksIndonesia,
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
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
