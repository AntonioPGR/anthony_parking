import "package:anthony_parking/models/car_model.dart";

class PriceCalculator{

  List<double> price_list = [10, 5, 3];
  int exception_time = 5;

  double calculateCarPrice(CarModel car){
    Duration elapsed_time = DateTime.now().difference(car.entry_time);
    return calculatePrice(elapsed_time);
  }

  double calculatePrice(Duration elapsed_time){
    int elapsed_time_in_minutes = elapsed_time.inMinutes - exception_time;
    if(elapsed_time_in_minutes < 0){
      return 0;
    }
    int hour_counters = _getHoursNumber(elapsed_time_in_minutes);
    double final_price = _getFinalPrice(hour_counters);
    return final_price;
  }

  int _getHoursNumber(int elapsed_minutes){
      int hour_counters = 0;
      while(elapsed_minutes > 60){
        elapsed_minutes -= 60;
        hour_counters++;
      }
      return hour_counters;
    }

  double _getFinalPrice(int hours){
    double final_price = price_list.first;
    for(int c=1; c < hours; c++){
      if(c < price_list.length ){
        final_price += price_list[c];
      } else {
        final_price += price_list.last;
      }
    }
    return final_price;
  }

}