import 'package:adcda_volunteers_mobile/core/utils/notification_service.dart';
import 'package:get/get.dart';

class GlobalSettingController extends GetxController {
  @override
  void onInit() {
    notificationInit();

    super.onInit();
  }

  NotificationService notificationService = NotificationService();

  notificationInit() {
    // notificationService.initInfo().then((value) async {
    //   String token = await NotificationService.getToken();
    //   log(":::::::TOKEN:::::: $token");
    //   if (FirebaseAuth.instance.currentUser != null) {
    //     await FireStoreUtils.getUserProfile(FireStoreUtils.getCurrentUid())
    //         .then((value) {
    //       if (value != null) {
    //         UserModel driverUserModel = value;
    //         driverUserModel.fcmToken = token;
    //         FireStoreUtils.updateUser(driverUserModel);
    //       }
    //     });
    //   }
    // });
  }
}
