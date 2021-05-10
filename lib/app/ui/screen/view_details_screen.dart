import 'package:flutter/material.dart';
import 'package:open_weather/app/common/common.dart';
import 'package:open_weather/app/model/weather_model.dart';

class ViewDetailsPage extends StatefulWidget {
  final WeatherModel cityCode;
  ViewDetailsPage({this.cityCode});

  @override
  _ViewDetailsPageState createState() => _ViewDetailsPageState();
}


class _ViewDetailsPageState extends State<ViewDetailsPage>{
  AnimationController _controller;
  final int time = 60;

  @override
  void initState() {
    super.initState();
    // fetchWeatherDetails();

  //   _controller = AnimationController(vsync: this, duration: Duration(seconds: time))
  //     ..addStatusListener((status) {
  //       if (status == AnimationStatus.dismissed) {
  //         context.refresh(weatherDetailsStateFuture).timeout(Duration(seconds: 10));
  //         _startCountdown();
  //       }
  //     });
  //   _controller.reverse(from: _controller.value == 0.0 ? 1.0 : _controller.value);
  //   _startCountdown();
  // }
  //
  // Future<Null> _startCountdown() async {
  //   _controller.reverse(
  //       from: _controller.value == 0.0 ? 1.0 : _controller.value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.of(context).pushNamed("/homePage");
          },
          // onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView(
        children: [
          Container(
            alignment: Alignment.center,
            height: 200.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                capitalLatterTextLabel(widget.cityCode.name, 42.0, Colors.black, FontWeight.w700),
                textLabel(widget.cityCode.id.toString(), 10.0, Colors.black, null)
              ],
            ),
          ),
          Container(
            // alignment: Alignment.center,
            height: 200.0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: containerView(
                      widget.cityCode.weather.elementAt(0).description.toString(),
                      28.0,
                      FontWeight.w500
                  ),
                  flex: 2,
                ),
                Expanded(
                    child: containerView(
                        widget.cityCode.main.temp.toString() + ' \u2109',
                        14.0,
                        FontWeight.w700
                    ),
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}
