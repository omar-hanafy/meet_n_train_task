import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meet_n_train_task/src/app/app.dart';

class DateHeader extends StatelessWidget {
  final DateTime? date;

  const DateHeader({Key? key, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: date != null
          ? Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 30.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: UIColors.primaryColor),
                        borderRadius: BorderRadius.circular(12)),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.calendar_month_outlined,
                        color: UIColors.primaryColor,
                      ),
                    ),
                  ),
                ),
                Text(
                  DateFormat('dd').format(date!),
                  style: const TextStyle(
                      height: 1.2, fontWeight: FontWeight.bold, fontSize: 50),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      DateFormat('EEEE').format(date!),
                      style: const TextStyle(
                          color: UIColors.background,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      DateFormat('MMM yyyy').format(date!),
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                  ],
                ),
                const Spacer(
                  flex: 15,
                ),
              ],
            )
          : const SizedBox(),
    );
  }
}
