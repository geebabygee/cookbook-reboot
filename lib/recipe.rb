class Recipe
  attr_reader :name, :description
  attr_accessor :prep_time, :done

  def initialize(attributes = {})
    @name = attributes[:name]
    @description = attributes[:description]
    @prep_time = attributes[:prep_time]
    @done = attributes[:done] || false     # <-- this won't work when loading the csv, we'll fix it later
  end

  def done?
    @done
  end

  def mark_as_done!
    @done = true
  end

end

