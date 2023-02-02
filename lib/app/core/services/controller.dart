import 'package:get/get.dart';


abstract class BaseLoaderController extends GetxController {
  var isLoading = false.obs;


  showLoader(val) {
    isLoading.value = val;
    update();
  }

  @override
  Future<void> onInit() async {
    initializeData();
    super.onInit();
  }



  initializeData(){}
}