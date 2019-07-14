require 'csv'
require 'pry-byebug'
require_relative 'recipe'

class Cookbook
  def initialize(csv_file_path)
    @recipes = []
    @csv_file_path = csv_file_path
    load_csv
  end

  def all
    @recipes
  end

  def add_recipe(recipe)
    @recipes << recipe
    rewriting_csv
  end

  def remove_recipe(index)
    @recipes.delete_at(index)
    rewriting_csv
  end

  def mark_recipe_as_done(index)
    recipe = @recipes[index]
    recipe.mark_as_done!
    rewriting_csv
  end

  private

  # CSV => RUBY
  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |row|
      # recipe = Recipe.new(name: row[0], description: row[1], prep_time: row[2])
      row[:done] = row[:done] == "true"
      recipe = Recipe.new(row)
      @recipes << recipe
    end
  end


  # # RUBY => CSV
  def rewriting_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      csv << [ "name", "description", "prep_time", "done" ]
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.prep_time, recipe.done?]
      end
    end
  end
end

# Same order from load_csv and rewriting_csv!!
