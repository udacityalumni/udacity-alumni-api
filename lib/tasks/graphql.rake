namespace :graphql do
  desc "Generate the graphql ruby introspection schema.json file"
  task generate_schema: :environment do
    query = GraphQL::Introspection::INTROSPECTION_QUERY

    File.open("public/schema.json", "w") do |f|
      f.write(
        JSON.pretty_generate(
          AlumniApiSchema.execute(
            query
          )
        )
      )
    end
  end
end
