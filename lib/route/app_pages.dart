import 'package:cubestation_flutter/cube/scramble/scramble.dart';
import 'package:cubestation_flutter/route/routes.dart';
import 'package:cubestation_flutter/src/challenge/challenge.dart';
import 'package:cubestation_flutter/src/color_solution/color.dart';
import 'package:cubestation_flutter/src/color_solution/orientation_check/orientation_check.dart';
import 'package:cubestation_flutter/src/color_solution/solution/solution.dart';
import 'package:cubestation_flutter/src/device_info/device_info.dart';
import 'package:cubestation_flutter/src/fast_solution/fast_solution.dart';
import 'package:cubestation_flutter/src/home/home.dart';
import 'package:cubestation_flutter/src/home2/home2.dart';
import 'package:cubestation_flutter/src/login/forget_password/forget_password.dart';
import 'package:cubestation_flutter/src/login/login.dart';
import 'package:cubestation_flutter/src/login/register/register.dart';
import 'package:cubestation_flutter/src/mine/mine.dart';
import 'package:cubestation_flutter/src/initial/initial.dart';
import 'package:cubestation_flutter/src/mine/setting/account_manage/account_manage.dart';
import 'package:cubestation_flutter/src/mine/setting/setting.dart';
import 'package:cubestation_flutter/src/record/record.dart';
import 'package:cubestation_flutter/src/replay/replay.dart';
import 'package:cubestation_flutter/src/skin/paste/paste.dart';
import 'package:cubestation_flutter/src/skin/skin.dart';
import 'package:cubestation_flutter/src/solved_settlement_dialog/solved_settlement_dialog.dart';
import 'package:cubestation_flutter/src/solved_settlement/solved_settlement.dart';
import 'package:cubestation_flutter/src/status_check/status_check.dart';
import 'package:cubestation_flutter/src/status_sync/status_sync.dart';
import 'package:cubestation_flutter/src/teaching/teaching.dart';
import 'package:cubestation_flutter/src/teaching_dialog/teaching_dialog.dart';
import 'package:cubestation_flutter/src/teaching_level/teaching_level.dart';
import 'package:cubestation_flutter/src/teaching_level_play/teaching_level_play.dart';
import 'package:cubestation_flutter/src/teaching_settlement/pass_record.dart';
import 'package:cubestation_flutter/src/teaching_settlement/teaching_settlement.dart';
import 'package:cubestation_flutter/src/timing_play/dnf.dart';
import 'package:cubestation_flutter/src/timing_play/timing_play.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
        name: Routes.INITIAL,
        page: () => const InitialPage(),
        binding: InitialBinding(),
        bindings: [
          HomeBinding(),
          TeachingBinding(),
          ChallengeBinding(),
          MineBinding(),
          ScrambleBinding(),
          StatusCheckBinding(),
        ]),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => const RegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: Routes.FORGET_PASSWORD,
      page: () => const ForgetPasswordPage(),
      binding: ForgetPasswordBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.RECORD,
      page: () => const RecordPage(),
      binding: RecordBinding(),
    ),
    GetPage(
      name: Routes.REPLAY,
      page: () => const ReplayPage(),
      binding: ReplayBinding(),
    ),
    GetPage(
      name: Routes.TEACH,
      page: () => const TeachingPage(),
      binding: TeachingBinding(),
    ),
    GetPage(
      name: Routes.CHALLENGE,
      page: () => const ChallengePage(),
      binding: ChallengeBinding(),
    ),
    GetPage(
      name: Routes.MINE,
      page: () => const MinePage(),
      binding: MineBinding(),
    ),
    GetPage(
      name: Routes.STATUS_SYNC,
      page: () => const StatusSyncPage(),
      binding: StatusSyncBinding(),
    ),
    GetPage(
        name: Routes.FAST_SOLUTION,
        page: () => const FastSolutionPage(),
        binding: FastSolutionBinding(),
        bindings: [ScrambleBinding(), StatusCheckBinding()]),
    GetPage(
      name: Routes.DEVICE_INFO,
      page: () => const DeviceInfoPage(),
      binding: DeviceInfoBinding(),
    ),
    GetPage(
        name: Routes.TEACH_LEVEL,
        page: () => const TeachingLevelPage(),
        binding: TeachingLevelBinding(),
        bindings: [TeachingDialogBinding()]),
    GetPage(
        name: Routes.TEACH_LEVEL_PLAY,
        page: () => const TeachingLevelPlayPage(),
        binding: TeachingLevelPlayBinding(),
        bindings: [ScrambleBinding()]),
    GetPage(
      name: Routes.TEACH_SETTLEMENT,
      page: () => const TeachingSettlementPage(),
      binding: TeachingSettlementBinding(),
    ),
    GetPage(
      name: Routes.PASS_RECORD,
      page: () => PassRecord(),
    ),
    GetPage(
        name: Routes.TIMING_PLAY,
        page: () => const TimingPlayPage(),
        binding: TimingPlayBinding(),
        bindings: [ScrambleBinding(), StatusCheckBinding()]),
    GetPage(
      name: Routes.DNF,
      page: () => DnfPage(),
    ),
    GetPage(
      name: Routes.SOLVED_SETTLEMENT,
      page: () => const SolvedSettlementPage(),
      binding: SolvedSettlementBinding(),
    ),
    GetPage(
      name: Routes.SETTING,
      page: () => const SettingPage(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: Routes.ACCOUNT_MANAGE,
      page: () => const AccountManagePage(),
      binding: AccountManageBinding(),
    ),
    GetPage(
      name: Routes.HOME2,
      page: () => const Home2Page(),
      binding: Home2Binding(),
    ),
    GetPage(
      name: Routes.COLOR,
      page: () => const ColorPage(),
      binding: ColorBinding(),
    ),
    GetPage(
        name: Routes.SOLUTION,
        page: () => const SolutionPage(),
        binding: SolutionBinding(),
        bindings: [ScrambleBinding(), OrientationCheckBinding()]),
    GetPage(
      name: Routes.PASTE,
      page: () => const PastePage(),
      binding: PasteBinding(),
    ),
    GetPage(
      name: Routes.SKIN,
      page: () => const SkinPage(),
      binding: SkinBinding(),
    ),
  ];
}
