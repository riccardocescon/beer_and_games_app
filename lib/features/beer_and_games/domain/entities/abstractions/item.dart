import 'dart:typed_data';

abstract class Item {
  final String id;
  final String name;
  Uint8List? imageBytes;

  Item({required this.id, required this.name, this.imageBytes});
}
