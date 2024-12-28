import 'package:flutter/material.dart';
import '../models/stack_item.dart';
import '../widgets/credit_amount_view.dart';
import '../widgets/emi_selection_view.dart';
import '../widgets/bank_selection_view.dart';

class StackItemView extends StatelessWidget {
  final StackItem item;
  final bool isExpanded;
  final VoidCallback onTap;
  final int index;

  const StackItemView({
    Key? key,
    required this.item,
    required this.isExpanded,
    required this.onTap,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(bottom: 16),
      child: Material(
        borderRadius: BorderRadius.circular(16),
        elevation: isExpanded ? 8 : 2,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: AnimatedCrossFade(
            firstChild: _buildCollapsedView(context),
            secondChild: _buildExpandedView(context),
            crossFadeState:
                isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 300),
          ),
        ),
      ),
    );
  }

  Widget _buildExpandedView(BuildContext context) {
    Widget content;
    switch (index) {
      case 0:
        content = CreditAmountView(openState: item.openState);
        break;
      case 1:
        content = EMISelectionView(openState: item.openState);
        break;
      case 2:
        content = BankSelectionView(openState: item.openState);
        break;
      default:
        content = Container();
    }

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          content,
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            child: Text(item.ctaText),
          ),
        ],
      ),
    );
  }

  Widget _buildCollapsedView(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: Text('${index + 1}'),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              item.closedState.body['key1'] ?? '',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Icon(
            isExpanded ? Icons.expand_less : Icons.expand_more,
            color: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
    );
  }
}