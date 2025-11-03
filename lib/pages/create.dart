import 'package:flutter/material.dart';

class CreateGroupPage extends StatefulWidget {
  const CreateGroupPage({super.key});

  @override
  State<CreateGroupPage> createState() => _CreateGroupPageState();
}

class _CreateGroupPageState extends State<CreateGroupPage> {
  final TextEditingController controller = TextEditingController();
  var members = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2E8CF),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 20),
              Text(
                "Neue Gruppe erstellen",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        fillColor: Color(0xFF386641),
                        border: OutlineInputBorder(),
                        hintText: "Gruppenname",
                        hintStyle: const TextStyle(
                          color: Color(0xFF386641)
                        )
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  SizedBox(
                    height: 46,
                    width: 46,
                    child: ElevatedButton(
                      onPressed: () {
                        addMember();
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        backgroundColor: Color(0xFF6A994E),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                          "+",
                          style: TextStyle(
                            fontSize: 24,
                            color: Color(0xFFF2E8CF),
                          )
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: members.length,
                  itemBuilder: (context, index) {
                    final name = members[index];
                    return Container(
                      margin: EdgeInsets.only(bottom: 5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          color: Color(0xFF386641),
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Text(
                                name,
                                style: TextStyle(
                                  color: Color(0xFFF2E8CF),
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              RedBigButton("Gruppe erstellen"),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  void addMember() {
    String name = controller.text;
    controller.clear();

    // Check if the name is valid and the name is not already in the list
    if (name.isNotEmpty && !members.contains(name)) {
      members.add(name);
    }

    setState(() {});
  }

  Widget RedBigButton(String name) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFBC4749),
          foregroundColor: Color(0xFFF2E8CF),
          textStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
        ),
        onPressed: () {},
        child: Text(name),
      ),
    );
  }
}