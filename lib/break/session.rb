# frozen_string_literal: true

module Break
  class Session
    attr_reader :contexts
    attr_reader :frontend

    def initialize(binding, frontend:)
      @contexts = [Context.new(binding)]
      @frontend = frontend
    end

    def enter
      frontend.attach(self)
    end

    def leave
      frontend.detach
    end

    def context
      contexts.last
    end

    def context!(*bindings, depth: 0)
      contexts << Context.new(*bindings, depth: depth)
      enter
    end
  end
end
