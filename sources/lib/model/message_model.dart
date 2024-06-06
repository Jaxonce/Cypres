import '../data/DTOs/message_dto.dart';

class MessageModel {
  String content;
  DateTime date;
  String senderId;
  String receiverId;

  MessageModel(this.content, this.date, this.senderId, this.receiverId);

  factory MessageModel.DTOToPOCO(MessageDTO DTO) =>
      MessageModel(DTO.content, DTO.date, DTO.senderId, DTO.receiverId);
}
