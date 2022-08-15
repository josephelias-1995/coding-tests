module Blending
  def self.included(base)
    base.after_save :make_juice, if: :apple_class?
  end

  def apple_class?
    self.class.name == "Apple" ? true : false
  end

  def make_juice
    puts "This function will trigger only for 'Apple' class."
  end
end
