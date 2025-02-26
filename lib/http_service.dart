// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'surah_model.dart';

class HttpService {
  final String baseUrl = 'https://equran.id/api/v2/surat';

  Future<List<Surah>> fetchSurahs() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      print('Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        if (jsonData['data'] == null) {
          throw Exception("Format JSON tidak sesuai");
        }
        final List<dynamic> data = jsonData['data'];
        return data.map((json) => Surah.fromJson(json)).toList();
      } else {
        throw Exception('Gagal mengambil data Surah: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Terjadi kesalahan: $e');
    }
  }

  Future<Surah> fetchSurahDetail(int nomorSurah) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/$nomorSurah'));
      print('Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        if (jsonData['data'] == null) {
          throw Exception("Format JSON tidak sesuai");
        }
        final Map<String, dynamic> data = jsonData['data'];
        return Surah.fromJson(data);
      } else {
        throw Exception('Gagal mengambil detail Surah: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Terjadi kesalahan: $e');
    }
  }
}
