import 'package:flutter/material.dart';
import 'chat_screen.dart';

class GroupChatScreen extends StatefulWidget {
  @override
  _GroupChatScreenState createState() => _GroupChatScreenState();
}

class _GroupChatScreenState extends State<GroupChatScreen> {
  final TextEditingController _groupNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  List<String> _emails = [];

  void _addEmail() {
    if (_emailController.text.isNotEmpty && !_emails.contains(_emailController.text)) {
      setState(() {
        _emails.add(_emailController.text);
      });
      _emailController.clear();
    }
  }

  void _createGroup() {
    if (_groupNameController.text.isNotEmpty && _emails.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChatScreen(groupName: _groupNameController.text, emails: _emails, title: 'chatscreen',),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Create Group Chat',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22.0,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 150, 93, 150),
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _groupNameController,
              decoration: InputDecoration(labelText: 'Group Name'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Add Member (Email Address)',
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: _addEmail,
                ),
              ),  
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _emails.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_emails[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          _emails.removeAt(index);
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            if (_emails.isNotEmpty)
              ElevatedButton(
                onPressed: _createGroup,
                child: Text('Proceed to Chat'),
              ),
          ],
        ),
      ),
    );
  }
}
