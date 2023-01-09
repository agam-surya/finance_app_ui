import 'package:finance_app_ui/common/constant.dart';
import 'package:finance_app_ui/screen/chart_screen.dart';
import 'package:finance_app_ui/screen/profile_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedNavbar = 0;

  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List navbar = [
      home(size),
      home(size),
      home(size),
      ChartScreen(size: size),
      ProfileScreen()
    ];
    return Scaffold(
      body: SafeArea(child: navbar[_selectedNavbar]),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(label: '', icon: Icon(Icons.home_filled)),
          BottomNavigationBarItem(label: '', icon: Icon(Icons.credit_card)),
          BottomNavigationBarItem(
              label: '',
              icon: CircleAvatar(
                backgroundColor: Colors.black,
                radius: 20,
                child: Icon(
                  Icons.qr_code_scanner_rounded,
                  color: whiteC,
                ),
              )),
          BottomNavigationBarItem(label: '', icon: Icon(Icons.insert_chart)),
          BottomNavigationBarItem(label: '', icon: Icon(Icons.person))
        ],
        currentIndex: _selectedNavbar,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        elevation: 0,
        onTap: _changeSelectedNavBar,
      ),
    );
  }

  Container home(Size size) {
    return Container(
      height: size.height,
      width: size.width,
      color: Pcolor,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(
                outPadding, outPadding, outPadding, 0),
            height: size.height * 0.4,
            width: size.width,
            color: Colors.transparent,
            child: Column(
              children: [
                Row(
                  children: [
                    Spacer(),
                    Icon(Icons.notifications_on_outlined),
                  ],
                ),
                SizedBox(
                  height: 70,
                  width: size.width - (outPadding * 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Hi Cartez,",
                        style: TextStyle(fontSize: 25, color: Colors.black),
                      ),
                      Text(
                        "Welcome back",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        "Available balance",
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "\$3,100",
                        style: TextStyle(
                            fontSize: 40,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          primaryWidget(title: "Top Up", icon: Icons.add_box),
                          primaryWidget(title: "Send", icon: Icons.send),
                          primaryWidget(
                            title: "Request",
                            icon: Icons.move_to_inbox_rounded,
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: outPadding, vertical: outPadding / 2),
              width: size.width,
              decoration: const BoxDecoration(
                  color: whiteC,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Last Transaction",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 100,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text("Today"),
                              Icon(Icons.arrow_drop_down_circle_outlined)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                      child: ListView(
                    children: [
                      transactionWidget(
                          icon: Icons.shopping_bag_outlined,
                          title: "Tokopedia",
                          subtitle: "Payment",
                          value: "-\$50.00"),
                      transactionWidget(
                          icon: Icons.credit_card,
                          title: "BANK BNI",
                          subtitle: "Top Up",
                          value: "+\$650.00"),
                      transactionWidget(
                          icon: Icons.confirmation_num_outlined,
                          title: "Grab",
                          subtitle: "Payment",
                          value: "-\$10.00"),
                      transactionWidget(
                          icon: Icons.ondemand_video_outlined,
                          title: "Netflix",
                          subtitle: "Payment",
                          value: "-\$12.00"),
                    ],
                  ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  ListTile transactionWidget(
      {required IconData icon,
      required String title,
      required String subtitle,
      required String value}) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      ),
      subtitle: Text(subtitle),
      trailing: Text(
        value,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }

  primaryWidget({required IconData icon, required String title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: SizedBox(
        height: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundColor: Colors.black,
              radius: 18,
              child: Icon(
                icon,
                color: whiteC,
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
