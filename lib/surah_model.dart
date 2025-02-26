class Surah {
  final int nomor;
  final String nama;
  final String namaLatin;
  final String arti;
  final int jumlahAyat;
  final String tempatTurun;
  final List<Ayat> ayat;

  Surah({
    required this.nomor,
    required this.nama,
    required this.namaLatin,
    required this.arti,
    required this.jumlahAyat,
    required this.tempatTurun,
    required this.ayat,
  });

  factory Surah.fromJson(Map<String, dynamic> json) {
    return Surah(
      nomor: json['nomor'],
      nama: json['nama'],
      namaLatin: json['namaLatin'] ?? '', // Tambahkan default value
      arti: json['arti'],
      jumlahAyat: json['jumlahAyat'],
      tempatTurun: json['tempatTurun'],
      ayat: json['ayat'] != null
          ? List<Ayat>.from(json['ayat'].map((x) => Ayat.fromJson(x)))
          : [], // Tambahkan default list kosong
    );
  }
}

class Ayat {
  final int nomorAyat;
  final String teksArab;
  final String teksLatin;
  final String teksIndonesia;

  Ayat({
    required this.nomorAyat,
    required this.teksArab,
    required this.teksLatin,
    required this.teksIndonesia,
  });

  factory Ayat.fromJson(Map<String, dynamic> json) {
    return Ayat(
      nomorAyat: json['nomorAyat'],
      teksArab: json['teksArab'] ?? '',
      teksLatin: json['teksLatin'] ?? '',
      teksIndonesia: json['teksIndonesia'] ?? '',
    );
  }
}
