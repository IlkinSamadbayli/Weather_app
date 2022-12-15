import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_blc/bloc/weather/weather_bloc.dart';
import 'package:weather_blc/style.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final TextEditingController textController;

  @override
  void initState() {
    textController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Weather'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                if (state is WeatherFetchLoading) {
                  return const CircularProgressIndicator();
                } else if (state is WeatherFetchFailure) {
                  return Text(state.failureMessage.errorMessage);
                } else if (state is WeatherFetchSuccess) {
                  return Text(
                      "${(state.weatherInfo.main!.temp! - 273.15).toStringAsFixed(1)} C ",
                      style: const TextStyle(fontSize: 30));
                } else {
                  return const Text("Temperature",
                      style: TextStyle(fontSize: 30));
                }
              },
            ),
            const SizedBox(height: 40),
            TextField(
              style: const TextStyle(fontSize: 22),
              controller: textController,
              decoration: const InputDecoration(
                hintText: "Enter city name",
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 60),
            ElevatedButton(
              style: Customstyle.kButtonStyle,
              onPressed: () {
                context
                    .read<WeatherBloc>()
                    .add(WeatherFetchEvent(cityName: textController.text));
              },
              child: const Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  "show temperature",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
