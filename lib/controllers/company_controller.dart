import 'package:space_museum/graphql_config.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:space_museum/models/company_model.dart';

class CompanyController {
  static GraphQLConfig graphQLConfig = GraphQLConfig();
  final GraphQLClient _client = graphQLConfig.clientToQuery();

  Future<CompanyModel>? getCompany() async {
    try {
      QueryResult result = await _client.query(QueryOptions(document: gql("""
      query Company {
        company {
          employees
          founded
          founder
          headquarters {
            address
            city
            state
          }
          launch_sites
          links {
            elon_twitter
            flickr
            twitter
            website
          }
          name
          summary
          test_sites
          valuation
          vehicles
          ceo
        }
      }
      """), fetchPolicy: FetchPolicy.noCache));

      if (result.hasException) {
        throw Exception(result.exception);
      }

      Map? res = result.data?['company'];

      CompanyModel company = CompanyModel.fromMap(map: res!);

      return company;
    } catch (error) {
      throw Exception(error);
    }
  }
}
