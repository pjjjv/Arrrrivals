library Arrrrivals.web.arrivals_service_html_0;

    import 'dart:html';
    import 'package:polymer/polymer.dart';
    
    @CustomTag('arrivals-service')
    class ArrivalsService extends PolymerElement with ChangeNotifier  {
      @reflectable @published dynamic get arrivals => __$arrivals; dynamic __$arrivals; @reflectable set arrivals(dynamic value) { __$arrivals = notifyPropertyChange(#arrivals, __$arrivals, value); }
      
      ArrivalsService.created() : super.created() {
        print("created");
        arrivals = [];
      }
      
      void arrivalsLoaded() {
        print("arrivalsLoaded");
      }
    }

    main() {
      initPolymer().run(() {
        var ajax = querySelector('core-ajax-dart');
        
        var arrivals = querySelector('arrivals');
        
        ajax.on["core-response"].listen((event) {
          var detail = event.detail;
          var response = detail['response'];
          print("core-response");
          print(response[0]);
          
          arrivals = response[0];

        });
      });
    }
  