import 'dart:io';

import 'package:console_shoppingmaill/character.dart';
import 'package:console_shoppingmaill/monster.dart';

void main() {
  // 필수1 = 파일로부터 데이터 읽어오기 기능
  var characterFile = File('../lib/characters.txt');
  var monsterFile = File('../lib/monsters.txt');
  // print(characterFile.readAsStringSync());

  // 필수2 - 사용자로부터 캐릭터 이름 입력받기 기능
  while(true) {
    print('캐릭터의 이름을 입력하세요: ');
    String characterName = stdin.readLineSync() ?? '';
    print(characterName);
    RegExp regExp = RegExp(r'^[a-zA-Z가-힣]+$');
    if(!regExp.hasMatch(characterName)){
      print('캐릭터 이름은 한글 또는 영문으로만 입력해주세요.');
    } else {
      break;
    }
  }

}