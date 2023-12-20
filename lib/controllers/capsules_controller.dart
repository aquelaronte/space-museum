import 'package:space_museum/graphql_config.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:space_museum/models/capsules_model.dart';

class CapsulesController {
  static GraphQLConfig graphQLConfig = GraphQLConfig();
  final GraphQLClient _client = graphQLConfig.clientToQuery();

  Future<List<CapsuleModel>> getCapsules() async {
    try {
      QueryResult result = await _client.query(QueryOptions(document: gql("""
      query Capsules {
        capsules {
          id
          reuse_count
          status
          type
        }
      }
      """), fetchPolicy: FetchPolicy.noCache));

      if (result.hasException) {
        throw Exception(result.exception);
      }

      List? res = result.data?['capsules'];

      if (res == null || res.isEmpty) {
        return [];
      }

      List<CapsuleModel> capsules =
          res.map((capsule) => CapsuleModel.fromMap(map: capsule)).toList();

      return capsules;
    } catch (error) {
      throw Exception(error);
    }
  }
}
