import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      theme: ThemeData(
        primarySwatch: Colors.grey,
        iconTheme: IconThemeData(color: Colors.white),
        textTheme: TextTheme(
            headline1:
                TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 15),
            bodyText2: TextStyle(
                fontWeight: FontWeight.w600, color: Colors.white, fontSize: 18),
            bodyText1: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: 16)),
        fontFamily: "SansPro",
        scaffoldBackgroundColor: Color(0xFF1b1e31),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showLoadingSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: GlobalKey(),
      body: SafeArea(
        child: (showLoadingSpinner)
            ? Column(
                children: [
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 6,
                      ),
                    ],
                  ),
                ],
              )
            : RefreshIndicator(
                onRefresh: () async {
                  showLoadingSpinner = true;
                  setState(() {});
                  await Future.delayed(Duration(milliseconds: 500));
                  showLoadingSpinner = false;
                  setState(() {});
                },
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const FirstWidget(),
                      const HeadingText(title: "PAYMENT CATEGORIES"),
                      const TheCategoriesWidget(),
                      const HeadingTextWithShowAll(),
                      TransactionAmounts(),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

class HeadingTextWithShowAll extends StatelessWidget {
  const HeadingTextWithShowAll({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const HeadingText(title: "LATEST TRANSACTIONS"),
        const Spacer(),
        Text(
          "Show All",
          style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 14),
        ),
        Icon(
          Icons.arrow_forward_ios_rounded,
          size: 14,
          color: Colors.white.withOpacity(0.5),
        ),
        const SizedBox(
          width: 18,
        )
      ],
    );
  }
}

class TransactionAmounts extends StatelessWidget {
  const TransactionAmounts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TilesInTransactions(
            title: "WWWOLACABSCOM", date: "26 May 2021", time: "12:20AM"),
        TilesInTransactions(
            title: "Recharge", date: "26 May 2021", time: "12:20AM"),
        TilesInTransactions(
            title: "Reliance Ltd", date: "26 May 2021", time: "12:20AM"),
        TilesInTransactions(
            title: "Recharge", date: "26 May 2021", time: "12:20AM"),
        TilesInTransactions(
            title: "Airtel", date: "26 May 2021", time: "12:20AM"),
      ],
    );
  }
}

class TilesInTransactions extends StatelessWidget {
  const TilesInTransactions({
    Key? key,
    required this.title,
    required this.date,
    required this.time,
  }) : super(key: key);
  final String title;
  final String date;
  final String time;
  @override
  Widget build(BuildContext context) {
    bool value = Random().nextBool();
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Color(0xFF24284a),
            child: Icon(Icons.sync_alt),
          ),
          title: Row(
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.bodyText2,
              ),
              Spacer(),
              Text(
                ((value) ? "+" : "-") +
                    " ₹" +
                    Random().nextInt(1000).toString(),
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(color: (!value) ? Colors.red : Colors.green),
              ),
            ],
          ),
          subtitle: Row(
            children: [
              Text(
                date,
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    color: Colors.white.withOpacity(0.5), fontSize: 14),
              ),
              Spacer(),
              Text(
                time,
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    color: Colors.white.withOpacity(0.5), fontSize: 14),
              ),
            ],
          ),
        ),
        Divider(color: Color(0xff8d9ab3)),
      ],
    );
  }
}

class TheCategoriesWidget extends StatelessWidget {
  const TheCategoriesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var rn = Random();
    int value1 = rn.nextInt(4000) + 2000;
    int value2 = rn.nextInt(4000);
    int value3 = rn.nextInt(4000);
    int value4 = rn.nextInt(4000);
    int value5 = 10000 - value1 - value2 - value3 - value4;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CardWidget(
            title: "Mobile Home Dealers",
            date: "17 May",
            payment: value1,
            colors: [
              Color(0xFF6152e3),
              Color(0xFF6152e3).withOpacity(0.8),
            ],
          ),
          CardWidget(
            title: "Taxicabs And Limousines",
            date: "26 May",
            payment: value2,
            colors: [
              Color(0xFF188cdf),
              Color(0xFF10a3aa),
            ],
          ),
          CardWidget(
            title: "Miscellaneous Apparel and Accessory Shops",
            date: "06 Apr",
            payment: value3,
            colors: [
              Color(0xFFfa9b73),
              Color(0xFFce4b73),
            ],
          ),
          CardWidget(
            title: "Electricity, Gas, Sanitary And Water Utilities",
            date: "01 May",
            payment: value4,
            colors: [
              Color(0xFF6152e3),
              Color(0xFF6152e3),
            ],
          ),
          CardWidget(
            title: "Misc. General Merchandise",
            date: "01 Mar",
            payment: (value5<0)? value2:value5,
            colors: [
              Color(0xFF188cdf),
              Color(0xFF10a3aa),
            ],
          ),
        ],
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key? key,
    required this.colors,
    required this.title,
    required this.date,
    required this.payment,
  }) : super(key: key);
  final String title;
  final String date;
  final int payment;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      width: 160,
      child: Stack(
        children: [
          AnimatingPercentageShower(percentage: payment ~/ 100),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  "Last Payment " + date,
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.5), fontSize: 12),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "₹ " +
                          payment.toString().replaceAllMapped(
                              RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                              (Match m) => '${m[1]},'),
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text(
                      (payment ~/ 100).toString() + "%",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
              colors: colors,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
    );
  }
}

class AnimatingPercentageShower extends StatefulWidget {
  const AnimatingPercentageShower({
    Key? key,
    required this.percentage,
  }) : super(key: key);
  final int percentage;
  @override
  _AnimatingPercentageShowerState createState() =>
      _AnimatingPercentageShowerState();
}

class _AnimatingPercentageShowerState extends State<AnimatingPercentageShower> {
  late Timer timer;
  int i = 0;
  double height = 0;
  List<double> heights = [for (int j = 0; j < 28; ++j) 0];
  @override
  void initState() {
    int lastFullHeightTile = (widget.percentage ~/ 3.5741);
    print(lastFullHeightTile);
    height = (widget.percentage / 3.5741) - lastFullHeightTile;
    print(height);
    timer = Timer.periodic(Duration(milliseconds: 80), (timer) {
      if (i <= lastFullHeightTile - 1) heights[i] = 1;
      if (i == lastFullHeightTile) {
        heights[i] = height;
        print("$i box is $height");
        setState(() {});
        timer.cancel();
      }
      i++;
      if (this.timer.isActive) setState(() {});
      if (i == 28) this.timer.cancel();
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Column(
        verticalDirection: VerticalDirection.up,
        children: [
          [1, 2, 3, 4],
          [5, 6, 7, 8],
          [9, 10, 11, 12],
          [13, 14, 15, 16],
          [17, 18, 19, 20],
          [21, 22, 23, 24],
          [25, 26, 27, 28]
        ]
            .map<Widget>((e) => Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    textDirection: TextDirection.rtl,
                    children: e
                        .map<Widget>((e) => Expanded(
                              child: LayoutBuilder(
                                  builder: (context, constraints) {
                                return AnimatedContainer(
                                  margin: EdgeInsets.all(0.5),
                                  height:
                                      heights[e - 1] * constraints.maxHeight,
                                  duration: Duration(milliseconds: 150),
                                  color: Colors.white.withOpacity(0.34),
                                );
                              }),
                            ))
                        .toList(),
                  ),
                ))
            .toList(),
      ),
    );
  }
}

class HeadingText extends StatelessWidget {
  const HeadingText({
    required this.title,
    Key? key,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }
}

class FirstWidget extends StatelessWidget {
  const FirstWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 50,
      child: Row(
        children: [
          Text("Card Balance"),
          Spacer(),
          Text("₹0"),
          Icon(
            Icons.arrow_forward_ios,
            size: 16,
          )
        ],
      ),
      decoration: BoxDecoration(
          color: Color(0xFF252848),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 3,
                offset: Offset(0.4, 2))
          ],
          borderRadius: BorderRadius.circular(6)),
    );
  }
}
