import 'package:console_shoppingmaill/monster.dart';

class Character {
  String name;
  int hp;
  int attack;
  int defense;

  Character({required this.name, required this.hp, required this.attack, required this.defense});  

  void attackMonster(Monster monster) {
    monster.hp -= attack;
  }

  void defend() {
    // 특정 행동 수행
    // 예) 대결 상대인 몬스터가 입힌 데미지만큼 캐릭터의 체력을 상승시킵니다.
  }

  void showStatus() {
    // 캐릭터의 현재 체력, 공격력, 방어력을 매 턴마다 출력합니다.
  }
}