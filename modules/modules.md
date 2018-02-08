### Learning Goals

* Understand what modules are in Ruby
* When and how to write modules

## What is a Module?

In Ruby, we have a number of different ways to share methods and functionality amongst our objects.  One of these ways is with the `Module`. In fact the ruby core library is made up of modules that contain methods that we use all the time, for example, the `Enumerable` module.

The `Enumerable` module lets us use the methods such as `.each` or `.sort` ([along with a bunch of other methods](http://ruby-doc.org/core-2.3.0/Enumerable.html)) on a collection.

## When and How to Write Modules

So as you can see the `Module` gives us some powerful abilities in defining what methods our objects have access to.

So let's first talk about Wizards.

## Magical Modules

```ruby
class Wizard

  def cast_spell(spell)
    if spell_list.include?(spell)
      "With the power of the æther, I cast #{spell}!"
    else
      "I can't cast #{spell}."
    end
  end

  private

  def spell_list
    [
      "Magic Missile",
      "Shield of Shielding",
      "Animate Rope",
      "Diplomacy",
      "Pull Quarter from Ear"
    ]
  end
end

wizard = Wizard.new
puts wizard.cast_spell "Magic Missile"
#=> "With the power of the æther, I cast Magic Missile!"
```

The `Wizard` class defined above has a single public method, `cast_spell`, that allows the wizard to cast any spell in their `spell_list`.

The problem is, we also have the following class: `CardboardDork`, and they can *also* cast spells.

```ruby
class CardboardDork
  def cast_spell(spell)
    if spell_list.include?(spell)
      "With the power of the æther, I cast #{spell}!"
    else
      "I can't cast #{spell}."
    end
  end

  private

  def spell_list
    [
      "Lightning Bolt",
      "Terminate",
      "Black Lotus",
      "Force of Will"
    ]
  end
end
```

As you can see, the `cast_spell` method in both cases are identical. They both check the `spell_list` and have the same arcane/silly message when we run the method.

```ruby
gandalf = Wizard.new
vorthos = CardboardDork.new

gandalf.cast_spell "Magic Missile"
#=> "With the power of the æther, I cast Magic Missile!"

vorhtos.cast_spell "Magic Missile"
#=> "I can't cast Magic Missile."

gandalf.cast_spell "Black Lotus"
#=> "I can't cast Black Lotus"

vorhtos.cast_spell "Black Lotus"
#=> "With the power of the æther, I cast Black Lotus!"
```

We can create a shared `Module` that holds the `cast_spell` method definition, and then `include` this `Module` in both the `Wizard` and `CardboardDork` classes!


```ruby
module Casting

  def cast_spell(spell)
    if spell_list.include?(spell)
      "With the power of the æther, I cast #{spell}!"
    else
      "I can't cast #{spell}."
    end
  end

end

class Wizard
  include Casting

  private

  def spell_list
    [
      "Magic Missile",
      "Shield of Shielding",
      "Animate Rope",
      "Diplomancy",
      "Pull Quarter from Ear"
    ]
  end
end

class CardboardDork
  include Casting

  private

  def spell_list
    [
      "Lightning Bolt",
      "Terminate",
      "Black Lotus",
      "Force of Will"
    ]
  end
end
```

Our classes both have access to the `cast_spell` method defined in our `Casting` module!

```ruby
gandalf = Wizard.new
vorthos = CardboardDork.new

gandalf.cast_spell "Magic Missile"
#=> "With the power of the æther, I cast Magic Missile!"

vorthos.cast_spell "Magic Missile"
#=> "I can't cast Magic Missile."

gandalf.cast_spell "Black Lotus"
#=> "I can't cast Black Lotus"

vorthos.cast_spell "Black Lotus"
#=> "With the power of the æther, I cast Black Lotus!"
```

## Extending Ephemera

We've been developing a bit more, and we've realized we need a quick *class method* that defines the classes that are magic users.

```ruby
class Wizard
  include Casting

  def self.magic_user?
    true
  end

  # other methods
end
```

Of course, `CardboardDork` also needs access to this method. We can wrap this up in a module, like so:

```ruby
module MagicUser

  def self.magic_user?
    true
  end

end

class Wizard
  include Casting
  include MagicUser

  # other methods
end
```

Unfortunately, this does not work:

```ruby
Wizard.magic_user?
#=> error in `<main>': undefined method `magic_user?' for Wizard:Class (NoMethodError)
```

This is because modules do not have the same context for `self` that classes do. Calling `self` in a module does not refer to the class you are `include`-ing it into, but rather the *module itself*.

In order to share class methods, we have to use a different keyword to include them, and format them a little differently.

When working with modules, `include` is a keyword that means "add all of the modules methods to this class as instance methods". `extend` does the same, except it makes all of the methods of the `extend`-ed module *class methods* instead of instance methods!

```ruby
module MagicUser
  def magic_user?
    true
  end
end


class Wizard
  include Casting
  extend MagicUser

  # other methods
end

Wizard.magic_user?
#=> true
```

## When to use Modules

Modules let us break up repeatable logic into neat, organized containers that we can share among our classes. They also introduce a **dependency** between the modules we include/extend into classes, and the classes themselves. A major danger of modules is how good they can be at *hiding* code or functionality that should be more closely examined. Modules can quickly become junk drawers for functionality that we trust works, even though there may be no testing.

Modules can work this dependency for their favor, however: the ability for a modular to give a class a set of methods means that they can be great for *defining explicit interfaces* - for instance, imagine a module that defines a user-driveable vehicle. No matter what that vehicle is, we want to make sure that the methods `go` and `stop`. We could let each individual class define those methods, and we could make *sure* each class does so by giving it something to override in the module!

```ruby
module Driveable
  def go
    puts "You must implement a 'go' method!"
  end

  def stop
    puts "You must implement a 'stop' method!"
  end

end

class Car
  include Driveable

  def go
    # in this method, we overwrite the module's method so that we don't output the message.
  end

  # with no 'stop' method, calling `.stop` on an instance of Car will tell us we need to implement this method!
end
```

This way, we know that anything with the module `Driveable` should be made to implement the methods `stop` and `go`.

When sharing logic amongst your code, consider first reaching for code composition - breaking up logic and workflow into small, testable objects who work together. When they continue to be shared in the same way across multiple classes, then consider if Modules  is the right solution.
