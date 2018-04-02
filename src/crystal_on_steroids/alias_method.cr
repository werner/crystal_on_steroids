module AliasMethod
  # Defines new_method as an alias of old_method.	
  #	
  # This creates a new method new_method that invokes old_method.	
  #	
  # Note that due to current language limitations this is only useful	
  # when neither named arguments nor blocks are involved.	
  #	
  # ```	
  # class Person	
  #   getter name	
  #	
  #   def initialize(@name)	
  #   end	
  #	
  #   alias_method full_name, name	
  # end	
  #	
  # person = Person.new "John"	
  # person.name #=> "John"	
  # person.full_name #=> "John"	
  # ```	
  macro alias_method(new_method, old_method)	
    def {{new_method.id}}(*args)	
      {{old_method.id}}(*args)	
    end	
  end
end
