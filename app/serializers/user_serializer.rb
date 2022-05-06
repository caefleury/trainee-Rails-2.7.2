class UserSerializer < ActiveModel::Serializer
  attributes :id,:name,:email,:photo_url
  #,:authentication_token

  def photo_url
    if object.photo.attached?
      Rails.application.routes.url_helpers.rails_blob_path(object.photo, only_path: true)
    end
  end
end
