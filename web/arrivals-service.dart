import 'dart:html';
import 'dart:async';
import 'package:intl/intl.dart';
import 'dart:collection';
import 'package:polymer/polymer.dart';

/**/
/*
import 'dart:mirrors';
getTypeName(dynamic obj) {
  print('type name: '+ reflect(obj).type.reflectedType.toString());
}*/

@CustomTag('arrivals-service')
class ArrivalsService extends PolymerElement {
  @observable List<LinkedHashMap> arrivals = new List<LinkedHashMap>();
  @published int refresh = 120;
  Timer timer;


  // This will be available as an HTML attribute, for example:
  //
  //     <my-playback volume="11">
  //
  // It will support initialization and data-binding via <template>:
  //
  //     <template>
  //       <my-playback volume="{{x}}">
  //     </template>
  //
  // If the template is instantiated or given a model, `x` will be
  // used for this field and updated whenever `volume` changes.
  /*@published
  String get lastUpdated;
  set lastUpdated(String lu);*/
  @published String lastUpdated = "Not updated";


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

  @published ArrivalsService.created() : super.created() {
    //print("created");
  }

  @override
  void attached(){
    super.attached();
    print("attached");

    //Start listening to REST results from the ajax component.
    //ajax = querySelector('#ajax'); //cannot access shadowRoot so core-ajax-dart needs to be outside of template. -> no, automatic node selection ($['']) does work with core-ajax-dart inside template, but only from the moment of the 'attached' lifecycle callback.
    $['ajax'].on["core-response"].listen(parseResponse);

    //Get the url parameters
    String query = document.window.location.href;
    if(/*query.indexOf('test') >= 0*/true){//TODO
      //Start a timer, so we do the ajax every so many seconds.
      timer = new Timer.periodic(new Duration(seconds: refresh), handleTimeout);
    }
  }

  @override
  void detached(){
    super.detached();
    //Stop the timer.
    timer.cancel();
  }

  void handleTimeout(Timer timer) {
    //print('timer');
    //Do another REST call.
    $['ajax'].go();
  }

  void parseResponse(CustomEvent event) {
    arrivals = [];
    var detail = event.detail;
    var response = detail['response'];
    //print("core-response");
    //print(response);

    lastUpdated = new DateTime.now().toString();
    try {
      if (response == null || response['flightStatuses'] == null) {
        //print('returned');
        return;
      }
    } catch (e) {
      //print('returned');
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
      //print('arrival: '+arrival.toString());
    }
  }
}