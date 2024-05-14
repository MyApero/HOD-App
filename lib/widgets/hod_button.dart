import 'package:flutter/material.dart';

class HodButton extends StatelessWidget {
  const HodButton({super.key, required this.label, required this.onTapped});

  final String label;
  final void Function() onTapped;

  @override
  Widget build(BuildContext context) {

    return FilledButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.fromLTRB(93, 15, 93, 15))
                  // backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.background),
                  ),
              onPressed: onTapped,
              child: Text(label,
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'MulishSemiBold',
                    color: Theme.of(context).colorScheme.surface,
                  )),
            );
  }
}