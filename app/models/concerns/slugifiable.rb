module Slugifiable
  module InstanceMethods
    def slug
      slug_name = self.name.downcase.gsub(/[^a-z|\s]/, "")
      slug_name.gsub(" ","-")
    end
  end

  module ClassMethods

    def find_by_slug(slug)
      self.all.find do |model|
        model.slug == slug
      end
    end
  end
end