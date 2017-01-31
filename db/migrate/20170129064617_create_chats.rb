class CreateChats < ActiveRecord::Migration[5.0]
  def change
    create_table :chats do |t|
      t.text                :body
      t.string              :image
      t.references          :user, index: :true
      t.references          :group, index: :true
      t.timestamps
    end
  end
end
