import 'package:flutter/material.dart';
import 'widgets/game_header.dart';
import 'widgets/game_search_bar.dart';
import 'widgets/game_item_card.dart';
import 'widgets/empty_game_state.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}
class _GameScreenState extends State<GameScreen> {
  String _query = '';
  final TextEditingController _searchController = TextEditingController();

  // Data dummy game
  final List<Map<String, dynamic>> _games = [
    {'id': '1', 'title': 'Cyberpunk 2077', 'platform': 'PC', 'status': 'Playing'},
    {'id': '2', 'title': 'Elden Ring', 'platform': 'PS5', 'status': 'Backlog'},
    {'id': '3', 'title': 'Hades II', 'platform': 'PC', 'status': 'Completed'},
  ];

  void _clearSearch() {
    setState(() {
      _searchController.clear();
      _query = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    final visibleGames = _games.where((game) {
      return game['title'].toLowerCase().contains(_query.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('GameVault - Backlog Manager'),
      ),
      body: Column(
        children: [
          const GameHeader(),

          GameSearchBar(
            controller: _searchController,
            query: _query,
            onChanged: (value) => setState(() => _query = value),
            onClear: _clearSearch,
          ),

          Expanded(
            child: visibleGames.isEmpty
                ? EmptyGameState(
              query: _query,
              onResetSearch: _clearSearch,
            )
                : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: visibleGames.length,
              itemBuilder: (context, index) {
                final game = visibleGames[index];
                return GameItemCard(
                  game: game,
                  onTap: () {
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}