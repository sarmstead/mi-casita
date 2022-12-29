class StartsWithAt < ActiveModel::Validator
  def validate(record)
    record.errors.add :username, 'should begin with the @ symbol!' unless record.username.start_with? '@'
  end
end
