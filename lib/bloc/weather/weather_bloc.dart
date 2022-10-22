import 'package:meta/meta.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_blc/data/models/weather_fetch_model.dart';
import 'package:weather_blc/data/service/weather_service.dart';
import 'package:weather_blc/global/error/failure.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherService _weatherService = WeatherService();
  final GlobalError _globalError = GlobalError();
  WeatherBloc() : super(WeatherInitial()) {
    on<WeatherEvent>((event, emit) async {
      if (event is WeatherFetchEvent) {
        final result = await _weatherService.fetchWeatherInfo(event.cityName);

        if (result is WeatherFetchModel) {
          emit(WeatherFetchLoading());
          emit(WeatherFetchSuccess(weatherInfo: result));
        } else {
          emit(WeatherFetchFailure(failureMessage: _globalError));
        }
      }
    });
  }
}
