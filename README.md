## Problem statement 2048:


Develop a functional implementation of the popular game "2048" using any language of your choice. The goal of the game is to combine tiles with the same number to reach the tile numbered 2048. The game should be playable through a user interface that displays the game board and allows the user to make moves (up, down, left, right) to combine tiles and progress towards the goal tile.

### Requirements:

  - The default should have a 4x4 grid of tiles that start with two random tiles numbered 2 or 4.
  - The game should allow the player to make moves by sliding the tiles in the four directions (up, down, left, right).
  - When two tiles with the same number collide, they should merge into one tile with their sum as the number.
  - A new tile with a random number (either 2 or 4) should be added to the board after each move.
  - The game should end when the player reaches the 2048 tile or when there are no more possible moves


### 2048

2048 is a single-player mathematical puzzle game where you merge tiles with equal numbers. The goal of the game is to merge the tiles until you have 2048. With each merger of tiles the value doubles. You can slide tiles in any direction to make the identical tiles merge. The grid on which you play is 4x4 so you don't have a lot of space to maneuvre. Try keep some free spaces.

### How to play 2048?
Use your arrow keys to slide the tiles in the direction you want. When tiles with equal numbers collide, they will merge into one tile and double in value.

  1. The game starts with two tiles with the number 2 on the grid.
  2. Use the arrow keys (up, down, left, right) to move the tiles in the desired direction.
  3. When two tiles with the same number touch, they merge into a new tile with twice the value.
  4. Every time you move a tile, a new tile with the number 2 or 4 appears on the grid.
  5. The game ends when there are no more moves available, i.e. the grid is full and no adjacent tiles have the same value.



## Running client side 

  ```
  # To run the flutter application one should must have FLUTTER SDK installed in their system 
  
  flutter pub get
  open web simulator from IDE
  flutter run
  
  ```


## Screenshots

![image](https://github.com/Priyammm05/exponent-energy-2048/assets/80326453/460c37ac-c8a7-4e69-8bc4-5d993368cf60)

