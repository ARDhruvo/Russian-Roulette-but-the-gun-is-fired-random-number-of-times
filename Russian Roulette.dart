/* 
 * @author Kashikizu/ARDhruvo
 * Initial Completion Date: 25/03/2024 (dd/mm/yyyy)
 */

import 'dart:math';

void main() {
  //Starts the game
  RussianRoulette fire = RussianRoulette();
  fire.ocd();
}

class RussianRoulette extends Game {
  RussianRoulette() {
    //Determines a random slot
    int bullet = getLuck(), lifeCheck = 1;
    print("Gun was loaded");
    ocd();
    //Inserts the bullet in a random slot
    slots[bullet] = 1;
    //Main Game
    lifeCheck = shoot(slots, lifeCheck);
    //Gives a realistic slot value instead of list index
    bullet++;
    print("Bullet was in slot number $bullet");
    if (lifeCheck == 1) {
      print("You made it out alive");
    } else {
      print("You lost");
    }
  }
}

class Game extends Revolver {
  Game() {}

  //Main Game
  int shoot(List<int> gun, int lifeCheck) {
    //Determines a random number of shots that will be taken
    int attempt = getLuck();
    if (attempt == 0) {
      print("You were not brave enough to shoot");
      ocd();
    } else {
      print("Gun was decided to be fired ${attempt + 1} times");
      ocd();
      //Checks the shot
      for (int i = 0; i <= attempt; i++) {
        int slot = i + 1;
        print("Shot #$slot fired...");
        if (gun[i] == 1) {
          print("It had the bullet. Better luck next time!");
          lifeCheck = 0;
          ocd();
          break;
        } else {
          print("It was empty");
          ocd();
        }
      }
    }
    return lifeCheck;
  }
}

class Revolver {
  //Gun
  List<int> slots = [0, 0, 0, 0, 0, 0];

  Revolver() {}

  //Returns random value
  int getLuck() {
    int luck = (Random().nextInt(6969)) % 6;
    return luck;
  }

  void ocd() {
    print("");
  }
}
