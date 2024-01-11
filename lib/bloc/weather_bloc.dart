import 'dart:async';

import 'package:blweather/bloc/weather_event.dart';
import 'package:blweather/bloc/weather_state.dart';
import 'package:blweather/data/repository/weather_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherBloc extends Bloc<WeatherEvent,WeatherState>{

  final WeatherRepository weatherRepository;

  WeatherBloc(this.weatherRepository):super(WeatherInitial()){
    on<WeatherFetched>(_weatherFetched);
  }

  FutureOr<void> _weatherFetched(WeatherFetched event, Emitter<WeatherState> emit) async {
    emit(WeatherLoading());
    try {
      final weather = await weatherRepository.getCurrentWeather();
      emit(WeatherSuccess(weatherModel: weather));
    } catch (e) {
      emit(WeatherFailure(e.toString()));
    }

  }
}