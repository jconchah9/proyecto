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

ActiveRecord::Schema.define(version: 20170709051225) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "acceptances", force: :cascade do |t|
    t.text     "summary"
    t.string   "state"
    t.integer  "budget_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["budget_id"], name: "index_acceptances_on_budget_id", using: :btree
  end

  create_table "accounts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_accounts_on_company_id", using: :btree
    t.index ["user_id"], name: "index_accounts_on_user_id", using: :btree
  end

  create_table "analyses", force: :cascade do |t|
    t.text     "summary"
    t.string   "state"
    t.integer  "calendar_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["calendar_id"], name: "index_analyses_on_calendar_id", using: :btree
  end

  create_table "budget_documents", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "budget_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.index ["budget_id"], name: "index_budget_documents_on_budget_id", using: :btree
  end

  create_table "budgets", force: :cascade do |t|
    t.string   "state"
    t.text     "summary"
    t.integer  "analysis_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["analysis_id"], name: "index_budgets_on_analysis_id", using: :btree
  end

  create_table "calendars", force: :cascade do |t|
    t.datetime "visit_date"
    t.string   "state"
    t.text     "sumary"
    t.integer  "study_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["study_id"], name: "index_calendars_on_study_id", using: :btree
  end

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.string   "commercial_business"
    t.string   "enterprise"
    t.string   "telephone"
    t.string   "cellphone"
    t.string   "email"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "commercial_business"
    t.string   "rut"
    t.integer  "user_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["user_id"], name: "index_companies_on_user_id", using: :btree
  end

  create_table "contracts", force: :cascade do |t|
    t.integer  "company_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "user_id"
    t.integer  "acceptance_id"
    t.index ["acceptance_id"], name: "index_contracts_on_acceptance_id", using: :btree
    t.index ["company_id"], name: "index_contracts_on_company_id", using: :btree
    t.index ["user_id"], name: "index_contracts_on_user_id", using: :btree
  end

  create_table "crops", force: :cascade do |t|
    t.string   "name"
    t.datetime "harvest_date"
    t.integer  "minimum_value"
    t.integer  "maximum_value"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "detail_contracts", force: :cascade do |t|
    t.integer "contract_id"
    t.integer "sector_id"
    t.index ["contract_id"], name: "index_detail_contracts_on_contract_id", using: :btree
    t.index ["sector_id"], name: "index_detail_contracts_on_sector_id", using: :btree
  end

  create_table "document_analyses", force: :cascade do |t|
    t.string   "name"
    t.string   "type_file"
    t.text     "descripcion"
    t.integer  "analysis_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.index ["analysis_id"], name: "index_document_analyses_on_analysis_id", using: :btree
  end

  create_table "monitoring_sensors", force: :cascade do |t|
    t.float    "measuring"
    t.integer  "sensor_id"
    t.datetime "sent_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sensor_id"], name: "index_monitoring_sensors_on_sensor_id", using: :btree
  end

  create_table "monitorings", force: :cascade do |t|
    t.integer  "sector_id"
    t.integer  "sensor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sector_id"], name: "index_monitorings_on_sector_id", using: :btree
    t.index ["sensor_id"], name: "index_monitorings_on_sensor_id", using: :btree
  end

  create_table "petitions", force: :cascade do |t|
    t.string   "state",                default: "pendiente"
    t.integer  "client_id"
    t.text     "summary"
    t.string   "request_file_name"
    t.string   "request_content_type"
    t.integer  "request_file_size"
    t.datetime "request_updated_at"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.index ["client_id"], name: "index_petitions_on_client_id", using: :btree
  end

  create_table "photo_sectors", force: :cascade do |t|
    t.string   "name"
    t.string   "type_file"
    t.string   "description"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.integer  "sector_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["sector_id"], name: "index_photo_sectors_on_sector_id", using: :btree
  end

  create_table "plants", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "number"
    t.string   "commune"
    t.string   "city"
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_plants_on_company_id", using: :btree
  end

  create_table "reports", force: :cascade do |t|
    t.datetime "sent_at"
    t.float    "average_value"
    t.float    "minimun_value"
    t.float    "maximum_value"
    t.integer  "sensor_id"
    t.string   "type_value"
    t.index ["sensor_id"], name: "index_reports_on_sensor_id", using: :btree
  end

  create_table "restrictions", force: :cascade do |t|
    t.integer  "minimum_value"
    t.integer  "maximum_value"
    t.datetime "harvest_date"
    t.boolean  "is_active"
    t.integer  "sector_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["sector_id"], name: "index_restrictions_on_sector_id", using: :btree
  end

  create_table "sectors", force: :cascade do |t|
    t.string   "name"
    t.integer  "plant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "crop_id"
    t.index ["crop_id"], name: "index_sectors_on_crop_id", using: :btree
    t.index ["plant_id"], name: "index_sectors_on_plant_id", using: :btree
  end

  create_table "sensors", force: :cascade do |t|
    t.integer  "id_sensor"
    t.string   "type_sensor"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "studies", force: :cascade do |t|
    t.string   "summary",                  default: "null"
    t.string   "state",                    default: "en_analisis"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.string   "feasibility_file_name"
    t.string   "feasibility_content_type"
    t.integer  "feasibility_file_size"
    t.datetime "feasibility_updated_at"
    t.integer  "petition_id"
    t.index ["petition_id"], name: "index_studies_on_petition_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "last_name"
    t.string   "rut"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "permission_level",       default: 1
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "acceptances", "budgets"
  add_foreign_key "accounts", "companies"
  add_foreign_key "accounts", "users"
  add_foreign_key "analyses", "calendars"
  add_foreign_key "budget_documents", "budgets"
  add_foreign_key "budgets", "analyses"
  add_foreign_key "calendars", "studies"
  add_foreign_key "companies", "users"
  add_foreign_key "contracts", "acceptances"
  add_foreign_key "contracts", "companies"
  add_foreign_key "contracts", "users"
  add_foreign_key "detail_contracts", "contracts"
  add_foreign_key "detail_contracts", "sectors"
  add_foreign_key "document_analyses", "analyses"
  add_foreign_key "monitoring_sensors", "sensors"
  add_foreign_key "monitorings", "sectors"
  add_foreign_key "monitorings", "sensors"
  add_foreign_key "petitions", "clients"
  add_foreign_key "photo_sectors", "sectors"
  add_foreign_key "plants", "companies"
  add_foreign_key "reports", "sensors"
  add_foreign_key "restrictions", "sectors"
  add_foreign_key "sectors", "crops"
  add_foreign_key "sectors", "plants"
  add_foreign_key "studies", "petitions"
end
