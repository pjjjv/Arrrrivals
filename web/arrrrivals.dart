import 'dart:html';
import 'package:polymer/polymer.dart';
export 'package:polymer/init.dart';



void infoTapped(Event e) {
  print("infoTapped");
  var dialog = querySelector('#dialog');
  dialog.toggle();
}

void main() {
  initPolymer().run(() {
    print("main1");
  });

  querySelector('#fab').on['tap'].listen(infoTapped);
  //addEventListener('tap', infoTapped);
}