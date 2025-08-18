class Story {
  final String name;
  final String time;
  final List<String> media;

  Story({
    required this.name,
    required this.time,
    this.media = const ['images/story1.jpg', 'images/story2.jpg'],
  });
}
