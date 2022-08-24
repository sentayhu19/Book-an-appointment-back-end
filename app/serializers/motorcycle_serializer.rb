class MotorcycleSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :model, :description, :duration_months, :price, :image
  def image
    return unless object.image.attached?

    {
      url: rails_blob_url(object.image)
    }
  end
end
