# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_14_003941) do

  create_table "categoria", force: :cascade do |t|
    t.string "descricao"
    t.boolean "ativo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "feedbacks", force: :cascade do |t|
    t.string "nome"
    t.string "descricao"
    t.string "tipo"
    t.integer "curtiu"
    t.integer "naocurtiu"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "produtos", force: :cascade do |t|
    t.string "nome"
    t.string "situacao"
    t.string "categoria"
    t.string "tamanho"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "usuario_id", null: false
    t.string "descricao"
    t.string "marca"
    t.string "imagem"
    t.string "ja_doado", default: "Não"
    t.index ["usuario_id"], name: "index_produtos_on_usuario_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "nome"
    t.string "password_digest"
    t.string "email"
    t.string "cpf"
    t.date "dataNascimento"
    t.string "cep"
    t.string "telefone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "ativo", default: true
    t.boolean "admin"
    t.index ["email"], name: "index_usuarios_on_email", unique: true
  end

  add_foreign_key "produtos", "usuarios"
end
