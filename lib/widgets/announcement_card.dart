import 'package:flutter/material.dart';

class AnnouncementCard extends StatelessWidget {
  const AnnouncementCard({super.key});

  final title ='';
  final desc = '';
  final date = '';

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ClipPath(
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              left: BorderSide(color: Colors.green, width: 10),
            )
          ),
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title, style: TextStyle(color: Color(0xFF00956e),),),
                    Text(desc, style: TextStyle(color: Color(0xFF00956e),),)
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Text(
                        'Yeni Grupların Discord\'a Katılımı',
                        style: TextStyle(
                            color: Color(0xFF767676),
                            fontSize: 14.0
                        ),
                      ),
                    )
                  ],
                ),
                Baseline(baseline: 110, baselineType: TextBaseline.alphabetic, child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Icon(Icons.calendar_month, color: Color(0xFF9397a0)),
                          SizedBox(width: 5.0,),
                          Text('22.12.2023', style: TextStyle(color: Color(0xFF9397a0)),)
                        ],
                      ),
                    ),
                    Text('Devamını Oku', style: TextStyle(color: Color(0xFF9397a0)),)
                  ],
                ),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
