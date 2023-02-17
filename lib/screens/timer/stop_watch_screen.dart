import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StopWatchPage extends StatefulWidget {
  const StopWatchPage({Key? key}) : super(key: key);

  @override
  State<StopWatchPage> createState() => _StopWatchPageState();
}

class _StopWatchPageState extends State<StopWatchPage> {
  var _isTimerOn;
  var _isReset;
  var _stopwatchFormat = "00 : 00 : 00";
  final _stopwatchInstant = Stopwatch();
  final Duration _duration = const Duration(seconds: 1);

  @override
  void initState() {
    _isTimerOn = false;
    _isReset = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DateTime.now().hour > 12 ? Color(0xFF2D2F41) : Colors.deepOrange[900],
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                _stopwatchFormat,
                style: GoogleFonts.mavenPro(
                  color: Colors.white,
                  wordSpacing: 2,
                  fontSize: 50,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * 0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                        onPressed: () {
                          if (!_isTimerOn) {
                            setState(() {
                              _isTimerOn = true;
                              stopwatchStarted();
                            });
                          } else {
                            print("else");

                            setState(() {
                              _isTimerOn = false;
                              stopwatchPause();
                            });
                            // stopwatchPause();
                          }
                        },
                        shape: const CircleBorder(),
                        color: Colors.purple[900],
                        child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: _isTimerOn != true
                                ? const Icon(
                                    Icons.play_arrow_rounded,
                                    color: Colors.white,
                                    size: 70,
                                  )
                                : const Icon(
                                    Icons.pause_outlined,
                                    color: Colors.white,
                                    size: 70,
                                  )
                        )
                    ),
                    const SizedBox(height: 10),
                    Visibility(
                      visible: !_isReset,
                      child: MaterialButton(
                          onPressed: () {
                            stopwatchReset();
                          },
                          shape: const CircleBorder(),
                          color: const Color(0xFFd14a41),
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Icon(
                              Icons.restart_alt,
                              color: Colors.white,
                            ),
                          )
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void stopwatchStarted() {
    _stopwatchInstant.start();
    _isTimerOn = true;
    print("stop watch Started");
    startTimer();
  }

  void startTimer() {
    Timer(_duration, keepRunning);
    _isReset = false;
    print("Timer Started");
  }

  void keepRunning() {
    if (_stopwatchInstant.isRunning) {
      _isReset = false;
      startTimer();
      print("keep Running");
    }
    setState(() {
      _stopwatchFormat = "${_stopwatchInstant.elapsed.inHours
              .toString()
              .padLeft(2, "0")} : ${(_stopwatchInstant.elapsed.inMinutes % 60)
              .toString()
              .padLeft(2, "0")} : ${(_stopwatchInstant.elapsed.inSeconds % 60).toString().padLeft(2, "0")}";
      print(_stopwatchFormat);
    });
  }

  void stopwatchPause() {
    setState(() {
      _isTimerOn = false;
      _isReset = false;
      _stopwatchInstant.stop();
    });
    print("Stop watch pause");
  }

  void stopwatchReset() {
    setState(() {
      _isReset = true;
      _stopwatchInstant.reset();
      _stopwatchFormat = "00 : 00 : 00";
    });
  }
}
