import 'package:flutter/material.dart';
import 'package:task7/data/models/student.dart';
import 'package:task7/database/DBHelper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final studentNameController = TextEditingController();
  final studentAgeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('task7'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: ListView(
            children: [
              TextField(
                controller: studentNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: studentAgeController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Age',
                ),
              ),
              FutureBuilder<List<Student>>(
                future: DBHelper.instance.getStudents(),
                builder: (BuildContext context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Text('loading...');
                  }
                  return snapshot.data!.isEmpty
                      ? const Center(child: Text('no students'))
                      : ListView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: snapshot.data!.map((student) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 3),
                              child: Material(
                                elevation: 2,
                                borderRadius: BorderRadius.circular(20),
                                child: ListTile(
                                  title: Text(student.name),
                                  subtitle: Text('age: ${student.age}'),
                                  trailing: IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () {
                                      setState(() {
                                        DBHelper.instance
                                            .removeStudent(student.id!);
                                      });
                                    },
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                      
                        );
                      
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await DBHelper.instance.addStudent(Student(
              name: studentNameController.text, age: int.parse(studentAgeController.text)));
          setState(() {
            studentNameController.clear();
            studentAgeController.clear();
          });
        },
      ),
    );
  }
}
