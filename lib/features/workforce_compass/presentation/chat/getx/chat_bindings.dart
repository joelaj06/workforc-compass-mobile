import 'package:get/get.dart';

import '../../../domain/usecases/chat/fetch_user_chats.dart';
import '../../../domain/usecases/chat/initiate_chat.dart';
import 'chat_controller.dart';

class ChatBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatController>(() =>  ChatController(fetchUserChats: FetchUserChats(
      workForceRepository: Get.find(),
    ), initiateNewChat: InitiateNewChat(
     workForceRepository: Get.find(),
    )),);
  }
}