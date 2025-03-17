import 'package:console_shoppingmaill/character.dart';

class Monster {
  String name;
  int hp;
  int ramdomAttackRange; // 몬스터의 공격력은 캐릭터의 방어력보다 작을 수 없습니다. 랜덤으로 지정하여 캐릭터의 방어력과 랜덤 값 중 최대값으로 설정해주세요.
  int defense = 0;

  Monster({required this.name, required this.hp, required this.ramdomAttackRange, required this.defense});  

  void attackCharacter(Character character) {
//         - 캐릭터에게 공격을 가하여 피해를 입힙니다.
//         - 캐릭터에게 입히는 데미지는 몬스터의 공격력에서 캐릭터의 방어력을 뺀 값이며, 최소 데미지는 0 이상입니다.
  }

  void showStatus() {
//         - 몬스터의 현재 체력과 공격력을 매 턴마다 출력합니다.
  }
}
