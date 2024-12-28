import 'package:flutter/material.dart';
import '../models/stack_item.dart';

class CreditAmountView extends StatefulWidget {
  final OpenState openState;

  const CreditAmountView({Key? key, required this.openState}) : super(key: key);

  @override
  _CreditAmountViewState createState() => _CreditAmountViewState();
}

class _CreditAmountViewState extends State<CreditAmountView> {
  double _currentValue = 0;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.openState.body.card?.minRange?.toDouble() ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    final card = widget.openState.body.card;
    if (card == null) return Container();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.openState.body.title ?? '',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 8),
        Text(
          widget.openState.body.subtitle ?? '',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 24),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  card.header,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  card.description,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 16),
                Text(
                  '₹${_currentValue.toStringAsFixed(0)}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Slider(
                  value: _currentValue,
                  min: card.minRange.toDouble(),
                  max: card.maxRange.toDouble(),
                  onChanged: (value) {
                    setState(() {
                      _currentValue = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          widget.openState.body.footer ?? '',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}