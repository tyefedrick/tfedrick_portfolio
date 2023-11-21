class CreatePortfolios < ActiveRecord::Migration[7.0]
  def change
    create_table :portfolios do |t|
      t.string :title
      t.text :about
      t.text :resources
      t.json :photos
      t.string :github_link
      t.string :website_link

      t.timestamps
    end
  end
end
