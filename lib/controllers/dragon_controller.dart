import 'package:space_museum/graphql_config.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:space_museum/models/dragon_model.dart';

class DragonController {
  static GraphQLConfig graphQLConfig = GraphQLConfig();
  final GraphQLClient _client = graphQLConfig.clientToQuery();

  Future<List<DragonModel>> getDragons() async {
    try {
      QueryResult result = await _client.query(QueryOptions(document: gql("""
      query Dragons {
        dragons {
          active
          crew_capacity
          description
          dry_mass_kg
          dry_mass_lb
          first_flight
          heat_shield {
            material
            temp_degrees
            size_meters
          }
          id
          name
          type
          wikipedia
          diameter {
            feet
            meters
          }
        }
      }
      """), fetchPolicy: FetchPolicy.noCache));

      if (result.hasException) {
        throw Exception(result.exception);
      }

      List? res = result.data?['dragons'];

      if (res == null || res.isEmpty) {
        return [];
      }

      List<DragonModel> dragon =
          res.map((capsule) => DragonModel.fromMap(map: capsule)).toList();

      return dragon;
    } catch (error) {
      throw Exception(error);
    }
  }
}
