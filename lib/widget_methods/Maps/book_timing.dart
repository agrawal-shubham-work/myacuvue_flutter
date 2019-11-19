import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_acuvue_flutter/utilities/constants.dart';

enum selectedTiming {
  ElvenToTwelve,
  TwelveToOne,
  OneToTwo,
  TwoToThree,
  ThreeToFour,
  FourToFive,
  FiveToSix,
  SixToSeven,
  SevenToEight,
  EightToNine,
}

class BookTiming extends StatefulWidget {
  DateTime selectedDate;

  BookTiming(this.selectedDate);

  @override
  _BookTimingState createState() => _BookTimingState();
}

class _BookTimingState extends State<BookTiming> {
  selectedTiming selected;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Appointment'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 5.0, bottom: 10.0),
                  padding: EdgeInsets.all(15.0),
                  color: Color(0xffeff7fc),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      widget.selectedDate == null
                          ? Text(
                              '${DateFormat.yMMMMd("en_US").format(DateTime.now())}',
                              style: TextStyle(
                                color: Colors.blueGrey,
                              ))
                          : Text(
                              '${DateFormat.yMMMMd("en_US").format(widget.selectedDate)}',
                              style: TextStyle(
                                color: Colors.blueGrey,
                              )),
                      Text(
                        '10 Slots Available',
                        style: TextStyle(
                          color: Color(0xff013f7c),
                        ),
                      ),
                    ],
                  ),
                ),
                GridView.count(
                  crossAxisCount: 3,
                  childAspectRatio: 2,
                  controller: new ScrollController(keepScrollOffset: false),
                  shrinkWrap: true,
                  children: <Widget>[
                    selected == selectedTiming.ElvenToTwelve
                        ? BookAppointmentByTime(
                            '11:00 - 12:00',
                            () {
                              setTimingState(selectedTiming.ElvenToTwelve);
                            },
                            Colors.blueAccent,
                            Colors.white,
                          )
                        : BookAppointmentByTime(
                            '11:00 - 12:00',
                            () {
                              setTimingState(selectedTiming.ElvenToTwelve);
                            },
                            Colors.white,
                            Colors.blueGrey,
                          ),
                    selected == selectedTiming.TwelveToOne
                        ? BookAppointmentByTime(
                            '12:00 - 13:00',
                            () {
                              setTimingState(selectedTiming.TwelveToOne);
                            },
                            Colors.blueAccent,
                            Colors.white,
                          )
                        : BookAppointmentByTime(
                            '12:00 - 13:00',
                            () {
                              setTimingState(selectedTiming.TwelveToOne);
                            },
                            Colors.white,
                            Colors.blueGrey,
                          ),
                    selected == selectedTiming.OneToTwo
                        ? BookAppointmentByTime(
                            '13:00 - 14:00',
                            () {
                              setTimingState(selectedTiming.OneToTwo);
                            },
                            Colors.blueAccent,
                            Colors.white,
                          )
                        : BookAppointmentByTime(
                            '13:00 - 14:00',
                            () {
                              setTimingState(selectedTiming.OneToTwo);
                            },
                            Colors.white,
                            Colors.blueGrey,
                          ),
                    selected == selectedTiming.TwoToThree
                        ? BookAppointmentByTime(
                            '14:00 - 15:00',
                            () {
                              setTimingState(selectedTiming.TwoToThree);
                            },
                            Colors.blueAccent,
                            Colors.white,
                          )
                        : BookAppointmentByTime(
                            '14:00 - 15:00',
                            () {
                              setTimingState(selectedTiming.TwoToThree);
                            },
                            Colors.white,
                            Colors.blueGrey,
                          ),
                    selected == selectedTiming.ThreeToFour
                        ? BookAppointmentByTime(
                            '15:00 - 16:00',
                            () {
                              setTimingState(selectedTiming.ThreeToFour);
                            },
                            Colors.blueAccent,
                            Colors.white,
                          )
                        : BookAppointmentByTime(
                            '15:00 - 16:00',
                            () {
                              setTimingState(selectedTiming.ThreeToFour);
                            },
                            Colors.white,
                            Colors.blueGrey,
                          ),
                    selected == selectedTiming.FourToFive
                        ? BookAppointmentByTime(
                            '16:00 - 17:00',
                            () {
                              setTimingState(selectedTiming.FourToFive);
                            },
                            Colors.blueAccent,
                            Colors.white,
                          )
                        : BookAppointmentByTime(
                            '16:00 - 17:00',
                            () {
                              setTimingState(selectedTiming.FourToFive);
                            },
                            Colors.white,
                            Colors.blueGrey,
                          ),
                    selected == selectedTiming.FiveToSix
                        ? BookAppointmentByTime(
                            '17:00 - 18:00',
                            () {
                              setTimingState(selectedTiming.FiveToSix);
                            },
                            Colors.blueAccent,
                            Colors.white,
                          )
                        : BookAppointmentByTime(
                            '17:00 - 18:00',
                            () {
                              setTimingState(selectedTiming.FiveToSix);
                            },
                            Colors.white,
                            Colors.blueGrey,
                          ),
                    selected == selectedTiming.SixToSeven
                        ? BookAppointmentByTime(
                            '18:00 - 19:00',
                            () {
                              setTimingState(selectedTiming.SixToSeven);
                            },
                            Colors.blueAccent,
                            Colors.white,
                          )
                        : BookAppointmentByTime(
                            '18:00 - 19:00',
                            () {
                              setTimingState(selectedTiming.SixToSeven);
                            },
                            Colors.white,
                            Colors.blueGrey,
                          ),
                    selected == selectedTiming.SevenToEight
                        ? BookAppointmentByTime(
                            '19:00 - 20:00',
                            () {
                              setTimingState(selectedTiming.SevenToEight);
                            },
                            Colors.blueAccent,
                            Colors.white,
                          )
                        : BookAppointmentByTime(
                            '19:00 - 20:00',
                            () {
                              setTimingState(selectedTiming.SevenToEight);
                            },
                            Colors.white,
                            Colors.blueGrey,
                          ),
                    selected == selectedTiming.EightToNine
                        ? BookAppointmentByTime(
                            '20:00 - 21:00',
                            () {
                              setTimingState(selectedTiming.EightToNine);
                            },
                            Colors.blueAccent,
                            Colors.white,
                          )
                        : BookAppointmentByTime(
                            '20:00 - 21:00',
                            () {
                              setTimingState(selectedTiming.EightToNine);
                            },
                            Colors.white,
                            Colors.blueGrey,
                          ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    timingAvailability(context, Colors.grey, "Blocked"),
                    timingAvailability(context, Colors.white, "Available"),
                    timingAvailability(context, Colors.blueAccent, "Seleced"),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(5.0),
              padding: EdgeInsets.all(15.0),
              color: selected == null ? Colors.grey : Color(0xff013f7c),
              child: Center(
                  child: Text(
                'Submit',
                style: kRewardBtn,
              )),
            ),
          )
        ],
      ),
    );
  }

  setTimingState(selectedTiming set) {
    setState(() {
      selected = set;
    });
  }

  Row timingAvailability(BuildContext context, Color color, String text) {
    return Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(2.0),
          width: (MediaQuery.of(context).size.width) * 0.05,
          height: (MediaQuery.of(context).size.width) * 0.05,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueGrey),
            color: color,
          ),
        ),
        Text(
          text,
          style: TextStyle(fontSize: 14.0, color: Colors.blueGrey),
        ),
      ],
    );
  }
}

class BookAppointmentByTime extends StatelessWidget {
  String time;
  Function onTaped;
  Color containerColor, textColor;

  BookAppointmentByTime(
      this.time, this.onTaped, this.containerColor, this.textColor);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTaped,
      child: Container(
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: containerColor,
          border: Border.all(
            color: Colors.blueGrey,
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Center(
          child: Text(
            time,
            style: TextStyle(fontSize: 14.0, color: textColor),
          ),
        ),
      ),
    );
  }
}
