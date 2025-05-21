import 'package:flutter/material.dart';
import 'package:todo_app/constants/theme_constants.dart';

class FABBottomNavBarItem {
  final IconData icon;
  final String label;

  FABBottomNavBarItem({required this.icon, required this.label});
}

class FABBottomNavBar extends StatefulWidget {
  final List<FABBottomNavBarItem> items;
  final ValueChanged<int> onTabSelected;
  const FABBottomNavBar({
    super.key,
    required this.items,
    required this.onTabSelected,
  });

  @override
  State<FABBottomNavBar> createState() => _FABBottomNavBarState();
}

class _FABBottomNavBarState extends State<FABBottomNavBar> {
  int _selectedIndex = 0;

  _updateIndex(int index) {
    widget.onTabSelected(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabItem(
        item: widget.items[index],
        index: index,
        onPressed: _updateIndex,
      );
    });
    items.insert(items.length >> 1, Expanded(child: SizedBox(height: 50)));
    return BottomAppBar(
      color: ColorConstants.appBarBgColor,
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
    );
  }

  Widget _buildTabItem({
    required FABBottomNavBarItem item,
    required int index,
    required ValueChanged<int> onPressed,
  }) {
    Color color = _selectedIndex == index ? Colors.white : ColorConstants.grey1;
    return Expanded(
      child: SizedBox(
        height: 45,
        child: GestureDetector(
          onTap: () => onPressed(index),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(item.icon, color: color, size: 24),
              Text(item.label, style: TextStyle(color: color)),
            ],
          ),
        ),
      ),
    );
  }
}
