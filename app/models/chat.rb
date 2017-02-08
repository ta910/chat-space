class Chat < ApplicationRecord

  belongs_to     :user
  belongs_to     :group
  validates :body, presence: true

def for_js
  { name: user.name, time: created_at.strftime("%Y年%m月%d日 %H時%M分"), body: body}
end
end
