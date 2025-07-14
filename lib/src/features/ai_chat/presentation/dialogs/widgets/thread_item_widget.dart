import 'package:aichat/src/utils/extensions/build_context_extensions.dart';
import 'package:aichat/src/utils/extensions/responsive_extension.dart';
import 'package:flutter/material.dart';

class ThreadItemWidget extends StatelessWidget {
  final String threadId;
  final bool isSelected;

  final VoidCallback onSelect;
  final VoidCallback onDelete;

  const ThreadItemWidget({
    super.key,
    required this.threadId,
    required this.isSelected,
    required this.onSelect,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: context.dimensions.paddingSmall.rsp),
      decoration: BoxDecoration(
        color: isSelected ? context.colors.primary.withValues(alpha: 0.1) : context.colors.backgroundAccent,
        borderRadius: BorderRadius.circular(12.rr),
        border: Border.all(color: isSelected ? context.colors.primary : context.colors.borderSubtle),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.rw, vertical: 4.rsp),
        title: Text(
          context.l10n.threadId(threadId),
          style: context.textStyles.bodyMedium.copyWith(
            color: isSelected ? context.colors.primary : context.colors.textDark,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!isSelected)
              IconButton(
                icon: Icon(Icons.chat_bubble_outline, size: 20.rsp, color: context.colors.textSecondary),
                onPressed: () {
                  Navigator.pop(context);
                  onSelect();
                },
              ),
            IconButton(
              icon: Icon(Icons.delete_outline, size: 20.rsp, color: Colors.red),
              onPressed: () {
                Navigator.pop(context);
                onDelete();
              },
            ),
          ],
        ),
      ),
    );
  }
}
