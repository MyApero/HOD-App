import 'package:flutter/cupertino.dart';
import 'package:hod/theme/palette.dart';

Future<DateTime?> showIosDatetimePicker(
    BuildContext ctx, DateTime? selectedDate) async {
  await showCupertinoModalPopup(
      context: ctx,
      builder: (_) => Container(
            height: 190,
            color: Palette.white,
            child: Column(
              children: [
                SizedBox(
                  height: 180,
                  child: CupertinoDatePicker(
                    initialDateTime: selectedDate,
                    onDateTimeChanged: (val) {
                      selectedDate = val;
                    },
                    use24hFormat: true,
                  ),
                ),
              ],
            ),
          ));
  return selectedDate;
}
