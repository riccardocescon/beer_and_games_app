abstract class Item {
  final String id;
  final String name;
  List<int>? imageBytes;

  Item({required this.id, required this.name, this.imageBytes});
}
