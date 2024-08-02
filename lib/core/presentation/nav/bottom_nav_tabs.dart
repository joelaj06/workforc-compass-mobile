// flutter package
import 'package:flutter/material.dart';
import 'package:work_compass/features/workforce_compass/presentation/attendance/screens/attendance_screen.dart';
import 'package:work_compass/features/workforce_compass/presentation/chat/screens/chat_screen.dart';
import 'package:work_compass/features/workforce_compass/presentation/more/screens/more_screens.dart';

import '../../../features/workforce_compass/presentation/home/screens/home_screen.dart';


// local imports
//Get.put(SalesScreen());
final List<Widget> navPages = <Widget>[
  const HomeScreen(),
  const AttendanceScreen(),
  const ChatScreen(),
  const MoreScreen(),
];
// mobile pages
final List<Widget> mobilePages = <Widget>[];
