import 'package:flutter/material.dart';
import 'widgets/empty_menu_state.dart';
import 'widgets/menu_header.dart';
import 'widgets/menu_item_card.dart';
import 'widgets/menu_search_field.dart';
import 'widgets/total_bar.dart';

class MenuItem {
  const MenuItem({
    required this.id,
    required this.name,
    required this.price,
    this.promo = false,
  });

  final String id;
  final String name;
  final int price;
  final bool promo;
}

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final List<MenuItem> _items = [
    const MenuItem(id: 'm1', name: 'Nasi Goreng Spesial', price: 18000, promo: true),
    const MenuItem(id: 'm2', name: 'Mie Ayam Bakso', price: 15000),
    const MenuItem(id: 'm3', name: 'Sate Ayam (10 tusuk)', price: 25000),
    const MenuItem(id: 'm4', name: 'Ayam Geprek Sambal Matah', price: 20000, promo: true),
    const MenuItem(id: 'm5', name: 'Soto Ayam Lamongan', price: 17000),
    const MenuItem(id: 'm6', name: 'Es Teh Manis', price: 5000),
    const MenuItem(id: 'm7', name: 'Es Jeruk Peras', price: 8000),
    const MenuItem(id: 'm8', name: 'Kopi Susu Gula Aren', price: 12000),
  ];

  final Map<String, int> _quantities = {};

  late final TextEditingController _searchController;
  late final ScrollController _listController;
  String _query = '';

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _listController = ScrollController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _listController.dispose();
    super.dispose();
  }

  void _clearSearch() {
    _searchController.clear();
    setState(() => _query = '');
  }

  @override
  Widget build(BuildContext context) {
    final visible = _items.where((item) {
      return _query.isEmpty ||
          item.name.toLowerCase().contains(_query.toLowerCase());
    }).toList();

    int total = 0;
    int lineCount = 0;
    _quantities.forEach((id, qty) {
      if (qty > 0) {
        lineCount++;
        for (final item in _items) {
          if (item.id == id) {
            total += item.price * qty;
          }
        }
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Warung Digital')),
      body: Column(
        children: [
          const MenuHeader(),
          MenuSearchField(
            controller: _searchController,
            query: _query,
            onChanged: (value) => setState(() => _query = value),
            onClear: _clearSearch,
          ),
          Expanded(
            child: visible.isEmpty
                ? EmptyMenuState(
              query: _query,
              onResetSearch: _clearSearch,
            )
                : ListView.builder(
              controller: _listController,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: visible.length,
              itemBuilder: (context, index) {
                final item = visible[index];
                final qty = _quantities[item.id] ?? 0;
                return MenuItemCard(
                  item: item,
                  quantity: qty,
                  onIncrement: () {
                    setState(() {
                      _quantities[item.id] = qty + 1;
                    });
                  },
                  onDecrement: () {
                    setState(() {
                      _quantities[item.id] = qty - 1;
                    });
                  },
                );
              },
            ),
          ),
          TotalBar(
            lineCount: lineCount,
            total: total,
            onSave: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Pesanan disimpan: Rp $total'),
                ),
              );
              setState(() => _quantities.clear());
            },
          ),
        ],
      ),
    );
  }
}