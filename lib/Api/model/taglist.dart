class Tag {
  final String id;
  final String iconUrl;
  final int followersCount;
  final int itemsCount;

  Tag({
    required this.id,
    required this.iconUrl,
    required this.followersCount,
    required this.itemsCount,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      id: json['id'],
      iconUrl: json['icon_url'],
      followersCount: json['followers_count'],
      itemsCount: json['items_count'],
    );
  }
}
