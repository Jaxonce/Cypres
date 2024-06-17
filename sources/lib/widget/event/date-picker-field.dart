import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class DatePickerField extends StatefulWidget {
  final DateTime date;
  final Function(DateTime) setDate;
  bool use24hFormat;
  bool showDayOfWeek;
  CupertinoDatePickerMode mode;

  DatePickerField(
      {super.key,
      required this.date,
      required this.setDate,
      this.showDayOfWeek = true,
      this.use24hFormat = true,
      this.mode = CupertinoDatePickerMode.date});

  @override
  State<DatePickerField> createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
      onPressed: () => _showDialog(CupertinoDatePicker(
          initialDateTime: widget.date,
          mode: widget.mode,
          use24hFormat: widget.use24hFormat,
          showDayOfWeek: widget.showDayOfWeek,
          onDateTimeChanged: widget.setDate)),
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xff767680).withOpacity(0.12),
            borderRadius: BorderRadius.all(Radius.circular(6))),
        padding: EdgeInsets.all(8),
        child: Text(
          widget.mode == CupertinoDatePickerMode.date
              ? "${DateFormat.MMM().format(widget.date)} ${widget.date.day} ${widget.date.year}"
              : "${DateFormat.jm().format(widget.date)}",
          style: TextStyle(color: Color(0xff41A576)),
        ),
      ),
    );
  }
}
