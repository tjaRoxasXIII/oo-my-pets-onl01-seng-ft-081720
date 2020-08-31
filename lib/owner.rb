class Owner
  
  attr_accessor :cats, :dogs

  attr_reader :name, :species

  @@all_owners = []

  def initialize(name)
    @name = name
    @species = "human"
    @cats = []
    @dogs = []
    @@all_owners << self
  end

  def self.all 
    @@all_owners
  end

  def say_species
    return "I am a #{@species}."
  end
  
  def self.count
    @@all_owners.count
  end

  def self.reset_all
    @@all_owners.clear
  end

  def cats
    @cats
  end

  def buy_cat(cat)
    Cat.new(cat, owner = self)
    @cats
  end

  def buy_dog(dog)
    Dog.new(dog, owner = self)
    @dogs
  end

  def walk_dogs
    self.dogs.each do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    self.cats.each do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    self.cats.each do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end
    self.cats.clear
    self.dogs.each do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end
    self.dogs.clear
  end

  def list_pets
    return "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end