import 'package:cubestation_flutter/src/teaching/teaching_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:zflutter/zflutter.dart';

class TeachingController extends GetxController {
  GetStorage localStorage = GetStorage();
  List<TeachingModel> list = [];
  List _getStars = [];
  final List _initStars = [
    [
      [0, 0, 0, 0, 0, 0],
      [0],
      [0]
    ],
    [
      [0, 0, 0],
      [0],
      [0]
    ],
    [
      [0, 0, 0],
      [0]
    ],
    [
      [0, 0, 0],
      [0]
    ],
    [
      [0, 0, 0],
      [0]
    ],
    [
      [0, 0, 0],
      [0]
    ],
    [
      [0, 0, 0],
      [0]
    ],
    [
      [0, 0, 0],
      [0]
    ],
    [
      [0, 0, 0],
      [0]
    ]
  ];

  @override
  void onInit() {
    _getStars = localStorage.read('getStars') ?? _initStars;
    list = [
      TeachingModel(
          level: '基础知识',
          goal: '基础知识',
          goalImage: 'icon_knowledge',
          allStarCount: 9,
          lock: false,
          teachingDialogModels: [
            TeachingDialogModel(
                goalImage: 'icon_knowledge',
                step: '第一步',
                teachingDialogItemModels: [
                  TeachingDialogItemModel(
                      formula: "初识三阶魔方",
                      explain: '三阶魔方是最常见的魔方，指结构为3×3×3的立方体魔方',
                      statusImage: 'cube',
                      getStarCount: _getStars[0]?[0]?[0] ?? 0,
                      teachingBasicsPlayModel: TeachingBasicsPlayModel(
                        order: '第一题',
                        question: '以下哪个是三阶魔方？',
                        image: 'question1',
                        options: [
                          OptionModel(text: 'A'),
                          OptionModel(text: 'B'),
                          OptionModel(text: 'C'),
                          OptionModel(text: 'D', right: true)
                        ],
                      )),
                  TeachingDialogItemModel(
                      formula: "魔方颜色",
                      explain: '魔方共有6个面6种颜色，主流颜色为：白、绿、红、蓝、橙、黄',
                      statusImage: 'cube',
                      teachingBasicsPlayModel: TeachingBasicsPlayModel(
                          order: '第二题',
                          question: '魔方有几个面？',
                          image: 'cube',
                          options: [
                            OptionModel(text: 'A 6个面', right: true),
                            OptionModel(text: 'B 7个面'),
                            OptionModel(text: 'C 8个面'),
                            OptionModel(text: 'D 9个面')
                          ])),
                  TeachingDialogItemModel(
                      formula: "中心块",
                      explain: '中间位置只有1种颜色的块称为中心块，魔方共有6个不同颜色的中心块',
                      statusImage: 'centers',
                      teachingBasicsPlayModel: TeachingBasicsPlayModel(
                          order: '第三题',
                          question: '下图魔方块的正确名称是什么？',
                          image: 'center',
                          options: [
                            OptionModel(text: 'A 棱块'),
                            OptionModel(text: 'B 角块'),
                            OptionModel(text: 'C 中心块', right: true),
                            OptionModel(text: 'D 单面块')
                          ])),
                  TeachingDialogItemModel(
                      formula: "中心块特点",
                      explain: '无论魔方有多乱，中心块的位置都是相对不变的',
                      statusImage: 'centers',
                      teachingBasicsPlayModel: TeachingBasicsPlayModel(
                          order: '第四题',
                          question: '下图魔方块的正确名称是什么？',
                          image: 'edge',
                          options: [
                            OptionModel(text: 'A 棱块', right: true),
                            OptionModel(text: 'B 角块'),
                            OptionModel(text: 'C 中心块'),
                            OptionModel(text: 'D 双面块')
                          ])),
                  TeachingDialogItemModel(
                      formula: "棱块",
                      explain: '中心块之间拥有两种颜色的块称为棱块，魔方共有12个不同的棱块',
                      statusImage: 'edges',
                      teachingBasicsPlayModel: TeachingBasicsPlayModel(
                          order: '第五题',
                          question: '下图魔方块的正确名称是什么？',
                          image: 'corner',
                          options: [
                            OptionModel(text: 'A 棱块'),
                            OptionModel(text: 'B 角块', right: true),
                            OptionModel(text: 'C 中心块'),
                            OptionModel(text: 'D 三面块')
                          ])),
                  TeachingDialogItemModel(
                      formula: "角块",
                      explain: '魔方顶角拥有三种颜色的块称为角块，魔方共有8个不同的棱块',
                      statusImage: 'corners',
                      teachingBasicsPlayModel: TeachingBasicsPlayModel(
                          order: '第六题',
                          question: '魔方的哪个块因为位置相对不变，常被人们用来当做坐标轴使用？',
                          image: 'cube',
                          options: [
                            OptionModel(text: 'A 棱块'),
                            OptionModel(text: 'B 角块'),
                            OptionModel(text: 'C 中心块', right: true),
                            OptionModel(text: 'D 坐标块')
                          ])),
                ]),
            TeachingDialogModel(
                goalImage: 'icon_knowledge_right',
                step: '第二步',
                teachingDialogItemModels: [
                  TeachingDialogItemModel(
                    formula: "U R U' R'",
                    explain: '使用右手食指拨动顶层向左转动',
                    statusImage: 'icon_knowledge_right',
                    gif: 'right_formula',
                    getStarCount: _getStars[0][1][0],
                  ),
                ]),
            TeachingDialogModel(
                goalImage: 'icon_knowledge_left',
                step: '第三步',
                teachingDialogItemModels: [
                  TeachingDialogItemModel(
                    formula: "U' L' U L",
                    explain: '使用左手食指拨动顶层向右转动',
                    statusImage: 'icon_knowledge_left',
                    gif: 'left_formula',
                    getStarCount: _getStars[0][2][0],
                  ),
                ])
          ]),
      TeachingModel(
          level: '第一关',
          goal: '底层十字',
          goalImage: '1_3',
          allStarCount: 15,
          lock: false,
          teachingDialogModels: [
            TeachingDialogModel(goalImage: '1_1', step: '第一步', teachingDialogItemModels: [
              TeachingDialogItemModel(
                  formula: "R",
                  statusImage: '1_1_1',
                  getStarCount: _getStars[1][0][0],
                  teachingCubeModel: TeachingCubeModel(
                      animationQueue: 'R',
                      rotate: const ZVector.only(x: tau * 4 / 9, y: -tau / 18))),
              TeachingDialogItemModel(
                  formula: "R R",
                  statusImage: '1_1_2',
                  getStarCount: _getStars[1][0][1],
                  teachingCubeModel: TeachingCubeModel(
                      animationQueue: 'R R',
                      rotate: const ZVector.only(x: tau * 4 / 9, y: -tau / 18))),
              TeachingDialogItemModel(
                  formula: "F R",
                  statusImage: '1_1_3',
                  getStarCount: _getStars[1][0][2],
                  teachingCubeModel: TeachingCubeModel(
                      animationQueue: 'B R',
                      rotate: const ZVector.only(x: tau * 4 / 9, y: -tau / 18)))
            ]),
            TeachingDialogModel(goalImage: '1_2', step: '第二步', teachingDialogItemModels: [
              TeachingDialogItemModel(
                  // formula: "R-FUR-左转-RR-左转-左转-F'U'R",
                  formula: "实战演练",
                  statusImage: '1_2',
                  getStarCount: _getStars[1][1][0],
                  teachingCubeModel: TeachingCubeModel(
                      animationQueue: "R B D R Y' F F Y' Y' L' D' B",
                      rotate: const ZVector.only(x: tau * 4 / 9, y: -tau / 18))),
            ]),
            TeachingDialogModel(goalImage: '1_3', step: '第三步', teachingDialogItemModels: [
              TeachingDialogItemModel(
                  // formula: "上翻-上翻-RR-左转-D'RR-左转-RR-左转-D'RR",
                  formula: "实战演练",
                  statusImage: '1_3',
                  getStarCount: _getStars[1][2][0],
                  teachingCubeModel: TeachingCubeModel(
                      animationQueue: "X X R R Y D' B B Y L L Y D' F F Y",
                      rotate: const ZVector.only(x: tau * 4 / 9, y: -tau / 18))),
            ])
          ]),
      TeachingModel(
          level: '第二关',
          goal: '底层白面',
          goalImage: '2_2',
          allStarCount: 12,
          lock: false,
          teachingDialogModels: [
            TeachingDialogModel(goalImage: '2_1', step: '第一步', teachingDialogItemModels: [
              TeachingDialogItemModel(
                  formula: "口诀：勾 上 回 下 /U R U' R'",
                  statusImage: '2_1_1',
                  getStarCount: _getStars[2][0][0],
                  teachingCubeModel: TeachingCubeModel(
                      animationQueue: "D F D' F'",
                      rotate: const ZVector.only(x: tau * 4 / 9, y: -tau * 11 / 36))),
              TeachingDialogItemModel(
                  formula: "口诀：勾 上 回 下 / U' L' U L",
                  statusImage: '2_1_2',
                  getStarCount: _getStars[2][0][1],
                  teachingCubeModel: TeachingCubeModel(
                      animationQueue: "Y' D' R' D R",
                      rotate: const ZVector.only(x: tau * 4 / 9, y: -tau * 11 / 36))),
              TeachingDialogItemModel(
                  formula: "口诀：勾 上 回 下 /U R U' R' x3",
                  statusImage: '2_1_3',
                  getStarCount: _getStars[2][0][2],
                  teachingCubeModel: TeachingCubeModel(
                      animationQueue: "D F D' F' D F D' F' D F D' F'",
                      rotate: const ZVector.only(x: tau * 4 / 9, y: -tau * 11 / 36)))
            ]),
            TeachingDialogModel(goalImage: '2_2', step: '第二步', teachingDialogItemModels: [
              TeachingDialogItemModel(
                  // formula: "URU'R'-左转-URU'R-左转-左转-U'L'UL-URU'R'×3",
                  formula: "实战演练",
                  statusImage: '2_2',
                  getStarCount: _getStars[2][1][0],
                  teachingCubeModel: TeachingCubeModel(
                      animationQueue:
                          "D F D' F' Y' D L D' L' Y' Y' D' L' D L D R D' R' D R D' R' D R D' R' Y'",
                      rotate: const ZVector.only(x: tau * 4 / 9, y: -tau * 11 / 36)
                      //const ZVector.only(x: -tau / 12, y: tau / 12)
                      )),
            ])
          ]),
      TeachingModel(
          level: '第三关',
          goal: '底层白面',
          goalImage: '3_2',
          allStarCount: 12,
          teachingDialogModels: [
            TeachingDialogModel(goalImage: '2_1', step: '第一步', teachingDialogItemModels: [
              TeachingDialogItemModel(
                  formula: "U R U' R'",
                  statusImage: '2_1_1',
                  teachingCubeModel: TeachingCubeModel(
                      animationQueue: "D F D' F'",
                      rotate: const ZVector.only(x: tau * 5 / 12, y: -tau / 3))),
              TeachingDialogItemModel(
                  formula: "左转 U' L' U L",
                  statusImage: '2_1_2',
                  teachingCubeModel: TeachingCubeModel(
                      animationQueue: "Y' D' R' D R",
                      rotate: const ZVector.only(x: tau * 5 / 12, y: -tau / 3))),
              TeachingDialogItemModel(
                  formula: "U R U' R' x3",
                  statusImage: '2_1_3',
                  teachingCubeModel: TeachingCubeModel(
                      animationQueue: "D F D' F' D F D' F' D F D' F'",
                      rotate: const ZVector.only(x: tau * 5 / 12, y: -tau / 3)))
            ]),
            TeachingDialogModel(goalImage: '2_2', step: '第二步', teachingDialogItemModels: [
              TeachingDialogItemModel(
                  formula: "URU'R'-左转-URU'R-左转-左转-U'L'UL-URU'R'×3",
                  statusImage: '2_2',
                  teachingCubeModel: TeachingCubeModel(
                      animationQueue:
                          "D F D' F' Y' D L D' L' Y' Y' D' L' D L D R D' R' D R D' R' D R D' R' Y'",
                      rotate: const ZVector.only(x: tau * 5 / 12, y: -tau / 3))),
            ])
          ]),
      TeachingModel(
          level: '第四关',
          goal: '底层白面',
          goalImage: '4_2',
          allStarCount: 12,
          teachingDialogModels: [
            TeachingDialogModel(goalImage: '2_1', step: '第一步', teachingDialogItemModels: [
              TeachingDialogItemModel(
                  formula: "U R U' R'",
                  statusImage: '2_1_1',
                  teachingCubeModel: TeachingCubeModel(
                      animationQueue: "D F D' F'",
                      rotate: const ZVector.only(x: tau * 5 / 12, y: -tau / 3))),
              TeachingDialogItemModel(
                  formula: "左转 U' L' U L",
                  statusImage: '2_1_2',
                  teachingCubeModel: TeachingCubeModel(
                      animationQueue: "Y' D' R' D R",
                      rotate: const ZVector.only(x: tau * 5 / 12, y: -tau / 3))),
              TeachingDialogItemModel(
                  formula: "U R U' R' x3",
                  statusImage: '2_1_3',
                  teachingCubeModel: TeachingCubeModel(
                      animationQueue: "D F D' F' D F D' F' D F D' F'",
                      rotate: const ZVector.only(x: tau * 5 / 12, y: -tau / 3)))
            ]),
            TeachingDialogModel(goalImage: '2_2', step: '第二步', teachingDialogItemModels: [
              TeachingDialogItemModel(
                  formula: "URU'R'-左转-URU'R-左转-左转-U'L'UL-URU'R'×3",
                  statusImage: '2_2',
                  teachingCubeModel: TeachingCubeModel(
                      animationQueue:
                          "D F D' F' Y' D L D' L' Y' Y' D' L' D L D R D' R' D R D' R' D R D' R' Y'",
                      rotate: const ZVector.only(x: tau * 5 / 12, y: -tau / 3))),
            ])
          ]),
      TeachingModel(
          level: '第五关',
          goal: '底层白面',
          goalImage: '5_2',
          allStarCount: 12,
          teachingDialogModels: [
            TeachingDialogModel(goalImage: '2_1', step: '第一步', teachingDialogItemModels: [
              TeachingDialogItemModel(
                  formula: "U R U' R'",
                  statusImage: '2_1_1',
                  teachingCubeModel: TeachingCubeModel(
                      animationQueue: "D F D' F'",
                      rotate: const ZVector.only(x: tau * 5 / 12, y: -tau / 3))),
              TeachingDialogItemModel(
                  formula: "左转 U' L' U L",
                  statusImage: '2_1_2',
                  teachingCubeModel: TeachingCubeModel(
                      animationQueue: "Y' D' R' D R",
                      rotate: const ZVector.only(x: tau * 5 / 12, y: -tau / 3))),
              TeachingDialogItemModel(
                  formula: "U R U' R' x3",
                  statusImage: '2_1_3',
                  teachingCubeModel: TeachingCubeModel(
                      animationQueue: "D F D' F' D F D' F' D F D' F'",
                      rotate: const ZVector.only(x: tau * 5 / 12, y: -tau / 3)))
            ]),
            TeachingDialogModel(goalImage: '2_2', step: '第二步', teachingDialogItemModels: [
              TeachingDialogItemModel(
                  formula: "URU'R'-左转-URU'R-左转-左转-U'L'UL-URU'R'×3",
                  statusImage: '2_2',
                  teachingCubeModel: TeachingCubeModel(
                      animationQueue:
                          "D F D' F' Y' D L D' L' Y' Y' D' L' D L D R D' R' D R D' R' D R D' R' Y'",
                      rotate: const ZVector.only(x: tau * 5 / 12, y: -tau / 3))),
            ])
          ]),
      TeachingModel(
          level: '第六关',
          goal: '底层白面',
          goalImage: '6_2',
          allStarCount: 12,
          teachingDialogModels: [
            TeachingDialogModel(goalImage: '2_1', step: '第一步', teachingDialogItemModels: [
              TeachingDialogItemModel(
                  formula: "U R U' R'",
                  statusImage: '2_1_1',
                  teachingCubeModel: TeachingCubeModel(
                      animationQueue: "D F D' F'",
                      rotate: const ZVector.only(x: tau * 5 / 12, y: -tau / 3))),
              TeachingDialogItemModel(
                  formula: "左转 U' L' U L",
                  statusImage: '2_1_2',
                  teachingCubeModel: TeachingCubeModel(
                      animationQueue: "Y' D' R' D R",
                      rotate: const ZVector.only(x: tau * 5 / 12, y: -tau / 3))),
              TeachingDialogItemModel(
                  formula: "U R U' R' x3",
                  statusImage: '2_1_3',
                  teachingCubeModel: TeachingCubeModel(
                      animationQueue: "D F D' F' D F D' F' D F D' F'",
                      rotate: const ZVector.only(x: tau * 5 / 12, y: -tau / 3)))
            ]),
            TeachingDialogModel(goalImage: '2_2', step: '第二步', teachingDialogItemModels: [
              TeachingDialogItemModel(
                  formula: "URU'R'-左转-URU'R-左转-左转-U'L'UL-URU'R'×3",
                  statusImage: '2_2',
                  teachingCubeModel: TeachingCubeModel(
                      animationQueue:
                          "D F D' F' Y' D L D' L' Y' Y' D' L' D L D R D' R' D R D' R' D R D' R' Y'",
                      rotate: const ZVector.only(x: tau * 5 / 12, y: -tau / 3))),
            ])
          ]),
      TeachingModel(
          level: '第七关',
          goal: '底层白面',
          goalImage: '7_2',
          allStarCount: 12,
          teachingDialogModels: [
            TeachingDialogModel(goalImage: '2_1', step: '第一步', teachingDialogItemModels: [
              TeachingDialogItemModel(
                  formula: "U R U' R'",
                  statusImage: '2_1_1',
                  teachingCubeModel: TeachingCubeModel(
                      animationQueue: "D F D' F'",
                      rotate: const ZVector.only(x: tau * 5 / 12, y: -tau / 3))),
              TeachingDialogItemModel(
                  formula: "左转 U' L' U L",
                  statusImage: '2_1_2',
                  teachingCubeModel: TeachingCubeModel(
                      animationQueue: "Y' D' R' D R",
                      rotate: const ZVector.only(x: tau * 5 / 12, y: -tau / 3))),
              TeachingDialogItemModel(
                  formula: "U R U' R' x3",
                  statusImage: '2_1_3',
                  teachingCubeModel: TeachingCubeModel(
                      animationQueue: "D F D' F' D F D' F' D F D' F'",
                      rotate: const ZVector.only(x: tau * 5 / 12, y: -tau / 3)))
            ]),
            TeachingDialogModel(goalImage: '2_2', step: '第二步', teachingDialogItemModels: [
              TeachingDialogItemModel(
                  formula: "URU'R'-左转-URU'R-左转-左转-U'L'UL-URU'R'×3",
                  statusImage: '2_2',
                  teachingCubeModel: TeachingCubeModel(
                      animationQueue:
                          "D F D' F' Y' D L D' L' Y' Y' D' L' D L D R D' R' D R D' R' D R D' R' Y'",
                      rotate: const ZVector.only(x: tau * 5 / 12, y: -tau / 3))),
            ])
          ]),
      TeachingModel(
          level: '打乱',
          goal: '底层白面',
          goalImage: 'icon_luan',
          allStarCount: 12,
          teachingDialogModels: [
            TeachingDialogModel(goalImage: '2_1', step: '第一步', teachingDialogItemModels: [
              TeachingDialogItemModel(
                  formula: "U R U' R'",
                  statusImage: '2_1_1',
                  teachingCubeModel: TeachingCubeModel(
                      animationQueue: "D F D' F'",
                      rotate: const ZVector.only(x: tau * 5 / 12, y: -tau / 3))),
              TeachingDialogItemModel(
                  formula: "左转 U' L' U L",
                  statusImage: '2_1_2',
                  teachingCubeModel: TeachingCubeModel(
                      animationQueue: "Y' D' R' D R",
                      rotate: const ZVector.only(x: tau * 5 / 12, y: -tau / 3))),
              TeachingDialogItemModel(
                  formula: "U R U' R' x3",
                  statusImage: '2_1_3',
                  teachingCubeModel: TeachingCubeModel(
                      animationQueue: "D F D' F' D F D' F' D F D' F'",
                      rotate: const ZVector.only(x: tau * 5 / 12, y: -tau / 3)))
            ]),
            TeachingDialogModel(goalImage: '2_2', step: '第二步', teachingDialogItemModels: [
              TeachingDialogItemModel(
                  formula: "URU'R'-左转-URU'R-左转-左转-U'L'UL-URU'R'×3",
                  statusImage: '2_2',
                  teachingCubeModel: TeachingCubeModel(
                      animationQueue:
                          "D F D' F' Y' D L D' L' Y' Y' D' L' D L D R D' R' D R D' R' D R D' R' Y'",
                      rotate: const ZVector.only(x: tau * 5 / 12, y: -tau / 3)
                      //const ZVector.only(x: -tau / 12, y: tau / 12)
                      )),
            ])
          ]),
    ];
    super.onInit();
  }
}
