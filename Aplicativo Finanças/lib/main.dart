import 'dart:ui';
import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'calendar.dart';
import 'chart_page.dart';
import 'finances.dart';
import 'options_page.dart';
import 'support_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project Fince',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
      home: MyHomePage(title: 'Project Fince Home Page'),
      routes: {
        "/options_page": (context) => OptionsPage(),
        "/support_page": (context) => SupportPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Expense> despesas = [];
  Finance finance = Finance();
  TextEditingController essentialExpController1 = TextEditingController();
  TextEditingController essentialExpController2 = TextEditingController();
  TextEditingController nonEssentialExpController1 = TextEditingController();
  TextEditingController nonEssentialExpController2 = TextEditingController();
  PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    _readFinanceFile();
  }

  @override
  void dispose() {
    essentialExpController1.dispose();
    essentialExpController2.dispose();
    nonEssentialExpController1.dispose();
    nonEssentialExpController2.dispose();
    super.dispose();
  }

  Future<String> get _localPath async {
    Directory directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    String path = await _localPath;
    return File("$path/finance.txt");
  }

  void _writeFinanceFile() async {
    print("Writing finance data to file");
    File file = await _localFile;
    if (await file.exists()) {
      await file.writeAsString(jsonEncode(finance.toJson()));
      print("success");
    } else {
      await file.create();
      await file.writeAsString(jsonEncode(finance.toJson()));
      print("file didn't exist, but now was created");
    }
  }

  void _readFinanceFile() async {
    print("reading finance file");
    try {
      File file = await _localFile;
      if (await file.exists()) {
        String content = await file.readAsString();
        setState(() {
          Finance.fromJson(json.decode(content));
        });
        print(content);
      } else {
        await file.create();
        setState(() {
          _writeFinanceFile();
        });
      }
    } catch (e) {
      print("couldn't read the finance file");
      print(e);
    }
  }

  Widget revenueTable() {
    return Flexible(
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 2),
              child: Text(
                "Revenue",
                style: TextStyle(color: Colors.green[300]),
              ),
            ),
            Flexible(
              child: Text(
                "${finance.totalRevenue.toStringAsFixed(2)}",
              ),
            ),
            
            PopupMenuButton(
              icon: Icon(Icons.add),
              itemBuilder: (context) => <PopupMenuEntry<dynamic>>[
                PopupMenuItem(
                  child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Revenue",
                      ),
                      onSubmitted: (text) => setState(() {
                            if (double.parse(text) < 0) {
                              print("Error: negative revenue");
                            } else {
                              finance.addRevenue(double.parse(text));
                              _writeFinanceFile();
                            }
                          })),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget essentialExpensesTable() {
    return Flexible(
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 2),
              child: Text(
                "Essential Expenses",
                style: TextStyle(color: Colors.red),
              ),
            ),
            Flexible(
              child: ListView.builder(
                  itemCount: finance.eExpenses.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Text(finance.eExpenses[index].name),
                                Text(finance.eExpenses[index].value
                                    .toStringAsFixed(2)),
                              ],
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.highlight_remove,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                setState(() {
                                  finance.removeeExpense(index);
                                });
                                _writeFinanceFile();
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            PopupMenuButton(
              icon: Icon(Icons.add),
              itemBuilder: (context) => <PopupMenuEntry<dynamic>>[
                PopupMenuItem(
                  child: Row(
                    children: [
                      Flexible(
                        child: Column(
                          children: [
                            TextField(
                              controller: essentialExpController1,
                              decoration: InputDecoration(
                                hintText: "Expense name",
                              ),
                            ),
                            TextField(
                              keyboardType: TextInputType.number,
                              controller: essentialExpController2,
                              decoration: InputDecoration(
                                hintText: "Expense value",
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            if (essentialExpController1.text.isNotEmpty &&
                                essentialExpController2.text.isNotEmpty) {
                              print(
                                  "Controlador 1 ${essentialExpController1.text}");
                              print(
                                  "Controlador 2 ${essentialExpController2.text}");
                                  if (num.tryParse(essentialExpController1.text) != null){
                                    print("Expense name cannot be a number");
                                    return;
                                  }
                              setState(() {
                                if (double.parse(essentialExpController2.text) <
                                    0) {
                                  print("Error, negative number");
                                  return;
                                } else {
                                  finance.addExpense(
                                      true,
                                      essentialExpController1.text,
                                      double.parse(
                                          essentialExpController2.text),
                                          DateTime.now(),);
                                  _writeFinanceFile();
                                }
                              });
                            }
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget nonEssentialExpensesTable() {
    return Flexible(
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 2),
              child: Text(
                "Non-Essential Expenses",
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 201, 251),
                ),
              ),
            ),
            Flexible(
              child: ListView.builder(
                  itemCount: finance.nExpenses.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Text(finance.nExpenses[index].name),
                                Text(finance.nExpenses[index].value
                                    .toStringAsFixed(2)),
                              ],
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.highlight_remove,
                                color: Color.fromARGB(255, 255, 201, 251),
                              ),
                              onPressed: () {
                                setState(() {
                                  finance.removenExpense(index);
                                });
                                _writeFinanceFile();
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            PopupMenuButton(
              icon: Icon(Icons.add),
              itemBuilder: (context) => <PopupMenuEntry<dynamic>>[
                PopupMenuItem(
                  child: Row(
                    children: [
                      Flexible(
                        child: Column(
                          children: [
                            TextField(
                              controller: nonEssentialExpController1,
                              decoration: InputDecoration(
                                hintText: "Expense name",
                              ),
                            ),
                            TextField(
                              keyboardType: TextInputType.number,
                              controller: nonEssentialExpController2,
                              decoration: InputDecoration(
                                hintText: "Expense value",
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            if (nonEssentialExpController1.text.isNotEmpty &&
                                nonEssentialExpController2.text.isNotEmpty) {
                              print(
                                  "Controlador 1 ${nonEssentialExpController1.text}");
                              print(
                                  "Controlador 2 ${nonEssentialExpController2.text}");
                                  if (num.tryParse(nonEssentialExpController1.text) != null){
                                    print("Expense name cannot be a number");
                                    return;
                                  }
                              if (double.parse(
                                      nonEssentialExpController2.text) <
                                  0) {
                                print("Error, negative number");
                                return;
                              } else {
                                setState(() {
                                  finance.addExpense(
                                      false,
                                      nonEssentialExpController1.text,
                                      double.parse(
                                          nonEssentialExpController2.text),
                                          DateTime.now(),);
                                  _writeFinanceFile();
                                });
                              }
                            }
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget totalExpenses() {
    return Flexible(
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: Text(
                "Total expenses",
                style: TextStyle(
                  color: Color.fromARGB(255, 252, 227, 252),
                ),
              ),
            ),
            Flexible(
              child: Text(
                "${finance.totaleExpense + finance.totalnExpense}",
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget balance() {
    return Flexible(
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: Text(
                "Balance",
                style: TextStyle(
                    color:
                        finance.balance >= 0 ? Colors.green[300] : Colors.red),
              ),
            ),
            Flexible(
              child: Text(
                "${finance.balance.toStringAsFixed(2)}",
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black38,
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Image.network(
              "https://images.financialexpress.com/2019/08/home-finance-1.jpg",
            ),
            OutlineButton(
              child: Text("Premium(deactivated)"),
              onPressed: () {},
            ),
            OutlineButton(
              child: Text("Options"),
              onPressed: () => Navigator.pushNamed(context, "/options_page"),
            ),
            Spacer(),
            OutlineButton(
              child: Text("Support"),
              onPressed: () => Navigator.pushNamed(context, "/support_page"),
            ),
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        children: [
          Center(
            child: Container(
              color: Colors.black38,
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Placeholder(
                      strokeWidth: 1,
                      fallbackHeight: 20,
                      fallbackWidth: 80,
                    ),
                  ),
                  revenueTable(),
                  essentialExpensesTable(),
                  nonEssentialExpensesTable(),
                  totalExpenses(),
                  balance(),
                ],
              ),
            ),
          ),
          Column(
            children: [
              Flexible(
                child: Container(
                  color: Colors.black38,
                  child: ChartPage(
                    "EssentialExpenses",
                    true,
                    Colors.red,
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  color: Colors.black38,
                  child: ChartPage(
                    "NonEssentialExpenses",
                    true,
                    Color.fromARGB(255, 255, 201, 251),
                  ),
                ),
              ),
            ],
          ),
          Calendar(),
        ],
      ),
    );
  }
}
