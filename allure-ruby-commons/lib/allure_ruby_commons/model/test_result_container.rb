# frozen_string_literal: true

module Allure
  # Allure model step result container
  class TestResultContainer < JSONable
    def initialize(uuid: nil, name: "Unnamed")
      super()

      if uuid.nil?
        begin
          uuid = UUID.generate 
        rescue NoMethodError => e # during parallel_split_test it fails due to how random number is generated
          uuid = SecureRandom.uuid
        end
      end
      
      @uuid = uuid
      @name = name
      @children = []
      @befores = []
      @afters = []
      @links = []
    end

    attr_accessor :uuid, :name, :description, :description_html, :start, :stop, :children, :befores, :afters, :links
  end
end
