import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseCredential{
  static String url = dotenv.env['SUPABASE_URL']?? "";
  static String anonKey = dotenv.env['SUPABASE_ANONKEY'] ?? "";

}

Future<void> InitializeSupabase() async {

  await Supabase.initialize(url: SupabaseCredential.url, anonKey: SupabaseCredential.anonKey);

}