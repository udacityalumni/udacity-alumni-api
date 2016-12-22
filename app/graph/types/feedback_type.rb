FeedbackType = GraphQL::ObjectType.define do
  name 'Feedback'
  description 'Feedback submitted by a user'
  field :id, !types.ID, 'The tag id'
  field :description, !types.String, 'Description of the feedback'
  field :url, types.String, 'The url where the feedback came from'
  field :image, types.String, 'The image that the user uploaded'
  field :user, AuthUserType, 'The user that submitted the feedback'
  field :created_at, !types.String, 'When the feedback was created'
  field :updated_at, !types.String, 'When the feedback was updated'
end
