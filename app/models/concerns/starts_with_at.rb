class StartsWithAt < ActiveModel::Validator
  def validate(record)
    record.errors.add :username, 'Username should begin with the @ symbol!' unless record.username.start_with? '@'
  end
end
