// models/prayer_timings.dart
class PrayerTimings {
  final String fajr;
  final String sunrise;
  final String dhuhr;
  final String asr;
  final String sunset;
  final String maghrib;
  final String isha;
  final String imsak;
  final String midnight;
  final String firstThird;
  final String lastThird;
  final String hijriDate;
  final String hijriDay;
  final String hijriMonth;
  final String hijriYear;
  final String hijriWeekday;

  PrayerTimings({
    required this.fajr,
    required this.sunrise,
    required this.dhuhr,
    required this.asr,
    required this.sunset,
    required this.maghrib,
    required this.isha,
    required this.imsak,
    required this.midnight,
    required this.firstThird,
    required this.lastThird,
    required this.hijriDate,
    required this.hijriDay,
    required this.hijriMonth,
    required this.hijriYear,
    required this.hijriWeekday,
  });

  factory PrayerTimings.fromJson(Map<String, dynamic> json) {
    final hijri = json['date']['hijri'];
    return PrayerTimings(
      fajr: json['timings']['Fajr'],
      sunrise: json['timings']['Sunrise'],
      dhuhr: json['timings']['Dhuhr'],
      asr: json['timings']['Asr'],
      sunset: json['timings']['Sunset'],
      maghrib: json['timings']['Maghrib'],
      isha: json['timings']['Isha'],
      imsak: json['timings']['Imsak'],
      midnight: json['timings']['Midnight'],
      firstThird: json['timings']['Firstthird'],
      lastThird: json['timings']['Lastthird'],
      hijriDate: hijri['date'],
      hijriDay: hijri['day'],
      hijriMonth: hijri['month']['ar'],
      hijriYear: hijri['year'],
      hijriWeekday: hijri['weekday']['ar'],
    );
  }
}
