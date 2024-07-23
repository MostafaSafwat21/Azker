import 'dart:async';
import 'package:intl/intl.dart';
import 'package:azker/services/cubit.dart';
import 'package:azker/services/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Timer _timer;
  late String formattedTime;

  @override
  void initState() {
    super.initState();
    formattedTime = _getCurrentTime();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        formattedTime = _getCurrentTime();
      });
    });
  }

  String _getCurrentTime() {
    final DateTime now = DateTime.now();
    return DateFormat('hh:mm:ss a').format(now);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AzkarCubit(),
      child: BlocConsumer<AzkarCubit, AzkarStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AzkarCubit cubit = AzkarCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blueGrey.shade500,
              title: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    Text(
                      cubit.titels[cubit.currentindex],
                      style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Colors.white70,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      formattedTime,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.tealAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: cubit.screens[cubit.currentindex],
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.blueGrey.shade200,
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentindex,
              onTap: (index) {
                cubit.ChangeIndex(index);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: SizedBox.shrink(),
                  label: ' أذكار\nالصباح',
                ),
                BottomNavigationBarItem(
                  icon: SizedBox.shrink(),
                  label: ' أذكار\nالمساء',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.mosque_outlined,
                  ),
                  label: ' مواعيد\n الصلاة',
                ),
                BottomNavigationBarItem(
                  icon: SizedBox.shrink(),
                  label: 'أذكار بعد \n الصلاة ',
                ),
                BottomNavigationBarItem(
                  icon: SizedBox.shrink(),
                  label: 'تسابيح',
                ),
              ],
              selectedLabelStyle: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
              unselectedLabelStyle: const TextStyle(
                fontSize: 14,
              ),
            ),
          );
        },
      ),
    );
  }
}
