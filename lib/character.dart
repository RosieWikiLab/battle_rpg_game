import 'dart:math';

import 'package:battle_rpg_game/monster.dart';

class Character {
  String name;
  int hp;
  int attack;
  int defense;

  Character({required this.name, required this.hp, required this.attack, required this.defense});  

  Monster attackMonster(Monster monster) {
    monster.hp -= attack;
    int damage = monster.hp < attack ? monster.hp : attack;
    print('$name이(가) ${monster.name}에게 $damage의 데미지를 입혔습니다.');
    return monster;
  }

  void defend() {
    // print('$name이(가) 방어 태세를 취하여 $attack 만큼 체력을 얻었습니다.');
  }

  void showStatus() {
    print('$name - 체력: $hp, 공격력: $attack, 방어력: $defense');
  }
}