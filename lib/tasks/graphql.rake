namespace :graphql do
  desc "Generate the graphql ruby introspection schema.json file"
  task all: [:generate_schema, :move_schema]
  
  task generate_schema: :environment do
    query = GraphQL::Introspection::INTROSPECTION_QUERY

    File.open("./schema.json", "w") do |f|
      f.write(
        JSON.pretty_generate(
          AlumniApiSchema.execute(
            query
          )
        )
      )
    end
  end
  task move_schema: :environment do
    FileUtils.mv("./schema.json", "../client/config/linting")
  end
end
