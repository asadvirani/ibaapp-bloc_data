import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibaapp/bloc/user_bloc.dart/user_bloc.dart';
import 'package:ibaapp/bloc/user_bloc.dart/user_event.dart';
import 'package:ibaapp/bloc/user_bloc.dart/user_states.dart';
import 'package:ibaapp/core/repository/user_repo.dart';
import 'package:intl/intl.dart';

class UserPage extends StatefulWidget {
  final UserRepository userRepository;

  const UserPage({Key? key, required this.userRepository}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  late UserBloc _userBloc;

  @override
  void initState() {
    super.initState();
    _userBloc = UserBloc(userRepository: widget.userRepository);
    _userBloc.add(const FetchUser());
  }

  String _formatDate(Timestamp timestamp) {
    DateTime dateTime = timestamp.toDate();
    DateTime now = DateTime.now();

    String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
    String today = DateFormat('yyyy-MM-dd').format(now);

    if (formattedDate == today) {
      return 'TODAY';
    } else {
      return formattedDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Column(
          children: [
            Row(
              children: <Widget>[
                Icon(Icons.arrow_back_sharp),
                Spacer(),
                Icon(Icons.more_horiz),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Text("Monday"),
                // Text("17 Nov"),
                Text(
                    DateFormat('EEEE').format(
                        DateTime.now()), // Display current day (e.g., Monday)
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(
                    DateFormat('dd MMM').format(
                        DateTime.now()), // Display current date (e.g., 17 Nov)
                    style: TextStyle(fontSize: 16)),
              ],
            )
          ],
        ),
      ),
      body: Center(
        child: BlocBuilder(
          bloc: _userBloc,
          builder: (_, UserState state) {
            if (state is UserEmpty) {
              return const Center(child: Text('Empty state'));
            }
            if (state is UserLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is UserLoaded) {
              return ListView.builder(
                itemCount: state.user.length,
                itemBuilder: (BuildContext context, int i) {
                  var obj = state.user[i];
                  print(obj.Date);
                  return ListTile(
                    //  leading: Icon(Icons.{obj.}),
                    leading: const Icon(Icons.person, color: Colors.blue),
                    title: Text(obj.title),
                    subtitle: Text(_formatDate(obj.Date)),
                    trailing: Text(
                      obj.price,
                      style: TextStyle(
                        color: (int.parse(obj.price) < 0
                            ? Colors.red
                            : Colors.green),
                      ),
                    ),
                  );
                },
              );
            }
            if (state is UserError) {
              return const Text(
                'Something went wrong!',
                style: TextStyle(color: Colors.red),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _userBloc.close();
    super.dispose();
  }
}
