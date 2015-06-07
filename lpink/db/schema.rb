# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150513110010) do

  create_table "acta", force: :cascade do |t|
    t.integer  "acta_correlativo", limit: 4
    t.date     "acta_fecha"
    t.time     "acta_inicio"
    t.time     "acta_termino"
    t.integer  "proyecto_id",      limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "acta", ["proyecto_id"], name: "index_acta_on_proyecto_id", using: :btree

  create_table "elemento_dialogicos", force: :cascade do |t|
    t.integer  "dialogico_correlativo", limit: 4
    t.string   "dialogico_nombre",      limit: 255
    t.text     "dialogico_referencia",  limit: 65535
    t.string   "dialogico_estado",      limit: 255
    t.integer  "tipo_elemento_id",      limit: 4
    t.integer  "actum_id",              limit: 4
    t.integer  "tema_id",               limit: 4
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "elemento_dialogicos", ["actum_id"], name: "index_elemento_dialogicos_on_actum_id", using: :btree
  add_index "elemento_dialogicos", ["tema_id"], name: "index_elemento_dialogicos_on_tema_id", using: :btree
  add_index "elemento_dialogicos", ["tipo_elemento_id"], name: "index_elemento_dialogicos_on_tipo_elemento_id", using: :btree

  create_table "participante_acta", force: :cascade do |t|
    t.integer  "participante_id",          limit: 4
    t.integer  "actum_id",                 limit: 4
    t.boolean  "participante_acta_estado", limit: 1
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "participante_acta", ["actum_id"], name: "index_participante_acta_on_actum_id", using: :btree
  add_index "participante_acta", ["participante_id"], name: "index_participante_acta_on_participante_id", using: :btree

  create_table "participante_proyectos", force: :cascade do |t|
    t.integer  "participante_id", limit: 4
    t.integer  "proyecto_id",     limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "participante_proyectos", ["participante_id"], name: "index_participante_proyectos_on_participante_id", using: :btree
  add_index "participante_proyectos", ["proyecto_id"], name: "index_participante_proyectos_on_proyecto_id", using: :btree

  create_table "participantes", force: :cascade do |t|
    t.string "participante_nombre",    limit: 255
    t.string "participante_apellido",  limit: 255
    t.string "participante_iniciales", limit: 255
    t.string "participante_foto",      limit: 255
    t.string "participante_rut",       limit: 255
    t.string "email",                  limit: 255
    t.string "tipo",                   limit: 255
    t.string "password_hash",          limit: 255
    t.string "password_salt",          limit: 255
  end

  create_table "proyectos", force: :cascade do |t|
    t.string "proyecto_nombre", limit: 255
    t.string "descripcion",     limit: 300
    t.date   "fecha_inicio"
    t.date   "fecha_fin"
  end

  create_table "temas", force: :cascade do |t|
    t.integer  "tema_correlativo", limit: 4
    t.text     "tema_descripcion", limit: 65535
    t.string   "tema_nombre",      limit: 255
    t.integer  "actum_id",         limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "temas", ["actum_id"], name: "index_temas_on_actum_id", using: :btree

  create_table "tipo_elementos", force: :cascade do |t|
    t.string   "tipo_nombre", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_foreign_key "acta", "proyectos"
  add_foreign_key "elemento_dialogicos", "acta"
  add_foreign_key "elemento_dialogicos", "temas"
  add_foreign_key "elemento_dialogicos", "tipo_elementos"
  add_foreign_key "participante_acta", "acta"
  add_foreign_key "participante_acta", "participantes"
  add_foreign_key "participante_proyectos", "participantes"
  add_foreign_key "participante_proyectos", "proyectos"
  add_foreign_key "temas", "acta"
end
