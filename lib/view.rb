class View

  def display(recipes)
      recipes.each_with_index do |recipe, index|
        # prep_time = recipe.prep_time.nil? ? " " : "(#{recipe.prep_time})"
        done = recipe.done? ? "[X]" : "[ ]"
        puts "#{index + 1}. #{done} #{recipe.name}: #{recipe.description} (#{recipe.prep_time})"
    end
  end

  def ask_user_for(stuff)
    puts "#{stuff}?"
    print "> "
    gets.chomp
  end

  # def ask_user_for_index
  #   puts "Please type a number to choose which recipe"
  #   gets.chomp.to_i - 1
  # end

end
