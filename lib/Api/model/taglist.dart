class TagList {
  final String id;
  final String iconUrl;
  final int followersCount;
  final int itemsCount;

  TagList({
    required this.id,
    required this.iconUrl,
    required this.followersCount,
    required this.itemsCount,
  });

  factory TagList.fromJson(Map<String, dynamic> json) {
    return TagList(
      id: json['id'],
      iconUrl: json['icon_url'],
      followersCount: json['followers_count'],
      itemsCount: json['items_count'],
    );
  }
}
