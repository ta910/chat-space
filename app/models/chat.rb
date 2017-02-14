class Chat < ApplicationRecord

  belongs_to     :user
  belongs_to     :group
  validates :body_or_image, presence: true
  mount_uploader :image, ImageUploader

  def time
    created_at.strftime("%Y年%m月%d日 %H時%M分")
  end

  def for_js
    { name: user.name, time: created_at.strftime("%Y年%m月%d日 %H時%M分"), body: body,  image: image.to_s }
  end

  private
    def body_or_image
      body.presence or image.presence
    end
end
