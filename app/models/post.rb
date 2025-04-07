class Post < ApplicationRecord
  scope :published_recent, -> {where(published: true).order(created_at: :desc)}

  def formatted_title
    title.titleize
  end

  def self.recent
    where("created_at >= ?", 7.days.ago).where(published: true).order(created_at: :desc)
  end
end
