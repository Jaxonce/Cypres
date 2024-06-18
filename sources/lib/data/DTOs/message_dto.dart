class MessageDTO {
  String content;
  DateTime date;
  String senderId;

  MessageDTO(this.content, this.date, this.senderId);

  factory MessageDTO.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'content': String content,
        'date': String date,
        'senderId': String senderId,
      } =>
        MessageDTO(content, DateTime.parse(date), senderId),
      _ => throw const FormatException('Failed to get message.'),
    };
  }
}
