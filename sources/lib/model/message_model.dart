import '../data/DTOs/message_dto.dart';

class MessageModel {
  String content;
  DateTime date;
  String senderId;

  MessageModel(this.content, this.date, this.senderId);

  factory MessageModel.DTOToPOCO(MessageDTO DTO) =>
      MessageModel(DTO.content, DTO.date, DTO.senderId);
}
