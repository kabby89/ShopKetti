class RemovePostsTasksProjects < ActiveRecord::Migration
  def change
  	drop_table :posts
  	drop_table :post_attachments
  	drop_table :projects
  	drop_table :tasks
  end
end
