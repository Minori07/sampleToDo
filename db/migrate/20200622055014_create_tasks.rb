class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|

      t.string :title, null: false #タイトル
      t.text :description, null: true #詳細
      t.datetime :completed_at, null: true #完了日時
      t.boolean :completed, null: false, default: false #完了したか
      t.integer :user_id, null: true #user結びつけ

      t.timestamps
    end
  end
end
