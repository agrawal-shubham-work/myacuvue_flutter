import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/widget_methods/Maps/book_timing.dart';
import 'package:table_calendar/table_calendar.dart';

class BookDate extends StatefulWidget {
  @override
  _BookDateState createState() => _BookDateState();
}

class _BookDateState extends State<BookDate> {
  CalendarController _calendarController;
  bool enableNextBTN = false;
  DateTime selectedDate;
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        key: _scaffoldkey,
        appBar: AppBar(
          title: Text('Book Appointment'),
        ),
        body: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                calendarWidget(_calendarController, CalendarFormat.month),
                InkWell(
                  onTap: () {
                    if (enableNextBTN) {
                      setState(() async {
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    BookTiming(selectedDate))).then((result) {
                          if (result == true) {
                            Navigator.pop(context, true);
                          }
                        });
                      });
                    } else {
                      showSnackBar("Select date of appointment");
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    color: enableNextBTN ? Color(0xff013f7c) : Colors.grey,
                    width: screenWidth * 0.3,
                    height: screenHeight * 0.06,
                    child: Center(
                      child: Text(
                        'Next',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 16.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  Widget calendarWidget(CalendarController controller, CalendarFormat format) {
    return TableCalendar(
      initialCalendarFormat: format,
      calendarController: controller,
      locale: 'en_US',
      initialSelectedDay: DateTime.now(),
      calendarStyle: CalendarStyle(
        todayColor: Colors.orange,
        selectedColor: Color(0xff013f7c),
        todayStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
          color: Colors.white,
        ),
      ),
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        centerHeaderTitle: true,
        formatButtonDecoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(20.0),
        ),
        formatButtonTextStyle: TextStyle(color: Colors.white),
        formatButtonShowsNext: false,
      ),
      startingDayOfWeek: StartingDayOfWeek.monday,
      onDaySelected: (date, events) {
        setState(() {
          selectedDate = date;
          enableNextBTN = true;
        });
      },
    );
  }

  void showSnackBar(String message) {
    final snackbar = SnackBar(
      content: Text(message),
      duration: Duration(milliseconds: 500),
    );
    _scaffoldkey.currentState.showSnackBar(snackbar);
  }
}
