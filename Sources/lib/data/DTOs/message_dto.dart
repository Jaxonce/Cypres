class MessageDTO {
  String content;
  DateTime date;
  String senderId;
  String receiverId;

  MessageDTO(this.content, this.date, this.senderId, this.receiverId);

  factory MessageDTO.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'content': String content,
        'date': DateTime date,
        'senderId': String senderId,
        'receiverId': String receiverId,
      } =>
        MessageDTO(content, date, senderId, receiverId),
      _ => throw const FormatException('Failed to get message.'),
    };
  }
}
