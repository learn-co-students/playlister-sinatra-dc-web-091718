module Slugifiable
  def slug
    self.name.downcase.strip.gsub(' ', '-')
  end
end
module Slugifiable_class
  def find_by_slug(slug)
    self.all.find{|el| el.slug==slug}
  end
end
