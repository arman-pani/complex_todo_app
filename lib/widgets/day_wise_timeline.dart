import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/constants/theme_constants.dart';
import 'package:todo_app/utils/helpers.dart';

class DayWiseTimeline extends StatefulWidget {
  final DateTime selectedDateTime;
  final ValueChanged<DateTime> onDateChanged;
  const DayWiseTimeline({
    super.key,
    required this.selectedDateTime,
    required this.onDateChanged,
  });

  @override
  State<DayWiseTimeline> createState() => _DayWiseTimelineState();
}

class _DayWiseTimelineState extends State<DayWiseTimeline> {
  late DateTime selectedDateTime;

  @override
  void initState() {
    super.initState();
    selectedDateTime = widget.selectedDateTime;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstants.appBarBgColor,
      child: EasyDateTimeLinePicker.itemBuilder(
        firstDate: DateTime(2025, 1, 1),
        lastDate: DateTime(2030, 3, 18),
        focusedDate: widget.selectedDateTime,
        currentDate: selectedDateTime,
        onDateChange: (date) {
          setState(() {
            selectedDateTime = date;
          });
          widget.onDateChanged(date);
        },
        itemExtent: 50,
        selectionMode: SelectionMode.autoCenter(),
        timelineOptions: TimelineOptions(
          padding: EdgeInsets.symmetric(vertical: 10),
          height: 75,
        ),
        physics: ClampingScrollPhysics(),
        headerOptions: HeaderOptions(
          headerBuilder: (context, date, onTap) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: onTap,
                  icon: Icon(Icons.arrow_back_ios_rounded, size: 16),
                ),
                Column(
                  children: [
                    Text(
                      monthToString(date.month),
                      style: TextstyleConstants.mediumText.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      date.year.toString(),
                      style: TextstyleConstants.smallText,
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_forward_ios_rounded, size: 16),
                ),
              ],
            );
          },
        ),
        itemBuilder: (context, date, isSelected, isDisabled, isToday, onTap) {
          return InkResponse(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
              decoration: BoxDecoration(
                color: isSelected
                    ? ColorConstants.purple
                    : ColorConstants.priority,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                spacing: 10,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    weekdayToShortString(date.weekday),
                    style: TextstyleConstants.boldUnderText,
                  ),
                  Text(
                    date.day.toString(),
                    style: TextstyleConstants.boldUnderText,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
