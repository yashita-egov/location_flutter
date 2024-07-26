import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:project_flutter/model/location.dart';
import 'package:flutter/services.dart' show rootBundle;
part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  List<Location> l=[];

  LocationBloc() : super(LocationInitial()) {
    // on<LocationEvent>((event, emit) {
    //   emit(LocationState(event.allcities));
    // });
    on<LoadLocationEvent>((event, emit) async {
      emit(LocationLoadingState());
      try {
        final data = await ReadJsonData();
        l = data;
        l.sort((a, b) => a.displayname().compareTo(b.displayname()));
        emit(LocationLoaded(l));
      } catch (error) {
        emit(LocationError(error.toString()));
      }
    });

    on<LocationFilterEvent>((event,emit){
      final filteredList = filterLocations(event.text);
      emit(LocationFilter(filteredList));
    });

  }

  List<Location> filterLocations(String text){
    if(text.isEmpty){
      return l;
    }
    else{
      return l.where((l)=>l.displayname().toLowerCase().contains(text.toLowerCase())).toList();
    }
  }

  Future<List<Location>> ReadJsonData() async {
  final jsonData = await rootBundle.loadString('assets/in.json');
  final list = json.decode(jsonData) as List<dynamic>;
  
  return list.map((e) => Location.fromJson(e)).toList();
}
}



