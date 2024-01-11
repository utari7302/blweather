import 'package:blweather/data/models/weather_model.dart';

sealed class WeatherState{}

class WeatherInitial extends WeatherState{}

final class WeatherSuccess extends WeatherState{
  final WeatherModel weatherModel;

  WeatherSuccess({required this.weatherModel});
}

final class WeatherFailure extends WeatherState{
  final String error;

  WeatherFailure(this.error);

}

final class WeatherLoading extends WeatherState{}