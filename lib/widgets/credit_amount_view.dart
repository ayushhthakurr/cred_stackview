// lib/widgets/credit_amount_view.dart
import 'package:flutter/material.dart';
import '../models/stack_item.dart';
import 'circular_slider.dart'; // You'll need to create this

class CreditAmountView extends StatefulWidget {
  final OpenState openState;

  const CreditAmountView({Key? key, required this.openState}) : super(key: key);

  @override
  _CreditAmountViewState createState() => _CreditAmountViewState();
}

class _CreditAmountViewState extends State<CreditAmountView> {
  double _currentValue = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
            IconButton(
              icon: const Icon(Icons.help_outline),
              onPressed: () {},
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'nikunj, how much do you need?',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 8),
              Text(
                'move the dial and set any amount you need up to ₹487,891',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 40),
              Center(
                child: CircularSlider(
                  value: _currentValue,
                  min: widget.openState.body.card?.minRange?.toDouble() ?? 0,
                  max: widget.openState.body.card?.maxRange?.toDouble() ?? 100000,
                  onChanged: (value) {
                    setState(() => _currentValue = value);
                  },
                ),
              ),
              const SizedBox(height: 40),
              Text(
                'stash is instant, money will be credited within seconds',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}