class ConversationDTO {
  String contactId;

  ConversationDTO(this.contactId);

  factory ConversationDTO.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {'id': String id} => ConversationDTO(id),
      _ => throw const FormatException('Failed to get contact.'),
    };
  }
}
