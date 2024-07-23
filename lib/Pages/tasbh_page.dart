import 'package:azker/models/tasbh_azker.dart';
import 'package:azker/services/read_data.dart';
import 'package:azker/widget/zaker_Item.dart';
import 'package:flutter/material.dart';

class Tasbh_Page extends StatefulWidget {
  const Tasbh_Page({super.key});

  @override
  State<Tasbh_Page> createState() => _Tasbh_PageState();
}

class _Tasbh_PageState extends State<Tasbh_Page> {
  Future<List<TasbhAzker>>? _azkarFuture;

  @override
  void initState() {
    super.initState();
    _azkarFuture = ReadData.readTasbhJsonData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<TasbhAzker>>(
          future: _azkarFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No data found'));
            } else {
              final List<TasbhAzker> azkarItems = snapshot.data!;
              return ListView.builder(
                itemCount: azkarItems.length,
                itemBuilder: (context, index) {
                  final TasbhAzker item = azkarItems[index];
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
