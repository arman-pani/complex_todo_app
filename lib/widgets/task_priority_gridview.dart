import 'package:flutter/material.dart';
import 'package:todo_app/constants/theme_constants.dart';

class TaskPriorityGridview extends StatefulWidget {
  final int selectedPriority;
  final ValueChanged<int> onChanged;
  const TaskPriorityGridview({
    super.key,
    required this.selectedPriority,
    required this.onChanged,
  });

  @override
  State<TaskPriorityGridview> createState() => _TaskPriorityGridviewState();
}

class _TaskPriorityGridviewState extends State<TaskPriorityGridview> {
  late int selectedPriority;
  @override
  void initState() {
    super.initState();
    selectedPriority = 1;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 10,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        final isSelected = (index + 1) == widget.selectedPriority;
        return GestureDetector(
          onTap: () {
            setState(() {
              widget.onChanged(index + 1);
            });
          },
          child: Container(
            height: 65,
            width: 65,
            decoration: BoxDecoration(
              color: isSelected
                  ? ColorConstants.purple
                  : ColorConstants.priority,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.flag_outlined, color: Colors.white),
                Text(
                  (index + 1).toString(),
                  style: TextstyleConstants.underText,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
