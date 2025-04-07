class Post < ApplicationRecord
  scope :published_recent, -> {where(published: true).order(created_at: :desc)}

  def formatted_title
    title.titleize
  end
end
