class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :body

      t.timestamps
      
      #:body　はシンボル？　引数
    end
  end
end
