part of 'location_bloc.dart';

class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object> get props => [];
}

class LocationFilterEvent extends LocationEvent{
  String text;
  LocationFilterEvent(this.text):super();

  @override
  List<Object> get props => [text];
 
}

class LoadLocationEvent extends LocationEvent{
  LoadLocationEvent():super();
}