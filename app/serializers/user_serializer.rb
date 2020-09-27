class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :full_name, :dob, :email

end
