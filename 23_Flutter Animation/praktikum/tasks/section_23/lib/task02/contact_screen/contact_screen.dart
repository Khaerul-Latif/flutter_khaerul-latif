import 'package:section_23/task02/bloc/bloc1.dart';
import 'package:section_23/task02/utils/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../create_contact_screen/create_contact_screen.dart';
import 'components/items.dart';

class MyContactScreen extends StatefulWidget {
  const MyContactScreen({Key? key}) : super(key: key);

  @override
  State<MyContactScreen> createState() => _MyContactScreenState();
}

class _MyContactScreenState extends State<MyContactScreen> {
  @override
  void initState() {
    context.read<ClassBloc>().add(LoadContact());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            AppRoute.to(const MyContactScreen(), const CreateContactScreen()),
        tooltip: 'Create Contact',
        child: const Icon(Icons.add),
      ),
    );
  }
}
