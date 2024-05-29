import 'package:flutter/material.dart';
import 'package:flutter_income_app/screens/add.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("list of income"),
          backgroundColor: Colors.purple[300],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddIncomePage()))),
        body: Scrollbar(
          child: ListView.separated(
            separatorBuilder: (context, index) => const Divider(),
            itemCount: 5,
            itemBuilder: ((context, index) {
              return Slidable(
                  endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      extentRatio: 0.3,
                      children: [
                        SlidableAction(
                          onPressed: (_) {},
                          label: "delete",
                          icon: Icons.delete,
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                        )
                      ]),
                  child: const ListTile(
                    title: Text("sariin suul tsalin"),
                    subtitle: Text("income"),
                    leading: Icon(Icons.attach_money),
                    trailing: Text("1,000,000"),
                  ));
            }),
          ),
        ));
  }
}
