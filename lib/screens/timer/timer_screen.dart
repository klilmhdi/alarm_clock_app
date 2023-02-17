import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> with TickerProviderStateMixin{
  int counter = 1;

  _incrementCounter() {
    setState(() {
      counter++;
    });
  }
  _decrementCounter() {
    setState(() {
      counter--;
    });
  }
  late CustomTimerController controller = CustomTimerController(
      vsync: this,
      begin: const Duration(hours: 24),
      end: const Duration(),
      initialState: CustomTimerState.reset,
      interval: CustomTimerInterval.milliseconds
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DateTime.now().hour > 12 ? Color(0xFF2D2F41) : Colors.deepOrange[900],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTimer(
              controller: controller,
              builder: (state, time) {
                return Text(
                    "${time.hours}:${counter}:${time.seconds}.${time.milliseconds}",
                    style: TextStyle(fontSize: 24.0, color: Colors.white));
              }),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MaterialButton(
                shape: StadiumBorder(),
                onPressed: () {
                  controller.start();
                },
                color: Colors.green,
                child: const Text('Start', style: TextStyle(color: Colors.white, fontSize: 18.0),),
              ),
              MaterialButton(
                shape: StadiumBorder(),
                onPressed: () {
                  controller.pause();
                },
                color: Colors.teal,
                child: const Text('Pause', style: TextStyle(color: Colors.white, fontSize: 18.0),),
              ),
              MaterialButton(
                shape: StadiumBorder(),
                onPressed: () {
                  controller.reset();
                },
                color: Colors.purple.shade800,
                child: const Text('Reset', style: TextStyle(color: Colors.white, fontSize: 18.0),),
              ),
            ],
          )
        ],
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          SizedBox(
            height: 15.0,
          ),
          FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'Decrement',
            child: const Icon(Icons.minimize),
          ),
        ],
      ),
    );
  }
}
