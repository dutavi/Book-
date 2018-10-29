class Book < ApplicationRecord
 # extend FriendlyId
 #friendly_id :title, use: :slugged
  acts_as_taggable_on :genres

  belongs_to :user
  has_one_attached :cover
  has_many_attached :related_images

  before_save :set_slug, on: :create

  private

  def set_slug
    self.slug = title.split(/\s+/).map do |word|
      word.gsub(/[^A-Za-z0-9]/, "").downcase
    end.join("-") + "-" + SecureRandom.uuid
  end
end
