module Minimart
  module InventoryRequirement
    class LocalPathRequirement < BaseRequirement

      attr_reader :path

      def initialize(name, opts)
        super
        @path = opts[:path]
      end

      def location_specification?
        true
      end

      def requirements
        cookbook_info.dependencies
      end

      private

      def download_cookbook
        Configuration.output.puts "-- Fetching '#{name}' from path '#{path}'"
        Ridley::Chef::Cookbook.from_path(path)
      end

    end
  end
end
