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
    stdout.write('캐릭터의 이름을 입력하세요: ');
    characterName = stdin.readLineSync() ?? '';
    RegExp regExp = RegExp(r'^[a-zA-Z가-힣]+$');
    if(!regExp.hasMatch(characterName)){
      print('캐릭터 이름은 한글 또는 영문으로만 입력해주세요.');
    } else {
      break;
    }
  }

  print('');

  Monster monster = setMonster(monsterFile);  // 초기 몬스터 세팅
  Character character = setCharacter(characterFile, characterName); // 초기 캐릭터 세팅

  printInfo(character, monster);  // 게임 시작

  // 필수3 - 게임 종료 후 결과를 파일에 저장하는 기능
  print('결과를 저장하시겠습니까? (y/n): ');
  if(stdin.readLineSync() == 'y') {
    saveResult(character, 'Y'); // 일단 승리로 설정
  }
}

Monster setMonster(File monsterFile) {
  int ramdomMonterIdx = Random().nextInt(monsterFile.readAsLinesSync().length);
  var monsterInfo = monsterFile.readAsLinesSync()[ramdomMonterIdx].split(',');
  var monster = Monster(name: monsterInfo[0], hp: int.parse(monsterInfo[1]), maxAttack: int.parse(monsterInfo[2]));
  monster.setAttackRange();
  return monster;
}

Character setCharacter(File characterFile, String characterName) {
  var characterInfo = characterFile.readAsLinesSync()[0].split(',');
  var character = Character(name: characterName, hp: int.parse(characterInfo[0]), attack: int.parse(characterInfo[1]), defense: int.parse(characterInfo[2]));
  return character;
}

void printInfo(Character character, Monster monster) {
  print('게임을 시작합니다!');
  print('${character.name} - 체력: ${character.hp}, 공격력: ${character.attack}, 방어력: ${character.defense}');
  print('');
  
  print('새로운 몬스터가 나타났습니다!');
  print('${monster.name} - 체력: ${monster.hp}, 공격력: ${monster.ramdomAttackRange}, 방어력: ${monster.defense}'); 
  print('');
}

void saveResult(Character character, String result) {
  File file = File('../lib/result.txt');
  if (file.existsSync()) {
    file.writeAsStringSync('${character.name},${character.hp},$result\n', mode: FileMode.append);
  } else {
    file.writeAsStringSync('${character.name},${character.hp},$result\n');
  }
}