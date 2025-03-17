class TicketModel {
  int? id;
  String? title;
  int? eventId;
  double? price;
  int? quantity;

  TicketModel({
    this.id,
    this.title,
    this.eventId,
    this.price,
    this.quantity,
  });

  factory TicketModel.fromJson(Map<String, dynamic> json) {
    return TicketModel(
      id: json['id'],
      title: json['title'],
      eventId: json['event_id'],
      price: json['price']?.toDouble(),
      quantity: json['quantity'],
    );
  }
}
