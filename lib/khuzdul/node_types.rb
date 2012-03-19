module DfRaw
  module RawObjectType
    def to_s
      text_value
    end
  end

  module RawObject
    def printable?; true; end
    
    def inspect
      obj_subtype.to_s+":"+name.text_value
    end
  end

end
