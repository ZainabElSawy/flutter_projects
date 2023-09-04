class ChatUser {
  String? createdAt;
  String? phone;
  String? aboutYou;
  String? imageUrl;
  String? name;
  bool? isOnline;
  String? userId;
  String? email;
  String? lastSeen;

  ChatUser(
      {this.createdAt,
      this.phone,
      this.aboutYou,
      this.imageUrl,
      this.name,
      this.isOnline,
      this.userId,
      this.email,
      this.lastSeen});

  ChatUser.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    phone = json['phone'];
    aboutYou = json['aboutYou'];
    imageUrl = json['imageUrl'];
    name = json['name'];
    isOnline = json['isOnline'];
    userId = json['userId'];
    email = json['email'];
    lastSeen = json['lastSeen'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['createdAt'] = createdAt;
    data['phone'] = phone;
    data['aboutYou'] = aboutYou;
    data['imageUrl'] = imageUrl;
    data['name'] = name;
    data['isOnline'] = isOnline;
    data['userId'] = userId;
    data['email'] = email;
    data['lastSeen'] = lastSeen;
    return data;
  }
}
