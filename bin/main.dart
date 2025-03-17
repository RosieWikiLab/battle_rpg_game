import 'dart:io';
import 'dart:math';

import 'package:console_shoppingmaill/character.dart';
import 'package:console_shoppingmaill/monster.dart';

void main() {
  // 필수1 = 파일로부터 데이터 읽어오기 기능
  var characterFile = File('../lib/characters.txt');
  var monsterFile = File('../lib/monsters.txt');
  // print(characterFile.readAsStringSync());

  String characterName;

  // 필수2 - 사용자로부터 캐릭터 이름 입력받기 기능
  while(true) {
    print('캐릭터의 이름을 입력하세요: ');
    characterName = stdin.readLineSync() ?? '';
    print(characterName);
    RegExp regExp = RegExp(r'^[a-zA-Z가-힣]+$');
    if(!regExp.hasMatch(characterName)){
      print('캐릭터 이름은 한글 또는 영문으로만 입력해주세요.');
    } else {
      break;
    }
  }

  // 초기 몬스터 세팅
  int ramdomMonterIdx = Random().nextInt(monsterFile.readAsLinesSync().length);
  var monsterInfo = monsterFile.readAsLinesSync()[ramdomMonterIdx].split(',');
  var monster = Monster(name: monsterInfo[0], hp: int.parse(monsterInfo[0]), maxAttack: int.parse(monsterInfo[1]));
  monster.setAttackRange();

  // 초기 캐릭터 세팅
  var characterInfo = characterFile.readAsLinesSync()[0].split(',');
  var character = Character(name: characterName, hp: int.parse(characterInfo[0]), attack: int.parse(characterInfo[1]), defense: int.parse(characterInfo[2]));

  // 게임 시작
  print('게임을 시작합니다!');

}