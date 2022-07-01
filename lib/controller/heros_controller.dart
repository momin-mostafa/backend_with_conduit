import 'package:back_end_with_conduit/back_end_with_conduit.dart';

class HeroController extends Controller {
  final List heroList = [
    {"id": 11, "name": "Mr. Nice"},
    {"id": 12, "name": "Narco"},
    {"id": 13, "name": "Bombasto"},
    {"id": 14, "name": "Celeritas"},
    {"id": 15, "name": "Magneta"}
  ];

  // HeroController.byId(int id){
  //   for (final element in heroList) {
  //     if (element['id'] == id) {
  //       return Response.ok(element);
  //     }
  //   }
  // }

  // In just a moment, we'll replace this code with something even better,
// but it's important to understand where this information comes from first!
  // @override
  // Future<RequestOrResponse> handle(Request request) async {
  //   if (request.path.variables.containsKey('id')) {
  //     final id = int.parse(request.path.variables['id']!);
  //     final hero =
  //         _heroes.firstWhere((hero) => hero['id'] == id, orElse: () => null);
  //     if (hero == null) {
  //       return Response.notFound();
  //     }

  //     return Response.ok(hero);
  //   }

  //   return Response.ok(_heroes);
  // }

  @override
  FutureOr<RequestOrResponse?> handle(Request request) async {
    if (request.path.variables.containsKey('id')) {
      final id = int.tryParse(request.path.variables['id']!);
      final hero =
          heroList.firstWhere((hero) => hero['id'] == id, orElse: () => null);
      if (hero == null) {
        return Response.notFound();
      }
      return Response.ok(hero);
    }

    return Response.ok(heroList);
  }
}
