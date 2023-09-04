class ChatMessage {
  String? textMessage;
  String? sender;
  String? recever;
  String? imgUrl;
  String? sendTime;

  ChatMessage({this.textMessage, this.sender, this.recever, this.sendTime});

  ChatMessage.fromJson(Map<String, dynamic> json) {
    textMessage = json['textMessage'];
    sender = json['sender'];
    recever = json['recever'];
    sendTime = json['sendTime'];
    imgUrl = json['imgUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['textMessage'] = textMessage;
    data['sender'] = sender;
    data['recever'] = recever;
    data['sendTime'] = sendTime;
    data['imgUrl'] = imgUrl;

    return data;
  }
}
