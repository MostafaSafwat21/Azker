import 'package:azker/models/after_sala.dart';
import 'package:azker/services/read_data.dart';
import 'package:azker/widget/zaker_Item.dart';
import 'package:flutter/material.dart';

class Sala_Page extends StatefulWidget {
  const Sala_Page({super.key});

  @override
  State<Sala_Page> createState() => _Sala_pageState();
}

class _Sala_pageState extends State<Sala_Page> {
  Future<List<AfterSalaAzker>>? _azkarFuture;

  @override
  void initState() {
    super.initState();
    _azkarFuture = ReadData.readAfterSalaJsonData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<AfterSalaAzker>>(
          future: _azkarFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No data found'));
            } else {
              final List<AfterSalaAzker> azkarItems = snapshot.data!;
              return ListView.builder(
                itemCount: azkarItems.length,
                itemBuilder: (context, index) {
                  final AfterSalaAzker item = azkarItems[index];
                  return AzkarItem(
                    item: item,
                    onTap: () => setState(() {
                      item.decrementCount();
                    }),
                  );
                },
              );
            }
          }
      ),
    );
  }
}
