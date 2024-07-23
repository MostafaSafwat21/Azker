import 'package:azker/models/mase_azker.dart';
import 'package:azker/services/read_data.dart';
import 'package:azker/widget/zaker_Item.dart';
import 'package:flutter/material.dart';

class Mase_page extends StatefulWidget {
  const Mase_page({super.key});

  @override
  State<Mase_page> createState() => _Mase_pageState();
}

class _Mase_pageState extends State<Mase_page> {
  Future<List<MaseAzker>>? _azkarFuture;

  @override
  void initState() {
    super.initState();
    _azkarFuture = ReadData.readMaseJsonData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<MaseAzker>>(
          future: _azkarFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No data found'));
            } else {
              final List<MaseAzker> azkarItems = snapshot.data!;
              return ListView.builder(
                itemCount: azkarItems.length,
                itemBuilder: (context, index) {
                  final MaseAzker item = azkarItems[index];
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
