require_relative "lib/recipe"
require_relative "lib/cookbook"
require_relative "lib/scraper"

# pasta = Recipe.new("pasta bol", "tomato and mince meat pasta")

csv_file = "lib/recipes.csv"
cookbook = Cookbook.new(csv_file)

# cookbook.add_recipe(pasta)

# scraper = Scraper.new("chocolate")

# p scraper.call


p cookbook.all
