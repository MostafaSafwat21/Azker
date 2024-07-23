import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:azker/models/after_sala.dart';
import 'package:azker/models/mase_azker.dart';
import 'package:azker/models/prayer_timings.dart';
import 'package:azker/models/sabah_azker.dart';
import 'package:azker/models/tasbh_azker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;

class ReadData {
  static Future<List<MaseAzker>> readMaseJsonData() async {
    try {
      final String jsonString = await rootBundle.rootBundle.loadString(
          'assets/azkar.json');
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      final List<dynamic> azkarList = jsonData["أذكار المساء"];
      return azkarList.map((json) => MaseAzker.fromJson(json)).toList();
    } catch (e) {
      debugPrint('Error loading JSON data: $e');
      return [];
    }
  }

  static Future<List<SabahAzker>> readSabahJsonData() async {
    try {
      final String jsonString = await rootBundle.rootBundle.loadString(
          'assets/azkar.json');
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      final List<dynamic> azkarList = jsonData["أذكار الصباح"];
      return azkarList.map((json) => SabahAzker.fromJson(json)).toList();
    } catch (e) {
      debugPrint('Error loading JSON data: $e');
      return [];
    }
  }

  static Future<List<AfterSalaAzker>> readAfterSalaJsonData() async {
    try {
      final String jsonString = await rootBundle.rootBundle.loadString(
          'assets/azkar.json');
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      final List<
          dynamic> azkarList = jsonData["أذكار بعد السلام من الصلاة المفروضة"];
      return azkarList.map((json) => AfterSalaAzker.fromJson(json)).toList();
    } catch (e) {
      debugPrint('Error loading JSON data: $e');
      return [];
    }
  }

  static Future<List<TasbhAzker>> readTasbhJsonData() async {
    try {
      final String jsonString = await rootBundle.rootBundle.loadString(
          'assets/azkar.json');
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      final List<dynamic> azkarList = jsonData["تسابيح"];
      return azkarList.map((json) => TasbhAzker.fromJson(json)).toList();
    } catch (e) {
      debugPrint('Error loading JSON data: $e');
      return [];
    }
  }

  Future<PrayerTimings?> fetchPrayerTimings() async {
    final DateTime now = DateTime.now();
    final String formattedDate = "${now.day.toString().padLeft(2, '0')}-${now.month.toString().padLeft(2, '0')}-${now.year}";

    final String url = 'https://api.aladhan.com/v1/timingsByCity/$formattedDate?city=cairo&country=egypt&method=8';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return PrayerTimings.fromJson(jsonResponse['data']);
    } else {
      debugPrint('Failed to load prayer timings');
      return null;
    }
  }

}