import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kommunicate_flutter/kommunicate_flutter.dart';
import 'package:raam_dhulaai/src/chat/data_source/chat_data_source.dart';
import 'package:raam_dhulaai/src/chat/providers/chat_list_provider.dart';
import 'package:raam_dhulaai/src/core/extensions/context_extension.dart';
import 'package:raam_dhulaai/src/core/providers/firbease_provider.dart';
import 'package:raam_dhulaai/src/core/routes/app_router.dart';
import 'package:raam_dhulaai/src/core/widgets/widgets.dart';
import 'package:raam_dhulaai/src/home/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChatListView extends StatefulHookConsumerWidget {
  const ChatListView({Key? key, required this.isMerchant}) : super(key: key);
  final bool isMerchant;

  @override
  _ChatListViewState createState() => _ChatListViewState();
}

class _ChatListViewState extends ConsumerState<ChatListView> {
  bool get isMerchant => widget.isMerchant;

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      appBar: AppBar(title: const Text('Chat')),
      // body: ref.watch(getChatProvider).maybeWhen(
      //       orElse: Container.new,
      //       loading: () => context.loader,
      //       data: (data) {
      //         return ListView.builder(
      //           itemCount: data.length,
      //           itemBuilder: (context, index) {
      //             final room = data[index];
      //             return ChatListTile(
      //               imageUrl: data[index].id,
      //               name: isMerchant ? (room.user?.name ?? '') : (room.merchant?.name ?? ''),
      //               subtitle: 's',
      //               onPressed: () {},
      //             );
      //           },
      //         );
      //       },
      //     ),
      // body: Column(),
      body: ref.watch(chatListNotifierProvider(isMerchant)).maybeWhen(
            orElse: Container.new,
            loading: () => context.loader,
            success: (data) => Column(
              children: [
                GestureDetector(
                  onTap: ()async{
                    try {
     dynamic conversationObject = {
         'appId': dotenv.env['KOMMUNICATE_APPID'] 
     };
      dynamic result = await KommunicateFlutterPlugin.buildConversation(conversationObject);
      print("Conversation builder success : " + result.toString());
    } on Exception catch (e) {
      print("Conversation builder error occurred : " + e.toString());
    }
                  },
                  child: Container(
                    child: Text('Chat'),
                  ),
                ),
                ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final room = data[index];
                    return ChatListTile(
                      imageUrl: '',
                      name: room.product?.name ?? '',
                      subtitle: isMerchant
                          ? (room.user?.name ?? '')
                          : (room.merchant?.name ?? ''),
                      onPressed: () => context.router.push(ChatDetailRoute(
                        product: room.product!,
                        roomId: room.id,
                        isMerchant: isMerchant,
                        merchant: room.merchant,
                        user: room.user,
                      )),
                    );
                  },
                ),
              ],
            ),
          ),
    );
  }
}


 // ref.watch(getChatListProvider(widget.isMerchant)).maybeWhen(
          //       orElse: Container.new,
          //       data: (data) => SliverList(
          //         delegate: SliverChildBuilderDelegate(
          //           (context, index) => StreamBuilder(
          //               stream: ref.watch(getChatListProvider(true).stream),
          //               builder: (context, value) {
          //                 print(value);
          //                 return ChatListTile(
          //                   onPressed: () {
          //                     context.router.push(const ChatDetailRoute());
          //                   },
          //                   imageUrl: 'https://placehold.jp/30/dd6699/ffffff/300x150.png?text=A',
          //                   name: 'Aayush Bhattarai',
          //                   subtitle: 'Hi, I just booked service.',
          //                 );
          //               }),
          //         ),
          //       ),
          //     ),