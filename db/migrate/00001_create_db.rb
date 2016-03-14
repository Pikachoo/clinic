

class CreateDb < ActiveRecord::Migration
  def change
    create_table "users", force: :cascade do |t|
      t.string  "login",   limit: 155, null: false
      t.string  "hash",    limit: 32,  null: false
      t.string  "salt",    limit: 32,  null: false
      t.integer "role_id", limit: 4,   null: false
    end

    create_table "user_roles", force: :cascade do |t|
      t.string "name", limit: 32, null: false
    end
  end
end
