### Introduction

In this article, we're going to be looking at one of the core features of Ruby,
and one of the core concepts of Object Oriented Programming: **inheritance**.

But first, let's talk about Elves.

### Elvish Inheritance

```ruby
class Elf
  def favorite_environment
    "Forest"
  end
end
```

The `Elf` class defined above has a single public method, describing the
`favorite_environment` that elves live in, `"Forest"`.

What if you wanted to model a specific *kind* of elf? There are plenty of
different kinds of elves, of course. Take the Deadly Wood Elves, for instance.
They also like the forest, but are much more ruthless.

If we tried to model this, we might make it look like this.

```ruby
class WoodElf
  def favorite_environment
    "Forest"
  end
end
```

`WoodElf` shares a public interface with `Elf` - a method called
`favorite_environment`. They even return the same value.

```ruby
legolas = Elf.new
malborn = WoodElf.new

puts legolas.favorite_environment
# => "Forest"

puts malborn.favorite_environment
# =>  "Forest"

legolas.favorite_environment == malborn.favorite_environment
# => true
```

We can begin to reason that a `WoodElf` is a *kind* of `Elf` - They have the
same public methods, and we can imagine that we might want to make more *kinds*
of `Elf` in the future.

This is the problem that inheritance is meant to solve!

When a class inherits from another class, the 'parent' class shares all of its
methods with the 'child class'. We can re-write `WoodElf` to be a 'child' class
of `Elf`, so that we can share the `favorite_environment` method among them.


```ruby
class WoodElf < Elf
end
```

The class name on the left side of the `<` character is the child class, and the
class on the right is the parent. `Elf` is the "parent" or "superclass", and
`WoodElf` is the "child" or "subclass". `WoodElf` gains all of the instance
variables and behavior that an `Elf` has.

This means that our `WoodElf` now has access to all the methods that `Elf` has!

```ruby
legolas = Elf.new
malborn = WoodElf.new

puts legolas.favorite_environment
# => "Forest"

puts malborn.favorite_environment
# =>  "Forest"

legolas.favorite_environment == malborn.favorite_environment
# => true

```

It all works exactly the same as it did before, because of inheritance.

### Overwriting Parents

Over time, we've added some more methods to `Elf`.

```ruby
class Elf

  attr_reader :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def favorite_environment
    "Forest"
  end

  def size
    "Medium"
  end

  def weapon_of_choice
    "Bow"
  end

end
```

`WoodElf` looks the same - it's still inheriting all of these methods (including,
notably, `initialize`), and as such is still pretty barren.

```ruby
class WoodElf < Elf
end
```

But now we find we want to create a new kind of Elf: Cookie Elves.

Cookie elves also live in the forest, but their preferred weapon isn't a Bow, it's Marketing. More over, their size is small, not medium. How do we show this in our new class?

```ruby
class CookieElf < Elf

  def size
    "Small"
  end

  def weapon_of_choice
    "Marketing"
  end
end
```

When a child class implements a method that its parent defines, it completely
**overwrites** that method. It does not effect that method on its parent.

```ruby
legolas = Elf.new("Legolas", 2931)
malborn = WoodElf.new("Malborn", 221)
ernie = CookieElf.new("Ernie", 47)

puts legolas.size
# => "Medium"

puts malborn.size
# => "Medium"

puts ernie.size
# => "Small"
```

By overwriting methods, we can introduce new behavior to child classes. We'll
need to remember this going forward - if we change the behavior of `size` on
the `Elf`, that change will be completely ignored by the `CookieElf` because it
is already implementing its own version of `size`.

### The `super` Keyword

We're going to implement one more method onto `Elf` - a greeting for nearby
travelers.

```ruby
class Elf
  # other methods...

  def greet(name)
    "Hello, #{name}."
  end
end
```

Cookie elves have a more involved greeting that they want to use. Rather than
re-implement the entire method, they can use the `super` keyword to use the
method defined in the class which they inherit from.

```ruby
class CookieElf < Elf
  # other methods...

  def greet(name)
    "#{super} Have you tried our limited-time only #BucknuttyBlasters?"
  end
end
```

`super` takes the entire value of the parents method, and uses it in the child.
So when a `CookieElf` greets you...

```ruby
legolas = Elf.new("Legolas", 2931)
ernie = CookieElf.new("Ernie", 47)

puts legolas.greet("Aragorn")
# => "Hello, Aragorn."

puts ernie.greet("Aragorn")
# => "Hello, Aragorn. Have you tried our limited-time only #BucknuttyBlasters?"

```

... you get a more targeted experience.


### Inheriting from Ruby Literals

We can utilize the property of inheritance to create our own custom classes
that improve upon the existing [Ruby language](http://ruby-doc.org/core/doc/syntax/literals_rdoc.html).

Let's build our own custom string class and modify it by adding a new method.

```ruby
class PrettyString < String
  def alternating_caps
    result = ""
    self.each_char.with_index do |c, i|
      if i % 2 == 0
        result += c.downcase
      else
        result += c.upcase
      end
    end
    result
  end
end
```

The `self` keyword refers to the instance of the PrettyString object. This
allows us to use the methods defined on our string class from within the object.
In this case, we are calling the `#each_char` method.

```no-highlight
pry(main)> require_relative "pretty_string"
pry(main)> greeting = PrettyString.new("Why, hello there")
=> "Why, hello there"
pry(main)> greeting.alternating_caps
=> "wHy, HeLlO ThErE"
```

### Adding Useful Functionality

Arguably, the `#alternating_caps` method has the opposite intention of our class
moniker. Let's add some code to inject some color into our text.

```ruby
class PrettyString < String
  # ...

  COLORS = {
    black: 30,
    red: 31,
    green: 32,
    yellow: 33,
    blue: 34,
    magenta: 35,
    cyan: 36,
    white: 37
  }

  def make_pretty(color)
    # http://misc.flogisoft.com/bash/tip_colors_and_formatting
    color_code = COLORS[color]
    "\e[#{color_code}m#{self}\e[0m"
  end
end
```

Now, we have a class that can help us build that
[BBS](http://www.masswerk.at/googleBBS/) we always wanted.

![Using the PrettyString#make_pretty method in pry](https://s3.amazonaws.com/horizon-production/images/pretty-string-03.gif)

One item of interest in our `#make_pretty` method is the the `\e` escape
character. This is similar to the new-line character `\n`. In fact, there is a
whole suite of
[special whitespace characters](http://ruby-doc.org/docs/ruby-doc-bundle/Manual/man-1.4/syntax.html#string)
in Ruby. The combination of the escape character, plus an
[ANSI color value](http://ascii-table.com/ansi-escape-sequences.php), allows us
to change the color of our text when we print it to the terminal.

### Everything (in Ruby) is an Object!

Have you noticed that when you write a new class, you automagically™ have
methods on your objects? That's no mistake, that's inheritance in action!

```ruby
class ThingOne
end
```

```no-highlight
pry(main)> class ThingOne
pry(main)* end
=> nil
pry(main)> thing_one = ThingOne.new
=> #<ThingOne:0x007ff0f2824ea8>
pry(main)> thing_one.is_a?(ThingOne)
=> true
pry(main)> thing_one.is_a?(String)
=> false
pry(main)> thing_one.is_a?(Object)
=> true
pry(main)> thing_one.class.ancestors
=> [ThingOne, Object, PP::ObjectMixin, Kernel, BasicObject]
```

```ruby
class ThingTwo < Object
end
```

```no-highlight
pry(main)> class ThingTwo < Object
pry(main)* end
=> nil
pry(main)> thing_two = ThingTwo.new
=> #<ThingTwo:0x007fca13240998>
pry(main)> thing_two.class.ancestors
=> [ThingTwo, Object, PP::ObjectMixin, Kernel, BasicObject]
```

`thing_one.class` gives us the class definition of the object we are dealing
with. Tacking on the `#ancestors` method allows us to see what classes and
modules are being utilized. Notice how the output of
`thing_one.class.ancestors` and `thing_two.class.ancestors` are identical? That
is because the following two class definitions are identical:

```ruby
class ThingOne
end
```

```ruby
class ThingTwo < Object
end
```

Ruby classes automatically inherit from the
[`Object`](http://ruby-doc.org/core/Object.html)
class. That's where all these wonderful methods are coming from when we define
a new class.

Thanks, Ruby!


### When to Inherit

Inheritance is a powerful tool for sharing data and methods among our classes,
but it also creates a **dependency** between our code - we've connected two
pieces of code together (`Elf` and `CookieElf`, for example) in such a way that
one completely relies on the other. Any change we make to `Elf` will
significantly alter the behavior of `CookieElf`, in a way that is not
immediately obvious if you were only looking at the `CookieElf` class.  
Dependencies are inevitable, but we can make sure the dependencies we have are there for good reasons.

A good parent class is a class with an API (i.e., its methods and interfaces)
that is well documented, and doesn't change unexpectedly. External libraries
(often packaged as gems) often give us classes meant to act as parents, and
many (such as `ActiveRecord`, a popular gem for interacting with databases)
require you to create classes that inherit from them.

When sharing logic amongst your code, consider first reaching for code
composition - breaking up logic and workflow into small, testable objects who
work together. When they continue to be shared in the same way across multiple
classes, then consider if inheritance is the right solution.  
