# Screen Map — Week 05 Preparation

Overview of the application screen hierarchy and navigation flow in preparation for Week 5 routing setup.

```
+-------------------+
|    HomeScreen     |  (Initial Landing Screen)
+-------------------+
          |
          v  (Navigate to Game Backlog)
+-------------------+
|    GameScreen     |  (Backlog Manager - Week 03/04 Focus)
+-------------------+
     |         |
     |         v  (Tap Game Card)
     |    +--------------------+
     |    |  GameDetailScreen  |  (View / Edit Game Status)
     |    +--------------------+
     |
     v  (Tap Add FAB)
+-------------------+
|   AddGameScreen   |  (Create New Backlog Item)
+-------------------+
```

## Navigation Flow
1. **HomeScreen -> GameScreen**: User navigates from main Warung Digital home to GameVault menu.
2. **GameScreen -> GameDetailScreen**: User selects a game card from the backlog list/grid.
3. **GameScreen -> AddGameScreen**: User triggers the FloatingActionButton to add a new game entry.
