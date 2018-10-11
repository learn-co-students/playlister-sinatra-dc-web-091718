module Slugifiable

  module InstanceMethod
  def slug
    # binding.pry if self.name == nil
    self.name.downcase.strip.gsub(' ', '-')
  end
end

  module ClassMethod
    def find_by_slug(slug)
      self.all.find{|el| el.slug==slug}
    end
  end

end
