class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
		    t.integer 'priority'
        t.boolean 'status', :default => false
        t.string 'name'
      	t.datetime 'deadline'
        t.integer 'list_id'

      	t.timestamps null: false
    end
    add_index 'tasks', 'priority', unique: true
  end
end
