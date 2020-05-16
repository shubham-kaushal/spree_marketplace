module SpreeMarketplace
  class Engine < Rails::Engine

    def self.backendx_available?
      @@backendx_available ||= ::Rails::Engine.subclasses.map(&:instance).map { |e| e.class.to_s }.include?('SpreeBackendx::Engine')
    end
  end
end