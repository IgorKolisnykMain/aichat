import 'package:aichat/src/features/ai_chat/presentation/controller/auth_controller.dart';
import 'package:aichat/src/features/ai_chat/presentation/dialogs/chat_treads_bottom_sheet.dart';
import 'package:aichat/src/utils/extensions/build_context_extensions.dart';
import 'package:aichat/src/utils/extensions/responsive_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatHeaderWidget extends ConsumerWidget {
  const ChatHeaderWidget({super.key});

  void _logout(WidgetRef ref) => ref.read(authControllerProvider.notifier).logout();
  void _deleteAccount(WidgetRef ref) => ref.read(authControllerProvider.notifier).deleteAccount();

  void _showThreadsMenu(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      backgroundColor: context.colors.backgroundLight,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20.rr))),
      builder: (BuildContext context) {
        return const ChatTreadsBottomSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.dimensions.paddingMedium.rw,
        vertical: context.dimensions.paddingSmall.rsp,
      ),
      decoration: BoxDecoration(
        color: context.colors.backgroundLight,
        border: Border(bottom: BorderSide(color: context.colors.borderSubtle)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 48.rw,
            height: 48.rh,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.rr),
              border: Border.all(color: context.colors.borderSubtle),
            ),
            child: PopupMenuButton<String>(
              onSelected: (value) {
                switch (value) {
                  case 'logout':
                    _logout(ref);
                  case 'delete':
                    _deleteAccount(ref);
                }
              },
              itemBuilder: (BuildContext context) => [
                PopupMenuItem<String>(
                  value: 'logout',
                  child: Row(
                    children: [
                      Icon(Icons.logout, color: context.colors.textDark),
                      SizedBox(width: 8.rw),
                      Text(context.l10n.logout),
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'delete',
                  child: Row(
                    children: [
                      Icon(Icons.delete_forever, color: context.colors.red),
                      SizedBox(width: 8.rw),
                      Text(
                        context.l10n.deleteAccount,
                        style: TextStyle(color: context.colors.red),
                      ),
                    ],
                  ),
                ),
              ],
              icon: Icon(Icons.more_vert, size: 24.rsp, color: context.colors.textDark),
            ),
          ),
          Expanded(
            child: Text(
              context.l10n.hearMeOutAiPsychologist,
              style: context.textStyles.authTitle.copyWith(color: context.colors.textDark),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: 48.rw,
            height: 48.rh,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.rr),
              border: Border.all(color: context.colors.borderSubtle),
            ),
            child: IconButton(
              onPressed: () {
                _showThreadsMenu(context, ref);
              },
              icon: Icon(Icons.menu, size: 24.rsp, color: context.colors.textDark),
            ),
          ),
        ],
      ),
    );
  }
}
