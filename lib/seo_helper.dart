import 'dart:html' as html;

class SeoHelper {
  static void setMetaTags({
    required String title,
    required String description,
  }) {
    // تغيير العنوان
    html.document.title = title;

    // تغيير الوصف
    _setMeta('description', description);

    _setMeta('og:title', title);
    _setMeta('og:description', description);
  }

  static void _setMeta(String name, String content) {
    html.MetaElement? meta = html.document
        .querySelector('meta[name="$name"]') as html.MetaElement?;

    if (meta == null) {
      meta = html.MetaElement()..name = name;
      html.document.head!.append(meta);
    }

    meta.content = content;
  }
}