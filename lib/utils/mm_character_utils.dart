///MM Character တွေနဲ့ ပက်သပ်ပြီး အသုံးပြုမယ့် utils class
class MmCharacterUtils {
  /// မြန်မာ အက္ခရာ [] လေးထောင့်ကွင်းထဲကနေ တစ်လုံးကို ယူပေးမယ့် method
  static String getMMPrefixWord(String text) {
    RegExp regex = RegExp(r'\[ (.*?) \]');
    final match = regex.firstMatch(text);
    String extractedValue = match?.group(1) ?? '';
    return extractedValue;
  }
}
