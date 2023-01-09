import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import '../common/constant.dart';
import '../models/chart_series.dart';
import '../widgets/chart_widget.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  final List<ChartSeries> data = [
    ChartSeries(
        value: 1750,
        month: "1",
        barColor: charts.ColorUtil.fromDartColor(Pcolor)),
    ChartSeries(
        value: 2500,
        month: "2",
        barColor: charts.ColorUtil.fromDartColor(Pcolor)),
    ChartSeries(
        value: 2700,
        month: "3",
        barColor: charts.ColorUtil.fromDartColor(Pcolor)),
    ChartSeries(
        value: 1800,
        month: "4",
        barColor: charts.ColorUtil.fromDartColor(Pcolor)),
    ChartSeries(
        value: 3100,
        month: "5",
        barColor: charts.ColorUtil.fromDartColor(Pcolor)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteC,
        elevation: 0,
        centerTitle: true,
        title: const Text("Profile",
            style: TextStyle(
                color: Scolor, fontSize: 24, fontWeight: FontWeight.bold)),
        actions: const [
          Icon(
            Icons.settings_outlined,
            color: Scolor,
          ),
          Icon(
            Icons.more_vert,
            color: Scolor,
          )
        ],
      ),
      body: Container(
          padding:
              const EdgeInsets.fromLTRB(outPadding, outPadding, outPadding, 0),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: whiteC,
          child: Column(
            children: [
              Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Pcolor,
                  ),
                  child: const Image(
                      image: AssetImage("assets/profile.png"),
                      fit: BoxFit.scaleDown)),
              const SizedBox(
                height: 15,
              ),
              const Text("Cartez",
                  style: TextStyle(
                      color: Scolor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                padding: const EdgeInsets.all(outPadding),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Scolor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ChartWidgetLine(data: data),
                    ),
                    const Text(
                      "Total Balance",
                      style:
                          TextStyle(color: whiteC, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "\$3,100",
                      style: TextStyle(
                          color: whiteC,
                          fontWeight: FontWeight.bold,
                          fontSize: 28),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: Column(
                children: [
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Other Services",
                        style: TextStyle(
                            color: Scolor,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        child: Row(
                          children: const [
                            Text("See All",
                                style: TextStyle(
                                    color: Scolor,
                                    fontWeight: FontWeight.bold)),
                            Icon(
                              Icons.keyboard_arrow_right,
                              color: Colors.grey,
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      services(
                          icon: Icons.qr_code_scanner_rounded, title: "Scan"),
                      services(icon: Icons.add, title: "Top Up"),
                      services(icon: Icons.send, title: "Send"),
                      services(
                          icon: Icons.file_download_outlined, title: "Request"),
                    ],
                  )),
                ],
              ))
            ],
          )),
    );
  }

  Widget services({required IconData icon, required String title}) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: gColor,
          ),
          child: Icon(icon, size: 40),
        ),
        SizedBox(height: 5),
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
