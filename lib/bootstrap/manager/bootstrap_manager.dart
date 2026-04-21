import 'package:flutter/material.dart';
import 'package:maki_flutter_playground/bootstrap/bootstrap.dart';

class BootstrapManager {
  final MessageController message;
  final GoRouterController goRouter;

  const BootstrapManager({
    required MessageController messageController,
    required GoRouterController goRouterController,
  }) :  message = messageController,
        goRouter = goRouterController;
}

extension Bootstrap on BuildContext {
  BootstrapManager get bootstrap => read<BootstrapManager>();
}