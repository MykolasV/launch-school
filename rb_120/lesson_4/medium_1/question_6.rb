class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    template
  end
end

# -----

class Computer
  attr_accessor :template

  def create_template
    self.template = "template 14231"
  end

  def show_template
    self.template
  end
end

# Both examples produce the same result, but a little bit differently.

# In the first example, within the 'create_template' method, instance variable
# @template is used directly for assignment; in the second example, it is done
# through the setter method.

# For 'show_template', both examples are using the getter method, 'self.' prefix
# in the second example is optional.
