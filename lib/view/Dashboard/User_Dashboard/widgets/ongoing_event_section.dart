import 'package:ems/view/Dashboard/User_Dashboard/model/ongoingevent.dart';
import 'package:flutter/material.dart';

class OngoingeventSection extends StatelessWidget {
  
  final List<Ongoingevent> ongoingevent = [
    Ongoingevent(eventname: 'Birthday Party', location: 'Colaba', icon: Icons.location_on,),
    Ongoingevent(eventname: 'Wedding', location: 'Mumbai Central', icon: Icons.location_on),
    Ongoingevent(eventname: 'Anniversary', location: 'Churchgate', icon: Icons.location_on),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: ongoingevent.map((ongoingevent) {
        return Card(
          elevation: 3,
          margin: EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            title: Row(
              children: [
                Expanded(
                  child: Text(
                    ongoingevent.eventname,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            subtitle: Row(
              children: [
                Icon(ongoingevent.icon, size: 16, color: Colors.grey),
                SizedBox(width: 4),
                Text(ongoingevent.location),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
