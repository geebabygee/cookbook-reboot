require_relative 'cookbook'
require_relative 'scraper'
require_relative 'view'

class Controller

 def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
 end

  # 1. Get recipes (repo)
  # 2. Display recipes in the terminal (view)
  def list
    recipes = @cookbook.all
    @view.display(recipes)
  end

  def create
    # 1. Ask user for a name (view)
    # 2. Ask user for a description (view)
    # 3. Create recipe (model)
    # 4. Store in cookbook (repo)
    name = @view.ask_user_for("name")
    description = @view.ask_user_for("description")
    prep_time = @view.ask_user_for("prep time")
    # 3. Create recipe (model)
    recipe = Recipe.new(name: name, description: description, prep_time: prep_time)
    @cookbook.add_recipe(recipe)
  end

  def destroy
    # 1. Get recipes (repo)
    # 2. Display recipes in the terminal - in an ordered list (view)
    # 3. Ask user for a number (view)
    # 4. Remove it from DB (repo)
    list
    index = @view.ask_user_for("index").to_i - 1
    @cookbook.remove_recipe(index)
  end


  def import
  # 1. Ask user for a keyword
  # 2. Open url
  # 3. Parse HTML
  # 4. For the first five results
  # 5. Create recipe and store it in results
  # 6. Display results
  # 7. Ask for the recipe to import
  # 8. Add to cookbook
  # 9. Display recipes
    ingredient = @view.ask_user_for("ingredient")
    results = Scraper.new(ingredient).call
    @view.display(results)
    index = @view.ask_user_for("index").to_i - 1
    recipe = results[index]
    @cookbook.add_recipe(recipe)
    list
  end

    # 1. Display recipes
    # 2. Ask user for an index (view)
    # 3. Find recipe (repo)
    # 4. Mark it as done (model)
    # 5. Save to csv (repo)
    # 6. Display recipes


  def mark_as_done
    list
    index = @view.ask_user_for("index").to_i - 1
    recipe = @cookbook.mark_recipe_as_done(index)
  end


end
