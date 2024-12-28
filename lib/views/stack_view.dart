import 'package:flutter/material.dart';
import '../models/stack_item.dart';
import 'stack_item_view.dart';

class StackView extends StatefulWidget {
  final List<StackItem> items;

  const StackView({Key? key, required this.items}) : super(key: key);

  @override
  _StackViewState createState() => _StackViewState();
}

class _StackViewState extends State<StackView> {
  int? expandedIndex;

  void toggleExpansion(int index) {
    setState(() {
      expandedIndex = expandedIndex == index ? null : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: widget.items.length,
      itemBuilder: (context, index) {
        return StackItemView(
          item: widget.items[index],
          isExpanded: expandedIndex == index,
          onTap: () => toggleExpansion(index),
          index: index,
        );
      },
    );
  }
}