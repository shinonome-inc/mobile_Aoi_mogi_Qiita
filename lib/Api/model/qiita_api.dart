class QiitaApi{
  final String title;
  final String created_at;
  final String url;
  final User user;

  QiitaApi({required this.url, required this.title,required this.created_at, required this.user});

  factory QiitaApi.fromJson(Map<String, dynamic>json){
    return QiitaApi(
    title : json['title'] ,
    created_at : json['created_at'],
    url : json['url'],
    user : User.fromJson(json['user']),
    );
  }
}

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