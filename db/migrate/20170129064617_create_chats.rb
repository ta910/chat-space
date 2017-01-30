class CreateChats < ActiveRecord::Migration[5.0]
  def change
    create_table :chats do |t|
      t.text                :body
      t.string              :image
      t.references          :user
      t.references          :group
      t.timestamps
    drop_table :messages
    end
  end
end
