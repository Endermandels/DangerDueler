# Closed

1. Make player sprites
2. Make world tiles
3. Place world tiles
    - Floor variation
    - Grass
    - Trees
    - Cliffs
4. Make player prefab
    - Movement
    - SFX

# Open

5. Make 3 monster sprites
6. Make monster prefabs
    - State machine
        - Idle
        - Wander
        - Chase player
    - SFX

# Backlog

- Transition to battle scene upon colliding with an enemy
- Make debug console
- Make battle player sprites
- Make battle monster sprites
- Make battle UI
- Make turn based combat
- Add battle music and SFX
- Transition to overworld scene upon enemy dying
- Make game over scene
- Transition to game over scene upon player dying
- Make boss monster prefab
- Make game win scene
- Transition to game win scene upon boss dying
- Make taming ally action
- Make ally monster prefab
- Make main menu scene
- Add any SFX and music that is missing

# Deliverables

- Overworld
    - Player
        * Move around
        * Command allies to attack other monsters
    - Monsters
        - Boss Monster
            * Extra stats
            * Physically larger
        - Allied Monsters
            * Follow Player
            * Attack on player's command
        - Enemy Monsters
            * Wander around
            * Some chase player
            * Some attack player
- Battle Scene
    - UI
        * All combatants show health and mana
        * Selected combatant shows actions in front and attack it to select
            Actions are stacked on top of each other
    - Turn based combat
        * If the player or an allied monster attacked an enemy in the overworld, 
            it is attacked before the battle starts; vice versa
        * Goes from highest speed to lowest speed
        * Abilities cost mana
    - Taming Enemy Monsters
        * Upon having one enemy left, if the player's XP exceeds that of the enemy,
            option to tame the enemy will be available
        * If tame enemy is selected, one of two things happen depending on XP disparity:
            - enemy will be added to player roster, player gains XP, and battle ends
            - enemy will not surrender, moving to the next monster's turn
    - Player
        * If player dies, game over
        * Choose an action:
            - Attack
            - Ability
            - Item (none for MVP)
            - Tame
            - Flee
    - Allied Monsters
        * If allied monster dies, faints and gets revived after battle
        * Choose an action:
            - Attack
            - Ability
            - Pass
    - Enemy Monsters
        * If enemy monster dies, all party members get XP
        * Choose an action (randomly or using a heuristic):
            - Attack
            - Ability
    - Leveling Up
        * Upon reaching an XP threshold, level up
        * Upon leveling up:
            - increase stats
            - choose a stat to boost a random amount
            - pick a new ability every 5 levels 
    - After Combat
        * Revive all fainted monsters
        * Set player and allied monsters to full health
- Main Menu
    - Play
    - Quit