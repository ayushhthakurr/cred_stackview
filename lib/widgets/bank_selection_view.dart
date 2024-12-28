import 'package:flutter/material.dart';
import '../models/stack_item.dart';

class BankSelectionView extends StatelessWidget {
  final OpenState openState;

  const BankSelectionView({Key? key, required this.openState}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = openState.body.items;
    if (items == null) return Container();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          openState.body.title ?? '',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 8),
        Text(
          openState.body.subtitle ?? '',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 24),
        ...items.map((item) => _buildBankOption(context, item)).toList(),
        const SizedBox(height: 16),
        TextButton(
          onPressed: () {},
          child: Text(openState.body.footer ?? ''),
        ),
      ],
    );
  }

  Widget _buildBankOption(BuildContext context, Map<String, dynamic> item) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: const CircleAvatar(
          child: Icon(Icons.account_balance),
        ),
        title: Text(item['title']),
        subtitle: Text(item['subtitle'].toString()),
      ),
    );
  }
}