import 'dart:developer';

void logCloud(String tag, String message) {
  log('\x1B[34m[ $tag ] - $message\x1B[0m');
}
