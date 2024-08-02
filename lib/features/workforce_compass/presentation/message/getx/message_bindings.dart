
import 'package:get/get.dart';

import '../../../domain/usecases/message/fetch_messages.dart';
import '../../../domain/usecases/message/post_message.dart';
import 'message_controller.dart';

class MessageBindings extends Bindings{
  @override
  void dependencies() {
    Get.put<MessageController>(
      MessageController(postMessage: PostMessage(
        workForceRepository: Get.find(),
      ), fetchMessages: FetchMessages(
        workForceRepository: Get.find(),
      ))
    );
  }

}