# frozen_string_literal: true

module Crowdin
  module Utils
    # Method for extract module namespaces from a string
    def fetch_module_full_name_from_string(string)
      string.split('::').inject(Module) { |acc, val| acc.const_get(val) }
    end
  end
end
