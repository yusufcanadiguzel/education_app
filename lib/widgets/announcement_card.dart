import 'package:education_app/constants/strings/magic_strings.dart';
import 'package:flutter/material.dart';

class AnnouncementCard extends StatelessWidget {
  AnnouncementCard({Key? key}) : super(key: key);

  final title = MagicStrings.empty;
  final desc = MagicStrings.empty;
  final date = MagicStrings.empty;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF151A3C), // Arka plan rengi
      child: ClipPath(
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(color: Colors.green, width: 10),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Color(0xFF00956e),
                      ),
                    ),
                    Text(
                      desc,
                      style: const TextStyle(
                        color: Color(0xFF00956e),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Text(
                        MagicStrings.newGroupsDc,
                        style: const TextStyle(
                            color: Color(0xfffcfbfb), fontSize: 14.0),
                      ),
                    )
                  ],
                ),
                Baseline(
                  baseline: 110,
                  baselineType: TextBaseline.alphabetic,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            const Icon(Icons.calendar_month,
                                color: Color(0xfffcfbfb)),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              MagicStrings.defaultDate,
                              style: const TextStyle(color: Color(0xfffcfbfb)),
                            )
                          ],
                        ),
                      ),
                      Text(
                        MagicStrings.showMore,
                        style: const TextStyle(color: Color(0xfffcfbfb)),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
