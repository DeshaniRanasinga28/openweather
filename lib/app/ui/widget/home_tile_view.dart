import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_weather/app/common/common.dart';

class HomeTileView extends StatefulWidget {
  final double weight;
  final String cityName;
  final String cityStatus;
  final String cityTemp;

  HomeTileView( {
    this.weight,
    this.cityName,
    this.cityStatus,
    this.cityTemp
  });

  @override
  _HomeTileViewState createState() => _HomeTileViewState();
}

class _HomeTileViewState extends State<HomeTileView> {

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 20.0, right: 20.0),
        alignment: Alignment.centerLeft,
        // color: Colors.grey,
        width: widget.weight,
        height: 100.0,
        child: Row(
          children: [
            Expanded(
              child: textLabel(widget.cityName, 24.0, Colors.black, FontWeight.w700),
              flex: 2,
            ),
            Expanded(
              child: Container(
                alignment: Alignment.centerRight,
                child: textLabel('Temp: ' + widget.cityTemp + ' \u2109', 12.0, Colors.black, FontWeight.w700),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.centerRight,
                child: textLabel(widget.cityStatus, 12.0, Colors.black, FontWeight.w700),
              ),
            ),
          ],
        )
      // Text('k -- ${watch(cityDetailsStateFuture).data.value.list.elementAt(index).cityCode.toString()}'),
    );
  }
}


