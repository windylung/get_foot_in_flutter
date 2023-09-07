import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const twentyFiveMinutes = 1500;
  int totalTime = twentyFiveMinutes;
  int totalPomodoros = 0;
  late Timer timer;
  bool isRunning = false;

  void ticTok(Timer timer) {
    if (totalTime == 0) {
      setState(() {
        timer.cancel();
        isRunning = false;
        totalPomodoros += 1;
        totalTime = twentyFiveMinutes;
      });
    } else {
      setState(() {
        totalTime -= 1;
      });
    }
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().split('.').first.substring(2, 7);
  }

  void onStartPressed() {
    timer = Timer.periodic(const Duration(seconds: 1), (ticTok));
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
      // totalTime = 1500;
    });
  }

  void onResetPressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
      totalTime = twentyFiveMinutes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(children: [
        Flexible(
          flex: 1,
          child: Container(
            alignment: Alignment.center,
            child: Text(
              format(totalTime),
              style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 90,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        Flexible(
          flex: 3,
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  iconSize: 120,
                  color: Theme.of(context).cardColor,
                  onPressed: () {
                    isRunning ? onPausePressed() : onStartPressed();
                  },
                  icon: Icon(isRunning
                      ? Icons.stop_circle
                      : Icons.play_circle_fill_outlined)),
              const SizedBox(
                height: 30,
              ),
              IconButton(
                onPressed: () {
                  onResetPressed();
                },
                icon: const Icon(Icons.restore),
                iconSize: 50,
                color: Colors.black45,
              )
            ],
          )),
        ),
        Flexible(
          flex: 1,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(50),
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Pomodoros",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color:
                              Theme.of(context).textTheme.displayLarge!.color,
                        ),
                      ),
                      Text(
                        "$totalPomodoros",
                        style: TextStyle(
                          fontSize: 58,
                          fontWeight: FontWeight.w600,
                          color:
                              Theme.of(context).textTheme.displayLarge!.color,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
