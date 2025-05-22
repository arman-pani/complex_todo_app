import 'package:flutter/material.dart';
import 'package:todo_app/constants/theme_constants.dart';

enum FilterLabel { all, today, tomorrow, completed, pending }

extension FilterLabelExtension on FilterLabel {
  String get displayName {
    switch (this) {
      case FilterLabel.all:
        return 'All';
      case FilterLabel.today:
        return 'Today';
      case FilterLabel.tomorrow:
        return 'Tomorrow';
      case FilterLabel.completed:
        return 'Completed';
      case FilterLabel.pending:
        return 'Pending';
    }
  }
}

class FilterDropDownButton extends StatefulWidget {
  final FilterLabel initialLabel;
  final ValueChanged<FilterLabel>? onChanged;

  const FilterDropDownButton({
    super.key,
    required this.initialLabel,
    this.onChanged,
  });

  @override
  State<FilterDropDownButton> createState() => _FilterDropDownButtonState();
}

class _FilterDropDownButtonState extends State<FilterDropDownButton> {
  static const List<FilterLabel> _labels = [
    FilterLabel.all,
    FilterLabel.today,
    FilterLabel.tomorrow,
    FilterLabel.completed,
    FilterLabel.pending,
  ];

  late FilterLabel _selectedLabel;

  @override
  void initState() {
    super.initState();
    _selectedLabel = widget.initialLabel;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: ColorConstants.hintTextColor,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<FilterLabel>(
          focusColor: ColorConstants.hintTextColor,
          value: _selectedLabel,
          icon: Icon(Icons.keyboard_arrow_down_outlined, color: Colors.white),
          dropdownColor: ColorConstants.hintTextColor,
          borderRadius: BorderRadius.circular(5),
          style: TextstyleConstants.underText,
          items: _labels.map((label) {
            return DropdownMenuItem<FilterLabel>(
              value: label,
              child: Text(
                label.displayName,
                style: TextstyleConstants.underText,
              ),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) {
              setState(() {
                _selectedLabel = value;
              });
              if (widget.onChanged != null) {
                widget.onChanged!(value);
              }
            }
          },
        ),
      ),
    );
  }
}
