import 'dart:html';
import 'dart:async';
import 'package:intl/intl.dart';
import 'dart:collection';
import 'package:polymer/polymer.dart';

/**/


@CustomTag('arrivals-service')
class ArrivalsService extends PolymerElement {
  @observable List<LinkedHashMap> arrivals = new List<LinkedHashMap>();
  var ajax;


  final Map<String, String> statusDict =
    {'A':'Active',
      'C': 'Canceled',
      'D':'Diverted',
      'DN':  'Data source needed',
      'L' :'Landed',
      'NO':  'Not Operational',
      'R' :'Redirected',
      'S' :'Scheduled',
      'U': 'Unknown'};

  void handleTimeout(Timer timer) {
    print('timer');
    this.ajax.go();
  }

  @published ArrivalsService.created() : super.created() {
    print("created");


    ajax = querySelector('#ajax'); //cannot access shadowRoot so core-ajax-dart needs to be outside of template.

    new Timer.periodic(new Duration(seconds: 120), handleTimeout);

    //arrivals = querySelector('arrivals');

    ajax.on["core-response"].listen((event) {
      arrivals = [];
      var detail = event.detail;
      var response = detail['response'];
      print("core-response");
      //print(response);

      var lastUpdated = new DateTime.now();
      try {
        if (response == null || response['flightStatuses'] == null) {
          print('returned');
          return;
        }
      } catch (e) {
        print('returned');
        return;
      }

      var flightStatuses = response['flightStatuses'];
      //print('flightStatuses ==== ' + flightStatuses.toString());
      for (var flightStatus in flightStatuses) {
        //print('flightStatus ==== ' + flightStatus.toString());
        LinkedHashMap arrival = new LinkedHashMap();

        arrival['flight'] = flightStatus['carrierFsCode'] + ' ' + flightStatus['flightNumber'];


        var departureAirport = flightStatus['departureAirport'];
        if(departureAirport!=null){
          arrival['from'] = departureAirport['city'];
        } else{
          bool found = false;
          var airports = response['appendix']['airports'];
          departureAirport = flightStatus['departureAirportFsCode'];
          for (var airportData in airports){
            if(airportData['fs']==departureAirport){
              departureAirport = airportData['city'];
              found = true;
              arrival['from'] = departureAirport;
            }
          }
          if(!found){
            arrival['from'] = "Unknown";
          }
        }


        var date = flightStatus['arrivalDate']['dateLocal'];
        var datetime = DateTime.parse(date);
        var f = new NumberFormat("00", "en_US");
        arrival['time'] = f.format(datetime.hour) + ':' + f.format(datetime.minute);
        var status = flightStatus['status'];
        arrival['remarks'] = statusDict[status];
        arrivals.add(arrival);
        print('arrival: '+arrival.toString());
      }

      /*for (arrival in arrivals) {
            arrival['from']= arrival['from'].toLowerCase().replace(/ /g,"");
          }*/

    });
  }

  /*void arrivalsLoaded(Event e, var detail, Node target) {
        print("arrivalsLoaded");
      }*/
}


void arrivalsLoaded(e, detail, node) {
  print("arrivalsLoaded2");
}

/*void main() {
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
    }*/
