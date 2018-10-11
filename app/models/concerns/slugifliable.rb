module Slugifiable

def slug
  self.downcase.strip.gsub(' ', '-')

end

string = "hksdhfkajdh djkahdsflkjd ajdshfkl"
puts string.slug

end
