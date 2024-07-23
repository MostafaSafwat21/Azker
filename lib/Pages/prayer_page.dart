import 'package:azker/services/read_data.dart';
import 'package:flutter/material.dart';
import 'package:azker/models/prayer_timings.dart';

class PrayerPage extends StatefulWidget {
  const PrayerPage({super.key});

  @override
  _PrayerPageState createState() => _PrayerPageState();
}

class _PrayerPageState extends State<PrayerPage> {
  late Future<PrayerTimings?> futureTimings;

  @override
  void initState() {
    super.initState();
    futureTimings = ReadData().fetchPrayerTimings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<PrayerTimings?>(
        future: futureTimings,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Failed to load prayer timings'));
          } else if (snapshot.hasData) {
            final timings = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                children: [
                  Card(
                    color: Colors.blueGrey.shade200,
                    child: Column(
                      children: [
                        Text(
                          '(${timings.hijriMonth} - ${timings.hijriDay}) - (${timings.hijriWeekday}) ',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Card(
                    color: Colors.teal.shade200,
                    child: Column(
                      children: [
                        Text(
                          'الفجر : ${timings.fajr}',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Card(
                    color: Colors.tealAccent.shade200,
                    child: Column(
                      children: [
                        Text(
                          'الشروق : ${timings.sunrise}',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Card(
                    color: Colors.teal.shade200,
                    child: Column(
                      children: [
                        Text(
                          'الظهر : ${timings.dhuhr}',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Card(
                    color: Colors.teal.shade200,
                    child: Column(
                      children: [
                        Text(
                          'العصر : ${timings.asr}',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Card(
                    color: Colors.teal.shade200,
                    child: Column(
                      children: [
                        Text(
                          'المغرب : ${timings.maghrib}',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Card(
                    color: Colors.teal.shade200,
                    child: Column(
                      children: [
                        Text(
                          'العشاء : ${timings.isha}',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
