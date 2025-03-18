import 'dart:io';
import 'dart:math';

import 'package:battle_rpg_game/character.dart';
import 'package:battle_rpg_game/monster.dart';

class Game {
  Character character;
  List<Monster> monsters;
    
  Game({required this.character, required this.monsters});  

  bool startGame() {
    print('게임을 시작합니다!');
    character.showStatus();
    print('');

    final int monsterCount = monsters.length;

    do{
      if(monsters.length != monsterCount) {
        print('다음 몬스터와 대결하시겠습니까? (y/n): ');
        if(stdin.readLineSync() == 'n') { break; }
      } 

      Monster monster = getRandomMonster();
  
      print('새로운 몬스터가 나타났습니다!');
      monster.showStatus();
      print('');

      battle(monster);
    } while(monsters.isNotEmpty && character.hp > 0);
    
    if(monsters.isEmpty) {
      print('축하합니다! 모든 몬스터를 물리쳤습니다.');
      return true;
    }
    
    return false;
  }

  void battle(Monster monster) {
    do {
      print('${character.name} 턴');
      print('행동을 선택하세요 (1: 공격, 2: 방어): ');
      if(stdin.readLineSync() == '1') { character.attackMonster(monster); }
      else { character.defend(); }
      print('');
      
      print('${monster.name} 턴');
      monster.attackCharacter(character);
      character.showStatus();
      monster.showStatus();
      print('');
    } while (monster.hp > 0 && character.hp > 0);
    
    if(monster.hp <= 0) {
      monsters.remove(monster);
      print('${monster.name}을(를) 물리쳤습니다!');
      print('');
    }
  }

  Monster getRandomMonster() {
    Monster monster = monsters[Random().nextInt(monsters.length)];
    monster.setRandomAttack();
    return monster;
  }
}