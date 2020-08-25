import 'package:flutgram/models/dialog_model.dart';
import 'package:flutgram/models/person_model.dart';

String lastMsg() {

  final lastMsgNum = dialog[0];

  if (lastMsgNum.sender == currentUser) {
    String lastMsgText = 'You: ${lastMsgNum.text}';
    return lastMsgText;
  } else {
    String lastMsgText = lastMsgNum.text;
    return lastMsgText;
  }

}

class Message {
  final User sender;
  final String time;
  final String text;
  final bool muted;
  final bool inUnread;
  final int outUnread;
  final int messagesNumber;
  final List userDialog;

  Message({
    this.sender,
    this.time,
    this.text,
    this.muted,
    this.inUnread,
    this.outUnread,
    this.messagesNumber,
    this.userDialog,
  });
}

List<Message> chats = [
  Message(
    sender: userId1,
    time: '23:38',
    text: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.',
    muted: false,
    inUnread: true,
    outUnread: 3,
    messagesNumber: 2,
    userDialog: dialog,
  ),
  Message(
    sender: userId2,
    time: '12:11',
    text: lastMsg(),
    //text: 'This is text!',
    muted: false,
    inUnread: false,
    outUnread: 1,
    messagesNumber: null,
  ),
  Message(
    sender: userId3,
    time: '11:11',
    text: 'ok :)',
    muted: false,
    inUnread: false,
    outUnread: 1,
    messagesNumber: null,
  ),
  Message(
    sender: userId4,
    time: '28 jun.',
    text: 'This text from uk...',
    muted: true,
    inUnread: true,
    outUnread: 3,
    messagesNumber: 49,
  ),
  Message(
    sender: userId5,
    time: '21 jun.',
    text: 'It\'s Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    muted: false,
    inUnread: true,
    outUnread: 3,
    messagesNumber: 124,
  ),

  Message(
    sender: userId6,
    time: '15 jun.',
    text: 'It\'s text.',
    muted: false,
    inUnread: false,
    outUnread: 2,
    messagesNumber: null,
  ),
  Message(
    sender: userId7,
    time: '14 jun.',
    text: 'お元気ですか',
    muted: false,
    inUnread: false,
    outUnread: 2,
    messagesNumber: null,
  ),
  Message(
    sender: userId8,
    time: '14 jun.',
    text: '你好',
    muted: false,
    inUnread: false,
    outUnread: 3,
    messagesNumber: null,
  ),
  Message(
    sender: userId9,
    time: '13 jun.',
    text: 'Rock\'n\'Roll!',
    muted: false,
    inUnread: false,
    outUnread: 3,
    messagesNumber: null,
  ),
  Message(
    sender: userId10,
    time: '2 jun.',
    text: 'سلام! یک‌ رنگ قشنگ برای صفحه تلگرام من میتونی بیاری ؟؟',
    muted: false,
    inUnread: false,
    outUnread: 3,
    messagesNumber: null,
  ),
  Message(
    sender: userId11,
    time: '1 jun.',
    text: 'Bye',
    muted: true,
    inUnread: false,
    outUnread: 3,
    messagesNumber: null,
  ),
];
