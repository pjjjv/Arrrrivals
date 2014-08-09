import 'package:polymer/polymer.dart';
import 'dart:collection';

@CustomTag('ar-board')
class Board extends PolymerElement {
  @published List<LinkedHashMap> arrivals;
  @published String lastUpdated;

  @published String width = '100%';
  @published String height = 'auto';
  @published int refresh = 140;

  Board.created() : super.created() {
    print("board created");
    var board = $['board'];
    board.style.width = width;
    board.style.height = height;
  }

  /*
   * <template bind if="{{(arrivals | length) == 10}}">
   *
  int length(List<LinkedHashMap> element){
    return element.length;
  }*/
}