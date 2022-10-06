import 'package:section_22/bloc/bloc.dart';
import 'package:section_22/utils/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../create_contact_screen/create_contact_screen.dart';
import 'components/items.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    context.read<ClassBloc>().add(LoadContact());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact'),
      ),
      body: BlocBuilder<ClassBloc, ListContact>(
        builder: (context, state) => Stack(
          children: [
            ListView.builder(
              itemCount: state.newListContact.length,
              itemBuilder: (context, index) {
                var contact = state.listContact[index];
                return Items(contact: contact);
              },
            ),
            state.newListContact.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.group),
                        Text('Your contact is empty')
                      ],
                    ),
                  )
                : Container()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            AppRoute.to(const MyHomePage(), const CreateContactScreen()),
        tooltip: 'New Contact',
        child: const Icon(Icons.add),
      ),
    );
  }
}
