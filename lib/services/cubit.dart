import 'package:azker/Pages/mase_page.dart';
import 'package:azker/Pages/prayer_page.dart';
import 'package:azker/Pages/sabah_page.dart';
import 'package:azker/Pages/sala_page.dart';
import 'package:azker/Pages/tasbh_page.dart';
import 'package:azker/services/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AzkarCubit extends Cubit<AzkarStates> {

  AzkarCubit() : super(AzkarInitialStates());

  static AzkarCubit get(context) => BlocProvider.of(context);

  int currentindex = 0;

  List<Widget> screens = [
    const Sabah_Page(),
    const Mase_page(),
    const PrayerPage(),
    const Sala_Page(),
    const Tasbh_Page(),
    //const Doaa_Page(),
  ];

  List<String> titels = [
    'أذكار الصباح',
    'أذكار المساء',
    'مواعيد الصلاة',
    'أذكار بعد الصلاة',
    'تسابيح',
    //'أدعية',
  ];

  void ChangeIndex(int index) {
    currentindex = index;
    emit(AzkarChangeBottomNavBarState());
  }

}


