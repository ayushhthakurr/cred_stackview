class StackItem {
  final OpenState openState;
  final ClosedState closedState;
  final String ctaText;

  StackItem({
    required this.openState,
    required this.closedState,
    required this.ctaText,
  });

  factory StackItem.fromJson(Map<String, dynamic> json) {
    return StackItem(
      openState: OpenState.fromJson(json['open_state']),
      closedState: ClosedState.fromJson(json['closed_state']),
      ctaText: json['cta_text'],
    );
  }
}

class OpenState {
  final Body body;

  OpenState({required this.body});

  factory OpenState.fromJson(Map<String, dynamic> json) {
    return OpenState(
      body: Body.fromJson(json['body']),
    );
  }
}

class ClosedState {
  final Map<String, dynamic> body;

  ClosedState({required this.body});

  factory ClosedState.fromJson(Map<String, dynamic> json) {
    return ClosedState(
      body: json['body'],
    );
  }
}

class Body {
  final String? title;
  final String? subtitle;
  final List<dynamic>? items;
  final String? footer;
  final CreditCard? card;  // Renamed from Card to CreditCard

  Body({
    this.title,
    this.subtitle,
    this.items,
    this.footer,
    this.card,
  });

  factory Body.fromJson(Map<String, dynamic> json) {
    return Body(
      title: json['title'],
      subtitle: json['subtitle'],
      items: json['items'],
      footer: json['footer'],
      card: json['card'] != null ? CreditCard.fromJson(json['card']) : null,  // Updated reference
    );
  }
}

class CreditCard {  // Renamed from Card to CreditCard
  final String header;
  final String description;
  final int maxRange;
  final int minRange;

  CreditCard({
    required this.header,
    required this.description,
    required this.maxRange,
    required this.minRange,
  });

  factory CreditCard.fromJson(Map<String, dynamic> json) {
    return CreditCard(
      header: json['header'],
      description: json['description'],
      maxRange: json['max_range'],
      minRange: json['min_range'],
    );
  }
}