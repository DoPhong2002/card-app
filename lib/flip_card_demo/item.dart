class Item {
  final String code;
  final String image;
  bool isFlip = false;

  Item(this.code, this.image);

  static List<Item> getLevel1() {
    final listItem = <Item>[];
    listItem.add(Item('Chicken', 'assets/chicken1.jpeg'));
    listItem.add(Item('Cat', 'assets/cat1.jpeg'));
    listItem.add(Item('Chicken', 'assets/chicken2.jpeg'));
    listItem.add(Item('Dog', 'assets/dog1.jpeg'));
    listItem.add(Item('Cat', 'assets/cat2.jpeg'));
    listItem.add(Item('Dog', 'assets/dog2.jpeg'));
    listItem.add(Item('Pikachu', 'assets/pikachu1.jpeg'));
    listItem.add(Item('Pikachu', 'assets/pikachu2.jpeg'));
    listItem.add(Item('Lion', 'assets/Lion1.jpeg'));
    listItem.add(Item('Lion', 'assets/Lion2.jpeg'));
    listItem.add(Item('sadBoy', 'assets/sadBoy1.jpeg'));
    listItem.add(Item('sadBoy', 'assets/sadBoy2.jpeg'));
    listItem.shuffle();
    return listItem;
  }
}
