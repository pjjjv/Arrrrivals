import 'package:polymer/builder.dart';

void main(List<String> args) {
  build(entryPoints: ['web/arrrrivals.html'],
        options: parseOptions(args));
  lint(entryPoints: ['web/arrrrivals.html'],
        options: parseOptions(args));
}