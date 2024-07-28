class Mutations::CreateUser < GraphQL::Schema::Mutation
  null true

  argument :name, String, required: true
  argument :email, String, required: true

  field :user, Types::UserType, null: true
  field :errors, [String], null: false

  def resolve(name:, email:)
    user = User.new(name: name, email: email)

    if user.save
      { user: user, errors: [] }
    else
      { user: nil, errors: user.errors.full_messages }
    end
  end
end

#     argument :name, String, required: true
#     argument :email, String, required: true

#     type Types::UserType

#     def resolve(name:, email:)
#       User.create!(name: name, email: email)
#     end
#   end
# end
