class UserProfileSerializer < ActiveModel::Serializer
  attributes :id, :name, :gender, :birth_date, :address, :is_married

  def name
    object.full_name
  end
  
end
