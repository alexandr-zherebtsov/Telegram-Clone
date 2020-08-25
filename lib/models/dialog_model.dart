import 'package:flutgram/models/person_model.dart';

class Dialog {
  final User sender;
  final String time;
  final String text;
  final bool unread;

  Dialog({
    this.sender,
    this.time,
    this.text,
    this.unread,
  });
}

List<Dialog> dialog = [
  Dialog(
    sender: currentUser,
    time: '22:43',
    text: 'Quis autem vel eum iure.',
    unread: true,
  ),
  Dialog(
    sender: userId1,
    time: '22:42',
    text: 'nisi ut aliquid ex ea commodi consequatur?',
    unread: false,
  ),
  Dialog(
    sender: currentUser,
    time: '22:41',
    text: 'Quis nostrum exercitationem ullam corporis suscipit laboriosam.',
    unread: false,
  ),
  Dialog(
    sender: userId1,
    time: '22:39',
    text: 'Ut enim ad minima veniam.',
    unread: false,
  ),
  Dialog(
    sender: userId1,
    time: '22:38',
    text: 'Sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.',
    unread: false,
  ),
  Dialog(
    sender: currentUser,
    time: '22:35',
    text: 'Adipisci velit.',
    unread: false,
  ),
  Dialog(
    sender: userId1,
    time: '22:33',
    text: 'Nemo enim ipsam voluptatem.',
    unread: false,
  ),
  Dialog(
    sender: currentUser,
    time: '22:31',
    text: 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
    unread: false,
  ),
  Dialog(
    sender: userId1,
    time: '13:59',
    text: 'Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam.',
    unread: false,
  ),
  Dialog(
    sender: userId1,
    time: '13:50',
    text: 'Quis autem vel eum iure?',
    unread: false,
  ),
  Dialog(
    sender: currentUser,
    time: '8:09',
    text: 'Vel illum qui dolorem eum fugiat.',
    unread: false,
  ),
  Dialog(
    sender: userId1,
    time: '8:03',
    text: 'Lorem ipsum dolor sit amet.',
    unread: false,
  ),
];
