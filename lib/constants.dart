
import 'package:flutter_dotenv/flutter_dotenv.dart';

String get kSupabaseProjectUrl => dotenv.env['kSupabaseProjectUrl'] ?? '';

String get kSupabasePublicKey => dotenv.env['kSupabasePublicKey'] ?? '';

String get imagesBucket => dotenv.env['kImageBucket'] ?? '';