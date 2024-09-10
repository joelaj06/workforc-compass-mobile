import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/presentation/utils/app_assets.dart';
import '../../../../../core/presentation/utils/app_spacing.dart';
import '../../../../../core/utils/base_64.dart';
import '../../../../../core/utils/data_formatter.dart';
import '../../../../authentication/data/models/response/user/user_model.dart';
import '../../../data/models/response/chat/chat_model.dart';
import '../getx/chat_controller.dart';

class ChatScreen extends GetView<ChatController> {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getUserChats(1);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
        automaticallyImplyLeading: false,
      ),
      body: _buildChatList(context),
    );
  }

  Widget _buildChatList(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        return controller.getUserChats(1);
      },
      child: Obx(
        () => ListView.builder(
            itemCount: controller.chats.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildChatCard(context, controller.chats[index], index);
            }),
      ),
    );
  }

  Widget _buildChatCard(BuildContext context, Chat chat, int index) {
    final User user = controller.getRecipient(chat);
    final String image = user.imgUrl ?? '';
    return GestureDetector(
      onTap: () {
        controller.navigateToMessages(chat, index);
      },
      child: Container(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: CircleAvatar(
                          child: image.isEmpty
                              ? Image.asset(AppImageAssets.blankProfilePicture)
                              : image.contains('http')
                                  ? CachedNetworkImage(
                                      imageUrl: image,
                                      placeholder:
                                          (BuildContext context, String url) =>
                                              Image.asset(AppImageAssets
                                                  .blankProfilePicture),
                                      errorWidget: (BuildContext context,
                                              String url, dynamic error) =>
                                          const Icon(Icons.error),
                                    )
                                  : Image.memory(
                                      fit: BoxFit.cover,
                                      Base64Convertor().base64toImage(
                                        image,
                                      ),
                                    ),
                        ),
                      ),
                      const AppSpacing(
                        h: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '${user.firstName} ${user.lastName}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Obx(
                            () => Text(
                              controller
                                      .getUserNotifications(chat)
                                      .value
                                      .isEmpty
                                  ? chat.lastMessage ?? ''
                                  : controller
                                      .getUserNotifications(chat)
                                      .value
                                      .first
                                      .message
                                      .text,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Obx(
                        () => Text(
                          controller.getUserNotifications(chat).value.isEmpty
                              ? ''
                              : DataFormatter.getVerboseDateTimeRepresentation(
                                  DateTime.parse(controller
                                          .getUserNotifications(chat)
                                          .value
                                          .first
                                          .date ??
                                      DateTime.now().toIso8601String()),
                                ),
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Obx(
                        () =>
                            controller.getUserNotifications(chat).value.isEmpty
                                ? const SizedBox.shrink()
                                : CircleAvatar(
                                    radius: 10,
                                    child: Obx(
                                      () => Text(
                                        controller
                                            .getUserNotifications(chat)
                                            .value
                                            .length
                                            .toString(),
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 10,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                      )
                    ],
                  )
                ],
              ),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
