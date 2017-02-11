class Chat < ApplicationRecord

  belongs_to     :user
  belongs_to     :group
  validates :body, presence: true
  mount_uploader :image, ImageUploader

def for_js
  { name: user.name, time: created_at.strftime("%Y年%m月%d日 %H時%M分"), body: body,  image: image}
end
end
