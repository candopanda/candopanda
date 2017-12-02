class CreateSurveys < ActiveRecord::Migration[5.1]
  def change
    enable_extension 'pgcrypto'

    create_table :surveys, id: :uuid do |t|
      t.text :source_code
      t.datetime :completed_at

      t.timestamps
    end
  end
end
