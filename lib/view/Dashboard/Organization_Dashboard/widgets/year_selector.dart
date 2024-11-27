import 'package:flutter/material.dart';

class YearSelector extends StatelessWidget {
  final int selectedYear;
  final Function(int) onYearChanged;

  YearSelector({required this.selectedYear, required this.onYearChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Text(
            'Select Year:',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(width: 10),
          Expanded(
            child: DropdownButton<int>(
              value: selectedYear,
              onChanged: (int? newYear) {
                if (newYear != null) {
                  onYearChanged(newYear);
                }
              },
              items: List.generate(10, (index) {
                final year = DateTime.now().year - 5 + index;
                return DropdownMenuItem<int>(
                  value: year,
                  child: Text(year.toString()),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
