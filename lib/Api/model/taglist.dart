class TagList {
  final String id;
  final String icon_url;
  final int followers_count;
  final int items_count;

  TagList({
    required this.id,
    required this.icon_url,
    required this.followers_count,
    required this.items_count,
  });

  factory TagList.fromJson(Map<String, dynamic> json) {
    return TagList(
      id: json['id'],
      icon_url: json['icon_url'],
      followers_count: json['followers_count'],
      items_count: json['items_count'],
    );
  }
}
