class User{
  final String id;
  final String profile_image_url;

  User({required this.id, required this.profile_image_url});

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      id : json['id'],
      profile_image_url : json['profile_image_url'],
    ); }
}