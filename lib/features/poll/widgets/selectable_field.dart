import 'package:flutter/material.dart';
import 'package:hod_app/constants/fonts.dart';
import 'package:hod_app/theme/palette.dart';

class SelectablePollField extends StatelessWidget {
  const SelectablePollField({
    super.key,
    required this.text,
    this.isSelected = false,
    this.hasVoted = false,
    this.voteCount = 0,
    this.votePercentage = 0,
    this.onPressed,
  });

  final String text;
  final bool isSelected;
  final bool hasVoted;
  final int voteCount;
  final double votePercentage;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: onPressed,
          child: Ink(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: isSelected ? Palette.purple : Colors.black54,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    fontFamily: "CoolveticaCondensed",
                    color: isSelected ? Palette.purple : Colors.black87,
                    fontSize: 20,
                  ),
                ),
                Row(
                  children: [
                    if (hasVoted)
                      Text(
                        "$voteCount vote${voteCount > 1 ? "s" : ""}",
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                        ),
                      ),
                    const SizedBox(width: 10),
                    if (hasVoted)
                      Text(
                        "${(votePercentage * 100).floor()}%",
                        style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 24,
                          fontFamily: HodFonts.coolveticaCondensed,
                        ),
                      ),
                    const SizedBox(width: 10),
                    if (isSelected)
                      const Icon(
                        Icons.check,
                        color: Palette.purple,
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
