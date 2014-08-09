import 'package:polymer/polymer.dart';
import 'dart:collection';
import 'dart:math';
import 'dart:async';

@CustomTag('ar-board')
class Board extends PolymerElement {
  List<LinkedHashMap> arrivalsUnderwater = new List<LinkedHashMap>();
  @published int columns=1;
  @published int selected=0;
  @published List<LinkedHashMap> arrivals1;
  @published List<LinkedHashMap> arrivals2;
  @published
  List<LinkedHashMap> get arrivals => arrivalsUnderwater;
  set arrivals(List<LinkedHashMap> value) {
    if(value==null){
      return;
    }
    arrivalsUnderwater = value.sublist(0);
    if((arrivals1 == null || arrivals1.length == 0) &&
        (arrivals2 == null || arrivals2.length == 0) &&
        arrivalsUnderwater != null && arrivalsUnderwater.length > 0){
      if(selected == 0){
        arrivals1 = arrivalsUnderwater.sublist(0);
      }else{
        arrivals2 = arrivalsUnderwater.sublist(0);
      }
      return;
    }
    flipPages();
  }

  @published String lastUpdated;

  @published String width = '100%';
  @published String height = 'auto';
  @published int refresh = 140;
  Timer flipTimer;
  Random randomizer;

  Board.created() : super.created() {
    print("board created");
    var board = $['board1'];
    if(board != null){
      board.style.width = width;
      board.style.height = height;
    }
    board = $['board2'];
    if(board != null){
      board.style.width = width;
      board.style.height = height;
    }
    board = $['board3'];
    if(board != null){
      board.style.width = width;
      board.style.height = height;
    }
  }

  @override
  void attached(){
    super.attached();
    /*if(arrivals!=null){
      arrivalsUnderwater = arrivals.sublist(0);
      arrivals1 = arrivals.sublist(0);
      arrivals2 = arrivals.sublist(0);
    }*/
    randomizer = new Random(42);

    //Start a timer, to randomize list order
    flipTimer = new Timer.periodic(new Duration(seconds: 10), handleFlipTimeout);
  }

  @override
  void detached(){
    super.detached();
    //Stop the timer.
    flipTimer.cancel();
  }

  void handleFlipTimeout(Timer flipTimer) {
    print('flipTimer');
    if (arrivalsUnderwater!=null && arrivalsUnderwater.length > 0){
      //int first = randomizer.nextInt(arrivals.length);
      //int second = randomizer.nextInt(arrivals.length);


      List<LinkedHashMap> temp = arrivals;
      temp.shuffle(randomizer);
      arrivals = temp;

      //arrivalsUnderwater[first]['rising'] = true;
    }
  }

  void flipPages(){
    if (arrivalsUnderwater==null || arrivalsUnderwater.length <= 0){
      return;
    }
    if(selected == 0){
      arrivals2 = arrivalsUnderwater.sublist(0);
      selected = 1;
    }else{
      arrivals1 = arrivalsUnderwater.sublist(0);
      selected = 0;
    }
  }

  /*
   * <template bind if="{{(arrivals | length) == 10}}">
   *
  int length(List<LinkedHashMap> element){
    return element.length;
  }*/




  /*void reorder(var e){
    var lastMoved = e.target;
    lastMoved.style.zIndex = 10005;*/



    //var item = e.target.templateInstance.model;

/*
    if(selected == 0){
      arrivals =
    }
    var items = selected ? this.items : this.items2;
        var i = this.selected ? this.items2.indexOf(item) : this.items.indexOf(item);
        if (i != 0) {
          items.splice(0, 0, item);
          items.splice(i + 1, 1);
        }

        this.lastIndex = i;
        this.selected = this.selected ? 0 : 1;
      },

      done: function() {
        var i = this.lastIndex;
        var items = this.selected ? this.items : this.items2;
        var item = items[i];
        items.splice(0, 0, item);
        items.splice(i + 1, 1);
        this.lastMoved.style.zIndex = null;
      }






      if (this.holdoff) {
         if (!this.items1) {
           this.items1 = items;
         } else {
           this.items2 = items;
         }
       } else if (this.$.pages.transitioning.length || this.disabled) {
         this.queuedItems = items;
       } else {
         this.flipPages(items);
       }
     },

     flipPages: function(newItems) {
       var order = newItems.map(function(u) {
         return u.uid;
       });
       if (this.lastOrder) {
         newItems.forEach(function(u, i) {
           var idx = this.lastOrder.indexOf(u.uid);
           if (idx < -1 || idx > i) {
             u.delta = this.newScores[u.uid] - this.lastScores[u.uid] || 0;
             u.rising = true;
             if (u.delta > 0) {
               u.delta = "+" + u.delta;
             }
           }
         }.bind(this));
       }
       this.lastOrder = order;
       if (this.selected || !this.items1) {
         this.items1 = newItems;
       }
       if (!this.selected || !this.items2) {
         this.items2 = newItems;
       }
       this.selected = this.selected ? 0 : 1;
     },

     done: function() {
       this.lastScores = this.newScores;
       if (this.queuedItems) {
         this.flipPages(this.queuedItems);
         this.queuedItems = null;
       } else {
         if (this.selected) {
           this.items1 = this.items2;
         } else {
           this.items2 = this.items1;
         }
       }
     },*/
}