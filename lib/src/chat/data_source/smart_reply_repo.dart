import 'package:google_mlkit_smart_reply/google_mlkit_smart_reply.dart';

class CustomSmartReply {
  static CustomSmartReply? _customSmartReply;

  static SmartReply? _smartReply;

  CustomSmartReply._internal() {
    _smartReply ??= SmartReply();
  }

  static CustomSmartReply instance() {
    _customSmartReply ??= CustomSmartReply._internal();
    return _customSmartReply!;
  }

  SmartReply get getSmallReply => _smartReply!;
}
