import 'package:alarm_clock_app/components.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AlarmPage extends StatefulWidget {
  AlarmPage({Key? key}) : super(key: key);

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  String? date;
  String? time;

  List listDate = [];
  List listTime = [];

  void addToList() {
    listDate.add(date);
    listTime.add(time);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: DateTime.now().hour > 12 ? Color(0xFF2D2F41) : Colors.deepOrange[900],
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDateDilog().then((value) {
              setState(() {
                print(value);
                date = value;
              });

              showTimeDilog().then((value) {
                setState(() {
                  time = value;
                });
                addToList();
              });
            });
          },
          child: Icon(Icons.add),
        ),
        body: listTime.isEmpty
            ? Center(
                child: Text(
                  'No Alarms Yet!',
                  style: GoogleFonts.arbutus(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return buildItem(listDate[index], listTime[index]);
                },
                itemCount: listTime.length,
              )
    );
  }

  Future showDateDilog() async {
    var date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2050),
    );

    print(date);
    return date.toString().substring(0, 10);
  }

  Future showTimeDilog() async {
    var time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    var locailzation = MaterialLocalizations.of(context);
    locailzation.formatTimeOfDay(time!).toString();

    print(time);
    print(locailzation.formatTimeOfDay(time).toString());

    return locailzation.formatTimeOfDay(time).toString();
  }
}
