module DfRaw
  module RawObjectType
    def to_s
      text_value
    end
  end

  module RawObject
    def printable?; true; end

    def type_name
      name_token.text_value
    end

    def attributes
      attr_entity_list.elements.map(&:attr)
    end
  end

  module AttrEntity
    def to_s
      attr.to_s
    end
  end

  module AttrPair
    def to_s
      "#{key}:#{value}"
    end

    def key
      name_token.text_value
    end

    def value
      value_token.text_value
    end
  end
end
