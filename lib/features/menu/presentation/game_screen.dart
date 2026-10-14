import 'package:flutter/material.dart';
import 'widgets/game_header.dart';
import 'widgets/game_search_bar.dart';
import 'widgets/game_item_card.dart';
import 'widgets/empty_game_state.dart';

enum _DataPreset {
  normal('Normal (3 Items)'),
  longName('200-Char Name (Test 5)'),
  empty('Zero Items (Test 6)'),
  big('500 Items (Test 7)');

  const _DataPreset(this.label);
  final String label;
}

class GameScreen extends StatefulWidget {
  const GameScreen({
    super.key,
    this.initialGames,
    this.themeMode = ThemeMode.system,
    this.onThemeModeChanged,
  });

  final List<Map<String, dynamic>>? initialGames;
  final ThemeMode themeMode;
  final ValueChanged<ThemeMode>? onThemeModeChanged;

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  String _query = '';
  final TextEditingController _searchController = TextEditingController();

  _DataPreset _dataPreset = _DataPreset.normal;
  bool _showFakeKeyboard = false;

  static const List<Map<String, dynamic>> _defaultGames = [
    {'id': '1', 'title': 'Cyberpunk 2077', 'platform': 'PC', 'status': 'Playing'},
    {'id': '2', 'title': 'Elden Ring', 'platform': 'PS5', 'status': 'Backlog'},
    {'id': '3', 'title': 'Hades II', 'platform': 'PC', 'status': 'Completed'},
  ];

  static const List<Map<String, dynamic>> _longNameGames = [
    {
      'id': '1',
      'title':
          'Super Extra Ultra Long Game Title Name That Contains Over Two Hundred Characters To Test Overflow Prevention And Text Wrapping Strategies In Responsive Layouts Perfectly Without Any Yellow Stripes Warning',
      'platform': 'PC',
      'status': 'Playing',
    },
    {'id': '2', 'title': 'Elden Ring', 'platform': 'PS5', 'status': 'Backlog'},
  ];

  late final List<Map<String, dynamic>> _bigGames = List.generate(
    500,
    (i) => {
      'id': 'g${i + 1}',
      'title': 'Game #${i + 1} - Epic Adventure',
      'platform': i % 2 == 0 ? 'PC' : 'PS5',
      'status': i % 3 == 0 ? 'Playing' : (i % 3 == 1 ? 'Backlog' : 'Completed'),
    },
  );

  List<Map<String, dynamic>> get _games {
    if (widget.initialGames != null) return widget.initialGames!;
    return switch (_dataPreset) {
      _DataPreset.normal => _defaultGames,
      _DataPreset.longName => _longNameGames,
      _DataPreset.empty => const [],
      _DataPreset.big => _bigGames,
    };
  }

  void _clearSearch() {
    setState(() {
      _searchController.clear();
      _query = '';
    });
  }

  void _openTestingPanel() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            final text = Theme.of(context).textTheme;

            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Panel Pengujian Interaktif', style: text.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  const Divider(),
                  const SizedBox(height: 8),

                  // 1. Dark Mode Toggle
                  Text('Mode Tampilan (Test 9)', style: text.labelLarge),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: [
                      ChoiceChip(
                        label: const Text('Light Mode ☀️'),
                        selected: widget.themeMode == ThemeMode.light,
                        onSelected: (_) {
                          widget.onThemeModeChanged?.call(ThemeMode.light);
                          setModalState(() {});
                        },
                      ),
                      ChoiceChip(
                        label: const Text('Dark Mode 🌙'),
                        selected: widget.themeMode == ThemeMode.dark,
                        onSelected: (_) {
                          widget.onThemeModeChanged?.call(ThemeMode.dark);
                          setModalState(() {});
                        },
                      ),
                      ChoiceChip(
                        label: const Text('System ⚙️'),
                        selected: widget.themeMode == ThemeMode.system,
                        onSelected: (_) {
                          widget.onThemeModeChanged?.call(ThemeMode.system);
                          setModalState(() {});
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // 2. Fake Keyboard Toggle
                  Text('Simulasi Keyboard (Test 8)', style: text.labelLarge),
                  const SizedBox(height: 8),
                  FilterChip(
                    avatar: const Icon(Icons.keyboard, size: 18),
                    label: Text(_showFakeKeyboard ? 'Keyboard Aktif (240dp)' : 'Buka Fake Keyboard'),
                    selected: _showFakeKeyboard,
                    onSelected: (val) {
                      setState(() => _showFakeKeyboard = val);
                      setModalState(() {});
                    },
                  ),
                  const SizedBox(height: 16),

                  // 3. Data Presets
                  Text('Preset Data Pengujian', style: text.labelLarge),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      for (final preset in _DataPreset.values)
                        ChoiceChip(
                          label: Text(preset.label),
                          selected: _dataPreset == preset,
                          onSelected: (_) {
                            setState(() => _dataPreset = preset);
                            setModalState(() {});
                          },
                        ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final visibleGames = _games.where((game) {
      return game['title'].toString().toLowerCase().contains(_query.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('GameVault - Backlog Manager'),
        actions: [
          IconButton(
            tooltip: 'Panel Pengujian Interaktif',
            icon: const Icon(Icons.tune),
            onPressed: _openTestingPanel,
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isTabletOrLandscape = constraints.maxWidth >= 600;

          return Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          const GameHeader(),
                          GameSearchBar(
                            controller: _searchController,
                            query: _query,
                            onChanged: (value) => setState(() => _query = value),
                            onClear: _clearSearch,
                          ),
                        ],
                      ),
                    ),
                    if (visibleGames.isEmpty)
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: EmptyGameState(
                          key: const Key('empty-state'),
                          query: _query,
                          onResetSearch: _clearSearch,
                        ),
                      )
                    else if (isTabletOrLandscape)
                      SliverPadding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        sliver: SliverGrid.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            mainAxisExtent: 130,
                          ),
                          itemCount: visibleGames.length,
                          itemBuilder: (context, index) {
                            final game = visibleGames[index];
                            return GameItemCard(
                              game: game,
                              onTap: () {},
                            );
                          },
                        ),
                      )
                    else
                      SliverPadding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        sliver: SliverList.builder(
                          itemCount: visibleGames.length,
                          itemBuilder: (context, index) {
                            final game = visibleGames[index];
                            return GameItemCard(
                              game: game,
                              onTap: () {},
                            );
                          },
                        ),
                      ),
                  ],
                ),
              ),
              if (_showFakeKeyboard) const _FakeKeyboard(),
            ],
          );
        },
      ),
    );
  }
}

class _FakeKeyboard extends StatelessWidget {
  const _FakeKeyboard();

  static const List<String> _rows = ['qwertyuiop', 'asdfghjkl', 'zxcvbnm'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      color: const Color(0xFF2B2F33),
      padding: const EdgeInsets.all(6),
      child: Column(
        children: [
          for (final row in _rows)
            Expanded(
              child: Row(
                children: [
                  for (final letter in row.split('')) Expanded(child: _Key(letter)),
                ],
              ),
            ),
          const Expanded(
            child: Row(
              children: [
                Expanded(flex: 2, child: _Key('123')),
                Expanded(flex: 6, child: _Key('spasi')),
                Expanded(flex: 2, child: _Key('⏎')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Key extends StatelessWidget {
  const _Key(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: const Color(0xFF4A4F55),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: FittedBox(
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: Text(
                label,
                style: const TextStyle(color: Color(0xCCFFFFFF), fontSize: 13),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
