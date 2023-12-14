import 'dart:async';
import 'package:get/get.dart';
import 'package:wether_app/Model/data_model.dart';
import 'package:wether_app/repositry/home_repositry.dart';
import '../../res/images/image_assets.dart';
import '../../utils/utils.dart';

class DaysController extends GetxController {
  RxInt currentDay = 0.obs;
  late Rx<Days> day;
  Rx<DataModel?> model = Rx<DataModel?>(null);
  Rx<Hours?> hours = Rx<Hours?>(null);
  Rx<int> currentIndex = 0.obs;
  RxBool animator = false.obs;
  RxBool dataLoaded = false.obs;
  int getCurrentIndex() => currentIndex.value;
  bool compareIndex(int index) => index == currentIndex.value;
  String getHour(int index) =>
      Utils.formateTimeWithout(model.value!.days![0].hours![index].datetime);
  String getAddress() =>
      '${model.value!.address.toString()},\n${model.value!.timezone.toString()}';
  String getCondition() => hours.value!.conditions.toString();
  String getCurrentTemp() => hours.value!.temp.toInt().toString();
  String getFeelLike() => hours.value!.feelslike.toString();
  String getCloudOver() => hours.value!.cloudcover.toInt().toString();
  String getWindSpeed() => hours.value!.windspeed.toInt().toString();
  String getHumidity() => hours.value!.humidity.toInt().toString();

  getData() {
    HomeReposirty.hitApi().then(
      (value) {
        model.value = DataModel.fromJson(value);
        for (int i = 0; i < model.value!.days![0].hours!.length; i++) {
          if (Utils.checkTime(model.value!.days![0].hours![i].datetime)) {
            hours.value = model.value!.days![0].hours![i];
            currentIndex.value = i;
            break;
          }
        }
        dataLoaded.value = true;
        day = model.value!.days![0].obs;
      },
    );
  }

  setHour(int index) {
    Timer(
      Duration(milliseconds: 100),
      () => animator.value = true,
    );
    currentIndex.value = index;
    hours.value = model.value!.days![0].hours![index];
    Timer(
      Duration(milliseconds: 100),
      () => animator.value = false,
    );
  }


  setDay(int index) {
    day.value = model.value!.days![index];
    currentDay.value = index;
  }

  String getImage(int index){
    return Utils.imageMap[model.value!.days![index].conditions]==null ? ImageAssets.nightStarRain :
    Utils.imageMap[model.value!.days![index].conditions]!;
  }

  String getMonth(int index) {
    return Utils.extractDate(model.value!.days![index].datetime);
  }

  String getMonthDay(int index) {
    return Utils.extractDay(model.value!.days![index].datetime);
  }

  String getDate(int index) {
    return Utils.formateDate(
        DateTime.parse(model.value!.days![index].datetime));
  }

  String getMinTemp(int index) {
    return '${model.value!.days![index].tempmin.toInt()}\u00B0';
  }

  String getMaxTemp(int index) {
    return '${model.value!.days![index].tempmax.toInt()}\u00B0';
  }
}
