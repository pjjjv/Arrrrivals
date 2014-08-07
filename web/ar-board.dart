import 'package:polymer/polymer.dart';

@CustomTag('ar-board')
class Board extends PolymerElement {
  @published var arrivals2;
        
  get arrivals => arrivals2;
  
  void set arrivals(var arrivals3) {
      arrivals2 = arrivals3;
  }
        
  Board.created() : super.created() {
    print("board created");
  }
}