import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_acuvue_flutter/utilities/constants.dart';
import 'package:my_acuvue_flutter/utilities/get_current_user_id.dart';
import 'package:my_acuvue_flutter/utilities/global_variable.dart';

class BookTiming extends StatefulWidget {
  DateTime selectedDate;

  BookTiming(this.selectedDate);

  @override
  _BookTimingState createState() => _BookTimingState();
}

class _BookTimingState extends State<BookTiming> {
  /*selectedTiming selected;*/

  int currentIndex = -1;

  List<String> timingList = [
    '11:00 - 12:00',
    '12:00 - 13:00',
    '13:00 - 14:00',
    '14:00 - 15:00',
    '15:00 - 16:00',
    '16:00 - 17:00',
    '17:00 - 18:00',
    '18:00 - 19:00',
    '19:00 - 20:00',
    '20:00 - 21:00'
  ];

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
                  childAspectRatio: 2.0,
                  controller: new ScrollController(keepScrollOffset: false),
                  shrinkWrap: true,
                  children: timingList.map((item) {
                    var index = timingList.indexOf(item);
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      child: BookAppointmentByTime(item, index == currentIndex),
                    );
                  }).toList(),
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
            onTap: () async {
              if (currentIndex != -1) {
                await Firestore.instance
                    .collection("appointment")
                    .document(GlobalVariable.userId)
                    .setData({
                  "timing": timingList[currentIndex],
                  "date":
                      DateFormat.yMMMMd("en_US").format(widget.selectedDate),
                  "status": "pending",
                }).whenComplete(() {
                  print(
                      "Appointment Book Successfully  time=${timingList[currentIndex]} and date=${DateFormat.yMMMMd("en_US").format(widget.selectedDate)}");
                  Navigator.pop(context, true);
                });
              }
            },
            child: Container(
              margin: EdgeInsets.all(5.0),
              padding: EdgeInsets.all(15.0),
              color: currentIndex == -1 ? Colors.grey : Color(0xFF013F7C),
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
  bool isSelected;

  BookAppointmentByTime(this.time, this.isSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blueAccent : Colors.white,
        border: Border.all(
          color: Colors.blueGrey,
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Center(
        child: Text(
          time,
          style: TextStyle(
              fontSize: 14.0,
              color: isSelected ? Colors.white : Colors.blueGrey),
        ),
      ),
    );
  }
}
