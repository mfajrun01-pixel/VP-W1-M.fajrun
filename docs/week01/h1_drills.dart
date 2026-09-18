class MenuItem {
  final String name;
  final double price;
  final double? discountPercent;

  MenuItem({
    required this.name,
    required this.price,
    this.discountPercent,
  });

  double finalPrice() {
    final discount = discountPercent ?? 0;
    return price * (1 - (discount / 100));
  }
}

void main() {
  List<MenuItem> menuList = [
    MenuItem(name: 'Nasi Goreng', price: 20000, discountPercent: 10),
    MenuItem(name: 'Es Teh Manis', price: 5000),
    MenuItem(name: 'Mie Ayam', price: 12000, discountPercent: 5),
    MenuItem(name: 'Kopi Hitam', price: 10000),
  ];

  List<String> allNames = menuList.map((item) => item.name).toList();

  List<MenuItem> cheapItems =
  menuList.where((item) => item.finalPrice() < 15000).toList();

  double totalPrice =
  menuList.fold(0, (sum, item) => sum + item.finalPrice());

  print('Semua Nama Menu: $allNames');
  print('Menu < Rp 15.000: ${cheapItems.map((e) => e.name).toList()}');
  print('Total Harga: Rp $totalPrice');
}