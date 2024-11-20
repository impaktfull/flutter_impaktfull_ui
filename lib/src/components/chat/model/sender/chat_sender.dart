class ImpaktfullUiChatSender {
  final String id;
  final String? name;
  final String? avatarUrl;
  final bool? isOnline;

  const ImpaktfullUiChatSender({
    required this.id,
    this.name,
    this.avatarUrl,
    this.isOnline,
  });
}
