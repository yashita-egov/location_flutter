import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'model/location.dart';

@RoutePage()
class Weather extends StatefulWidget {
  Location list;

  Weather(this.list, {super.key});

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  var jsonresponse;
  late double lat;
  late double lon;
  late String city;
  late String country;
  
  @override
  void initState() {
    super.initState();
    lat = widget.list.lat?? 0.0;
    lon = widget.list.lon ?? 0.0; 
    city = widget.list.city?? "NA";
    country = widget.list.country?? "NA";
    
    // print(lat);
    // print(lon);
    getData();
  }

  void getData() async{
  try{
  var response = await Dio().get('https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=40534e89a870f25c608e011f0f4db92c');
  
  setState(() {
    jsonresponse = response.data;
    // print(jsonresponse);
    // print(jsonresponse['weather'][0]?['main']);
  });
  
  }
  catch(e) {
    // print(e);
  }
}

  @override
  Widget build(BuildContext context) {
    // print(jsonresponse);
    // return Scaffold(
    //   appBar: AppBar(title: const Text('Weather')),
      
    //   // body:Text(jsonresponse['weather']?[0]?['main']??'No Data'),
    // );
    return Scaffold(
      appBar: AppBar(title: const Text('Weather')),
      body: Center(
        child: jsonresponse == null 
            ? CircularProgressIndicator() 
            : Container(
              // colo?r: const Color.fromARGB(255, 233, 230, 230),
              height: MediaQuery.of(context).size.height*0.5,
              width: MediaQuery.of(context).size.width*0.5,
              decoration: BoxDecoration(
                color: Color(0xFFE9E2E2),
                boxShadow: [
                  BoxShadow(
                color: Colors.grey.withOpacity(0.5), // Shadow color
                spreadRadius: 5, // Spread radius
                blurRadius: 7, // Blur radius
                offset: Offset(0, 3), // Offset in x and y direction
              ),
                ]
                ),
              // alignment: AlignmentDirectional(20,80),
              
              child: Padding(
                padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.05),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            city+', '+country,
                            style: const TextStyle(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0,
                            ),
                          ),
                        ],
                      ),
                      Center(child: Text(jsonresponse?['weather']?[0]?['main'] ?? 'No Data')),
                      Center(child: Text(jsonresponse?['main']?['temp'].toString() ?? 'No Data')),
                    ],
                  ),
              )
              ),
      ),
    );
  }
}

