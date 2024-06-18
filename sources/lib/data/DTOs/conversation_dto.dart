class ConversationDTO {
  String conversationId;
  String contactId;

  ConversationDTO(this.conversationId,this.contactId);

  factory ConversationDTO.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {'id': String id, 'contactId': String contactId} => ConversationDTO(id, contactId),
      _ => throw const FormatException('Failed to get contact.'),
    };
  }
}
