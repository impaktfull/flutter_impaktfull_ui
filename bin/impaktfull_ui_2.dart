import 'package:impaktfull_ui_figma_sync/impaktfull_ui_figma_sync.dart';
import 'src/writor/impaktfull_ui_theme_writor.dart';

Future<void> main(List<String> args) async {
  final theme = await ImpaktfullUiFigmaSync()
      .sync(config: FigmaConfig.parseFromArgs(args));
  await ImpaktfullUiThemeWritor.writeTheme(theme: theme);
}
