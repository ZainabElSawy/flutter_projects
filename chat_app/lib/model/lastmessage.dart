class LastMessage {
  String? lastMessage;
  String? sender;
  String? recever;
  String? sendTime;

  LastMessage({this.lastMessage, this.sender, this.recever, this.sendTime});

  LastMessage.fromJson(Map<String, dynamic> json) {
    lastMessage = json['last_message'];
    sender = json['sender'];
    recever = json['receiver'];
    sendTime = json['sendTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['last_message'] = lastMessage;
    data['sender'] = sender;
    data['receiver'] = recever;
    data['sendTime'] = sendTime;
    return data;
  }
}
