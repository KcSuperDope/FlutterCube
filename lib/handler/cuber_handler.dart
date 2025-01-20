import 'dart:async';
import 'package:cuber/cuber.dart';
import 'package:cubestation_flutter/cube/cube_constant.dart';
import 'package:cubestation_flutter/cube/cube_controller.dart';
import 'package:get/get.dart';

///cuber填色
class CuberHandler {
  static Future<List<Move>> getSequence(Cube targetCube) {
    Cube cube = Get.find<CubeController>().cube;
    final Cube cubeTemp = cube.patternize(targetCube);
    final Solution? solution = cubeTemp.solve(maxDepth: 25);
    return Future.value(solution?.algorithm.moves);
  }

  static bool isLevel1_1_1(String definition) {
    if (definition[12] == U || definition[21] == U || definition[39] == U || definition[48] == U) {
      return true;
    }
    return false;
  }

  static bool isLevel1_1_2(String definition) {
    if (definition[5] == U || definition[7] == U || definition[3] == U || definition[1] == U) {
      return true;
    }
    return false;
  }

  static bool isLevel1_1_3(String definition) {
    if (definition[16] == U || definition[25] == U || definition[43] == U || definition[52] == U) {
      return true;
    }
    return false;
  }

  static bool isLevel1_2(String definition) {
    if (definition[32] == U && definition[28] == U && definition[30] == U && definition[34] == U) {
      return true;
    }
    return false;
  }

  static bool isLevel1_3(String definition) {
    if (definition[5] == U &&
        definition[10] == R &&
        definition[7] == U &&
        definition[19] == F &&
        definition[3] == U &&
        definition[37] == L &&
        definition[1] == U &&
        definition[46] == B) {
      return true;
    }
    return false;
  }

  static bool isLevel2_1_1(String definition) {
    if (definition[5] == U &&
        definition[10] == R &&
        definition[7] == U &&
        definition[19] == F &&
        definition[3] == U &&
        definition[37] == L &&
        definition[1] == U &&
        definition[46] == B &&
        definition[26] == F &&
        definition[15] == U &&
        definition[29] == R) {
      return true;
    }
    return false;
  }

  static bool isLevel2_1_2(String definition) {
    if (definition[5] == U &&
        definition[10] == R &&
        definition[7] == U &&
        definition[19] == F &&
        definition[3] == U &&
        definition[37] == L &&
        definition[1] == U &&
        definition[46] == B &&
        definition[26] == U &&
        definition[15] == R &&
        definition[29] == F) {
      return true;
    }
    return false;
  }

  static bool isLevel2_1_3(String definition) {
    if (definition[5] == U &&
        definition[10] == R &&
        definition[7] == U &&
        definition[19] == F &&
        definition[3] == U &&
        definition[37] == L &&
        definition[1] == U &&
        definition[46] == B &&
        definition[26] == R &&
        definition[15] == F &&
        definition[29] == U) {
      return true;
    }
    return false;
  }

  static bool isLevel2_2(String definition) {
    if (definition[5] == U &&
        definition[10] == R &&
        definition[7] == U &&
        definition[19] == F &&
        definition[3] == U &&
        definition[37] == L &&
        definition[1] == U &&
        definition[46] == B &&
        definition[8] == U &&
        definition[20] == F &&
        definition[9] == R &&
        definition[6] == U &&
        definition[18] == F &&
        definition[38] == L &&
        definition[0] == U &&
        definition[36] == L &&
        definition[47] == B &&
        definition[2] == U &&
        definition[11] == R &&
        definition[45] == B) {
      return true;
    }
    return false;
  }

  static bool isC(String definition) {
    if (definition[5] == U &&
        definition[10] == R &&
        definition[7] == U &&
        definition[19] == F &&
        definition[3] == U &&
        definition[37] == L &&
        definition[1] == U &&
        definition[46] == B) {
      return true;
    }
    return false;
  }

  static bool isF(String definition) {
    // const String solvedCubO = 'UUUUUUUUURRRRRRNNNFFFFFFNNNDDDDDDDDDLLLLLLNNNBBBBBBNNN';
    if (definition.substring(0, 15) +
            definition.substring(18, 24) +
            definition[31] +
            definition.substring(36, 42) +
            definition.substring(45, 51) ==
        'UUUUUUUUURRRRRRFFFFFFDLLLLLLBBBBBB') {
      return true;
    }
    return false;
  }

  static bool isO(String definition) {
    // const String CubeO = 'UUUUUUUUURRRRRRNNNFFFFFFNNNDDDDDDDDDLLLLLLNNNBBBBBBNNN';
    if (definition.substring(0, 15) +
            definition.substring(18, 24) +
            definition.substring(27, 42) +
            definition.substring(45, 51) ==
        'UUUUUUUUURRRRRRFFFFFFDDDDDDDDDLLLLLLBBBBBB') {
      return true;
    }
    return false;
  }

  static bool isSolved(String definition) {
    if (definition == Cube.solved.definition) {
      return true;
    }
    return false;
  }
}

const String solvedCube = 'UUUUUUUUURRRRRRRRRFFFFFFFFFDDDDDDDDDLLLLLLLLLBBBBBBBBB';
const String cubeNotation = '''
             |************|
             |*U1**U2**U3*|
             |************|
             |*U4**U5**U6*|
             |************|
             |*U7**U8**U9*|
 ************|************|************|************
 *L1**L2**L3*|*F1**F2**F3*|*R1**R2**R3*|*B1**B2**B3*
 ************|************|************|************
 *L4**L5**L6*|*F4**F5**F6*|*R4**R5**R6*|*B4**B5**B6*
 ************|************|************|************
 *L7**L8**L9*|*F7**F8**F9*|*R7**R8**R9*|*B7**B8**B9*
 ************|************|************|************
             |*D1**D2**D3*|
             |************|
             |*D4**D5**D6*|
             |************|
             |*D7**D8**D9*|
             |************|
''';
