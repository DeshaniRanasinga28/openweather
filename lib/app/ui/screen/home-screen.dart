import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_weather/app/common/common.dart';
import 'package:open_weather/app/services/services.dart';
import 'package:open_weather/app/state/state_manager.dart';
import 'package:open_weather/app/ui/widget/home_tile_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePagePageState createState() => _HomePagePageState();
}

class _HomePagePageState extends State<HomePage>  with SingleTickerProviderStateMixin{
  AnimationController _controller;
  final int time = 60;

  @override
  void initState() {
    super.initState();
      _controller = AnimationController(vsync: this, duration: Duration(seconds: time))
        ..addStatusListener((status) {
          if (status == AnimationStatus.dismissed) {
            context.refresh(cityDetailsStateFuture).timeout(Duration(seconds: 60));
            _startCountdown();
          }
        });
      _controller.reverse(from: _controller.value == 0.0 ? 1.0 : _controller.value);
      _startCountdown();
    }

    Future<Null> _startCountdown() async {
      _controller.reverse(
          from: _controller.value == 0.0 ? 1.0 : _controller.value);
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: textLabel('Open Weather', 24.0, Colors.white, FontWeight.w700),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Consumer(
           builder: ((context, T Function<T>(ProviderBase<Object, T> provider) watch, child) {
            return Expanded(
                child: watch(cityDetailsStateFuture).data == null
              ? Center(
                  child: Container(
                    height: 50.0,
                    width: 50.0,
                    child: CircularProgressIndicator(),
                  ),
                )
              : ListView.builder(
                    itemCount: watch(cityDetailsStateFuture).data?.value?.list?.length??0,
                    itemBuilder: (context, index){
                      return Column(
                        children: [
                          InkWell(
                           splashColor: Colors.grey,
                            child: HomeTileView(
                              weight: w,
                              cityName: watch(cityDetailsStateFuture).data.value.list.elementAt(index).cityName.toString(),
                              cityTemp: watch(cityDetailsStateFuture).data.value.list.elementAt(index).temp.toString(),
                              cityStatus: watch(cityDetailsStateFuture).data.value.list.elementAt(index).status.toString(),
                            ),
                            onTap: (){
                              fetchWeatherDetails(
                                  watch(cityDetailsStateFuture).data.value.list.elementAt(index).cityCode.toString(), context
                              );
                            },
                          )
                        ],
                      );
                    }
                )
            );
          }),)


        ],
      )
    );
  }

}

// class _HomePageState extends State<HomePage> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have pushed the button this many times:',
//             ),
//           ],
//         ),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
