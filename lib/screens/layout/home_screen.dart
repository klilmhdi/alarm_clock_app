import 'package:alarm_clock_app/components.dart';
import 'package:alarm_clock_app/generated/assets.dart';
import 'package:alarm_clock_app/screens/alarm/alarm_screen.dart';
import 'package:alarm_clock_app/screens/clock/clock_view.dart';
import 'package:alarm_clock_app/screens/timer/stop_watch_screen.dart';
import 'package:alarm_clock_app/screens/timer/timer_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedTime = DateFormat('HH:mm').format(now);
    var formattedDate = DateFormat('EEE, d MMM').format(now);
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: DateTime.now().hour > 12 ? Colors.blue.shade800 : Colors.deepOrange[800],
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
      ),
      drawer: Drawer(
        elevation: 0.0,
        width: 220.0,
        backgroundColor: DateTime.now().hour > 12 ? Colors.blue.shade800 : Colors.deepOrange[800],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: ListTile(
                minLeadingWidth: 6,
                tileColor: DateTime.now().hour > 12 ? Colors.lightBlue : Colors.deepOrangeAccent,
                shape: StadiumBorder(
                    side: BorderSide(
                        color: DateTime.now().hour > 12 ? Colors.black : Colors.white,
                        width: 1
                    )
                ),
                onTap: (){
                  navTo(context, AlarmPage());
                },
                leading: Image.asset(
                  Assets.assetsAlarmIcon,
                  width: 30.0,
                  height: 30.0,
                ),
                title: Text('Alarm',
                    style: GoogleFonts.robotoSlab(
                      color: Colors.white,
                      fontSize: 20,
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: ListTile(
                minLeadingWidth: 6,
                tileColor: DateTime.now().hour > 12 ? Colors.lightBlue : Colors.deepOrangeAccent,
                shape: StadiumBorder(
                  side: BorderSide(
                    color: DateTime.now().hour > 12 ? Colors.black : Colors.white,
                    width: 1
                  )
                ),
                onTap: (){
                  navTo(context, const StopWatchPage());
                },
                leading: Image.asset(
                  Assets.assetsStopwatchIcon,
                  width: 30.0,
                  height: 30.0,
                ),
                title: Text('Stop Watch',
                    style: GoogleFonts.robotoSlab(
                      color: Colors.white,
                      fontSize: 20,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                minLeadingWidth: 6,
                tileColor: DateTime.now().hour > 12 ? Colors.lightBlue : Colors.deepOrangeAccent,
                shape: StadiumBorder(
                  side: BorderSide(
                    width: 1,
                    color: DateTime.now().hour > 12 ? Colors.black : Colors.white,
                  )
                ),
                onTap: (){
                  navTo(context, TimerPage());
                },
                leading: Image.asset(
                  Assets.assetsTimerIcon,
                  width: 30.0,
                  height: 30.0,
                ),
                title: Text('Timer',
                    style: GoogleFonts.robotoSlab(
                      color: Colors.white,
                      fontSize: 20,
                    )),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),
                  Text(
                    DateTime.now().hour > 12
                        ? "Good Evening 🌃"
                        : 'Good Morning 🌄',
                    style: GoogleFonts.robotoSlab(
                        fontSize: 35,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text(
                        formattedTime,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 60,
                        ),
                      ),
                      Text(DateTime.now().hour > 12 ? " PM" : " AM",
                          style: TextStyle(
                              fontSize: 45,
                              fontWeight: FontWeight.w700,
                              color: Colors.white)),
                    ],
                  ),
                  Text(
                    formattedDate,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                    ),
                  ),
                  const SizedBox(height: 40),
                  const ClockView(
                    size: 250,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
