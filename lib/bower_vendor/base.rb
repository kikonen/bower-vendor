module BowerVendor
  class Base
    def initialize
    end

    def vendors
      @vendors ||= load_vendors
      validate_vendors
      @vendors
    end

    def validate_vendors
      # validate resources
      @vendors.each do |vendor_key, vendor|
        raise "VERSION MISSING: #{vendor_key}: #{vendor.inspect}" unless vendor['version']
        puts "WARN: ASSETS MISSING: #{vendor_key}: #{vendor.inspect}" unless vendor['assets']
      end
    end

    def config
      @config ||= load_config('config/bower_vendor.yml')
      @config ||= load_config(File.join(BowerVendor.root_dir, 'config/bower_vendor.yml'))
    end

    def load_config(file)
      if File.exist?(file)
        YAML.load_file(file)
      else
        nil
      end
    end

    def full_asset_key_src_dir(asset_key)
      "#{self.work_dir}/bower_components/#{asset_key}"
    end

    def work_dir
      if defined?(Rails)
        "#{Rails.root}/tmp"
      else
        'tmp'
      end
    end

    def local_node_bin
      "#{Rails.root}/node_modules/.bin"
    end

    def load_vendors
      vendors = YAML.load_file('vendor.yml')
      vendors.sort do |a, b|
        a[0] <=> b[0]
      end.to_h
    end
  end
end
