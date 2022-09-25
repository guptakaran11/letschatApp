import 'package:less_chat/models/user_model.dart';

class Message {
  final User sender;
  final String time;
  final String text;
  final bool isLiked;
  final bool unread;

  Message({
    required this.sender,
    required this.time,
    required this.text,
    required this.isLiked,
    required this.unread,
  });
}

final User currentUser = User(
  id: 0,
  name: 'Current User',
  imageUrl: 'assets/greg.jpg',
);
final User greg = User(
  id: 1,
  name: 'Gerg',
  imageUrl: 'assets/greg.jpg',
);
final User james = User(
  id: 2,
  name: 'James',
  imageUrl: 'assets/james.jpg',
);
final User john = User(
  id: 3,
  name: 'John',
  imageUrl: 'assets/john.jpg',
);
final User olivia = User(
  id: 4,
  name: 'Olivia',
  imageUrl: 'assets/olivia.jpg',
);
final User sam = User(
  id: 5,
  name: 'Sam',
  imageUrl: 'assets/sam.jpg',
);
final User sophia = User(
  id: 6,
  name: 'Sophia',
  imageUrl: 'assets/sophia.jpg',
);
final User steven = User(
  id: 7,
  name: 'Steven',
  imageUrl: 'assets/steven.jpg',
);

List<User> favorites = [sam, steven, olivia, john, greg];

List<Message> chats = [
  Message(
    sender: james,
    time: '5:30 PM',
    text: 'Hey , how\'s it going? What did you today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: olivia,
    time: '4:30 PM',
    text: 'Hey , how\'s it going? What did you today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: john,
    time: '3:30 PM',
    text: 'Hey , how\'s it going? What did you today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: sophia,
    time: '2:30 PM',
    text: 'Hey , how\'s it going? What did you today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: steven,
    time: '1:30 PM',
    text: 'Hey , how\'s it going? What did you today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: greg,
    time: '12:30 PM',
    text: 'Hey , how\'s it going? What did you today?',
    isLiked: false,
    unread: true,
  ),
];

// Example Message in chat screen
List<Message> messages = [
  Message(
    sender: james,
    time: '5:30 PM',
    text: 'Hey im good  , how is going today?',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '4:30 PM',
    text: 'Im Fine ,How about you? ',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: james,
    time: '3:45 PM',
    text: 'How are you? ',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '2:45 PM',
    text: 'hello',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: james,
    time: '2:00 PM',
    text: 'Hii..',
    isLiked: false,
    unread: true,
  ),
];
