class MotorcycleSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :model, :price, :description, :image, :duration_months

  def featured_image
    if object.image.attached?
      {
        url: rails_blob_url(object.image)
      }
    end
  end
end
