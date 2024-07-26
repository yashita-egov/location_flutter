part of 'location_bloc.dart';

class LocationState extends Equatable {
  final List<Location>allcities;
  const LocationState(this.allcities);
 
  
  @override
  List<Object> get props => [allcities];
}

final class LocationInitial extends LocationState {
  LocationInitial():super([]);
}

class LocationLoadingState extends LocationState{
  LocationLoadingState():super([]);
}

class LocationLoaded extends LocationState{
  LocationLoaded(super.allcities);
}

class LocationError extends LocationState{
  final String message;

  LocationError(this.message):super([]);

  @override
  List<Object> get props => [message];
}

class LocationFilter extends LocationState{
  LocationFilter(super.allcities);
}