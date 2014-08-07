import 'package:polymer/polymer.dart';
import 'dart:collection';

@CustomTag('ar-board')
class Board extends PolymerElement {
  @observable List<LinkedHashMap> arrivals2;
        
  @observable get arrivalses { 
    print('board get arrivalses: '+arrivals2.toString());  
    return arrivals2;
  }
  
  @observable void set arrivalses(var arrivals3) {
    arrivals2 = arrivals3;
    print('board set arrivalses: '+arrivals2.toString()); 
    if (arrivals2 != null) {
      print('      set arrivalses1: '+arrivals2[0]['time'].toString());  
    } 
  }
        
  Board.created() : super.created() {
    print("board created");
  }
}