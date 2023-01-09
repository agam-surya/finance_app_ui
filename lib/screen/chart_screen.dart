import 'package:finance_app_ui/common/constant.dart';
import 'package:finance_app_ui/models/chart_series.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:finance_app_ui/widgets/chart_widget.dart';
import 'package:flutter/material.dart';

class ChartScreen extends StatefulWidget {
  const ChartScreen({Key? key, required this.size}) : super(key: key);
  final Size size;

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  int _tabIndex = 0;
  final List<ChartSeries> data1 = [
    ChartSeries(
        value: 1750,
        month: "January",
        barColor: charts.ColorUtil.fromDartColor(Pcolor)),
    ChartSeries(
        value: 2500,
        month: "February",
        barColor: charts.ColorUtil.fromDartColor(Pcolor)),
    ChartSeries(
        value: 2700,
        month: "March",
        barColor: charts.ColorUtil.fromDartColor(Pcolor)),
    ChartSeries(
        value: 1800,
        month: "April",
        barColor: charts.ColorUtil.fromDartColor(Pcolor)),
    ChartSeries(
        value: 3100,
        month: "May",
        barColor: charts.ColorUtil.fromDartColor(Pcolor)),
  ];
  final List<ChartSeries> data2 = [
    ChartSeries(
        value: 1100,
        month: "January",
        barColor: charts.ColorUtil.fromDartColor(Pcolor)),
    ChartSeries(
        value: 1700,
        month: "February",
        barColor: charts.ColorUtil.fromDartColor(Pcolor)),
    ChartSeries(
        value: 1300,
        month: "March",
        barColor: charts.ColorUtil.fromDartColor(Pcolor)),
    ChartSeries(
        value: 800,
        month: "April",
        barColor: charts.ColorUtil.fromDartColor(Pcolor)),
    ChartSeries(
        value: 1200,
        month: "May",
        barColor: charts.ColorUtil.fromDartColor(Pcolor)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: whiteC,
          elevation: 0,
          centerTitle: true,
          title: Text('Statistics',
              style: TextStyle(
                  color: Scolor, fontSize: 24, fontWeight: FontWeight.bold)),
        ),
        body: Container(
          padding:
              const EdgeInsets.fromLTRB(outPadding, outPadding, outPadding, 0),
          height: widget.size.height,
          width: widget.size.width,
          color: whiteC,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: gColor, borderRadius: BorderRadius.circular(10)),
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _tabIndex = 0;
                          });
                        },
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                (RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)))),
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.all(15)),
                            backgroundColor: MaterialStateProperty.all(
                                (_tabIndex == 0 ? Scolor : Colors.transparent)),
                            elevation: MaterialStateProperty.all(0)),
                        child: Text(
                          "Income",
                          style: TextStyle(
                              color: _tabIndex == 0 ? Pcolor : Scolor),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _tabIndex = 1;
                          });
                        },
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                (RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)))),
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.all(15)),
                            backgroundColor: MaterialStateProperty.all(
                                _tabIndex == 1 ? Scolor : Colors.transparent),
                            elevation: MaterialStateProperty.all(0)),
                        child: Text(
                          "Expenses",
                          style: TextStyle(
                              color: _tabIndex == 1 ? Pcolor : Scolor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _tabIndex == 0 ? "\$3,100" : "\$1,100",
                      style: const TextStyle(
                          fontSize: 28,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.call_made,
                          color: _tabIndex == 0 ? Pcolor : Bcolor,
                        ),
                        Text(
                          _tabIndex == 0
                              ? "Increase of 20% from last month"
                              : "Increase of 15% from last month",
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 200,
                child: Center(
                  child: ChartWidget(data: _tabIndex == 0 ? data1 : data2),
                ),
              ),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(
                          top: outPadding,
                          left: outPadding,
                          bottom: outPadding),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _tabIndex == 0
                                ? "Tips for increasing income"
                                : "Tips for saving on expenses",
                            softWrap: true,
                            style: const TextStyle(
                                color: whiteC,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Pcolor),
                              fixedSize:
                                  MaterialStateProperty.all(Size(90, 50)),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                            child: const Text(
                              "Learn",
                              style: TextStyle(
                                color: Scolor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                    const Expanded(
                        child: Image(image: AssetImage("assets/logo.png")))
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(outPadding),
                decoration: BoxDecoration(
                  color: gColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "See list of income",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.expand_more,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
