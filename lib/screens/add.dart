import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AddIncomePage extends StatefulWidget {
  const AddIncomePage({super.key});

  @override
  State<AddIncomePage> createState() => _AddIncomePageState();
}

class _AddIncomePageState extends State<AddIncomePage> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ADD")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: FormBuilder(
          child: Column(
            children: [
              FormBuilderCheckbox(
                name: "type",
                title: Text("income or expenditure"),
                initialValue: true,
              ),
              FormBuilderTextField(
                name: "amount",
                decoration: InputDecoration(labelText: "uniin dun"),
              ),
              FormBuilderTextField(
                name: "description",
                decoration: InputDecoration(labelText: "tailbar"),
              )
            ],
          ),
          key: _formKey,
        ),
      ),
      persistentFooterButtons: [
        Row(
          children: [
            ElevatedButton(onPressed: () {}, child: const Text("Add"))
          ],
        )
      ],
    );
  }
}
