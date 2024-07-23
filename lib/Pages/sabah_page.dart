import 'package:azker/models/sabah_azker.dart';
import 'package:azker/services/read_data.dart';
import 'package:azker/widget/zaker_Item.dart';
import 'package:flutter/material.dart';

class Sabah_Page extends StatefulWidget {
  const Sabah_Page({super.key});

  @override
  State<Sabah_Page> createState() => _Sabah_PageState();
}

class _Sabah_PageState extends State<Sabah_Page> {
  Future<List<SabahAzker>>? _azkarFuture;

  @override
  void initState() {
    super.initState();
    _azkarFuture = ReadData.readSabahJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<SabahAzker>>(
        future: _azkarFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data found'));
          } else {
            final List<SabahAzker> azkarItems = snapshot.data!;
            return ListView.builder(
              itemCount: azkarItems.length,
              itemBuilder: (context, index) {
                final SabahAzker item = azkarItems[index];
                return AzkarItem(
                  item: item,
                  onTap: () => setState(() {
                    item.decrementCount();
                  }),
                );
              },
            );
          }
        },
      ),
    );
  }
}
