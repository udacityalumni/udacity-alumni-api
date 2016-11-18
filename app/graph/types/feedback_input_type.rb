FeedbackInputType = GraphQL::InputObjectType.define do
  name 'FeedbackInput'
  description 'Feedback submitted by a user, input type'
  input_field :description, !types.String, 'Description of the feedback'
  input_field :url, types.String, 'The url where the feedback came from'
end
