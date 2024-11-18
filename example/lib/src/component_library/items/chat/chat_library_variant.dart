import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/items/chat/chat_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/util/network_images.dart';
import 'package:impaktfull_ui_example/src/widget/component/components_library_variant_descriptor.dart';

final chatItems = [
  ImpaktfullUiChatItem(
    message: 'Sounds good!',
    senderId: '2',
    timestamp: DateTime.now().subtract(const Duration(seconds: 1)),
  ),
  ImpaktfullUiChatItem(
    message:
        "Monday works for me, all day! Let's meet at 10:00 AM at the office",
    senderId: '1',
    timestamp: DateTime.now().subtract(const Duration(seconds: 30)),
  ),
  ImpaktfullUiChatItem(
    message: 'Sure',
    senderId: '1',
    timestamp: DateTime.now().subtract(const Duration(seconds: 40)),
  ),
  ImpaktfullUiChatItem(
    message: 'No, I am on holiday, can we reschedule it for next week?',
    senderId: '2',
    timestamp: DateTime.now().subtract(const Duration(minutes: 80)),
  ),
  ImpaktfullUiChatItem(
    message:
        'Great! I just wanted to know if you are available for the meeting tomorrow.',
    senderId: '1',
    timestamp: DateTime.now().subtract(const Duration(minutes: 95)),
  ),
  ImpaktfullUiChatItem(
    message: 'Greate! How are you?',
    senderId: '2',
    timestamp: DateTime.now().subtract(const Duration(minutes: 99)),
  ),
  ImpaktfullUiChatItem(
    message: 'Hi',
    senderId: '2',
    timestamp: DateTime.now().subtract(const Duration(minutes: 99)),
  ),
  ImpaktfullUiChatItem(
    message: 'Hello, how are you?',
    senderId: '1',
    timestamp: DateTime.now().subtract(const Duration(minutes: 100)),
  ),
];

class ChatLibraryVariant
    extends ComponentLibraryVariant<ChatLibraryPrimaryInputs> {
  const ChatLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(BuildContext context, ChatLibraryPrimaryInputs inputs) {
    return [
      ComponentsLibraryVariantDescriptor(
        height: 350,
        wrapWithCard: true,
        padding: EdgeInsets.zero,
        child: ImpaktfullUiChat(
          senderConfig: const ImpaktfullUiChatSenderConfig.oneToOne(
            me: ImpaktfullUiChatSender(
              id: '2',
              name: 'Koen Van Looveren',
              avatarUrl: NetworkImages.profilePicture,
            ),
            other: ImpaktfullUiChatSender(
              id: '1',
              name: 'Client',
              avatarUrl: NetworkImages.avatar1,
            ),
          ),
          senderIdsTypingStream: Stream.periodic(
            const Duration(seconds: 10),
            (value) => value.isEven ? ['1'] : [],
          ),
          items: chatItems,
        ),
      ),
      ComponentsLibraryVariantDescriptor(
        height: 350,
        wrapWithCard: true,
        padding: EdgeInsets.zero,
        child: ImpaktfullUiChat(
          senderConfig: const ImpaktfullUiChatSenderConfig(
            me: ImpaktfullUiChatSender(
              id: '2',
              name: 'Koen Van Looveren',
              avatarUrl: NetworkImages.profilePicture,
            ),
            others: [
              ImpaktfullUiChatSender(
                id: '1',
                name: 'Client',
                avatarUrl: NetworkImages.avatar1,
              ),
              ImpaktfullUiChatSender(
                id: '3',
                name: 'Client 2',
                avatarUrl: NetworkImages.avatar2,
              ),
            ],
          ),
          senderIdsTypingStream: Stream.periodic(
            const Duration(seconds: 10),
            (value) => value.isEven ? ['1'] : [],
          ),
          items: [
            ImpaktfullUiChatItem(
              message: 'Also perfect for me!',
              senderId: '3',
              timestamp: DateTime.now().subtract(const Duration(seconds: 0)),
            ),
            ...chatItems,
          ],
        ),
      ),
    ];
  }

  @override
  ChatLibraryPrimaryInputs inputs() => ChatLibraryPrimaryInputs();
}

class ChatLibraryPrimaryInputs extends ChatLibraryInputs {}
