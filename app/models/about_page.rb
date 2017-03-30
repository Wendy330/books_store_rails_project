class AboutPage < ApplicationRecord
  validates :title, :contents, presence:true
end
