module HelpfulUtils
  module CoreExt
    module String

      module JSON
        # Если вызывать у строки с русским текстом стандартный метод to_json, а потом попробовать отобразить ее
        # то получится что то невразумительное.Данный метод исправляет проблему. Пример
        # "тут русский текст".to_json(:russian=>true)
        # по умолчанию russian == false
        def to_json_with_russian_support(options = nil) #:nodoc:
          result = nil
          unless  options.blank?
            if options[:russian]== true
              json = '"' + gsub(ActiveSupport::JSON::Encoding.escape_regex) { |s|
                ActiveSupport::JSON::Encoding::ESCAPED_CHARS[s]
              }
              json.force_encoding('ascii-8bit') if respond_to?(:force_encoding)
              result = json + '"'
            end
          end
          if result.blank?
            result = to_json_without_russian_support options
          end
          result
        end

        alias_method_chain :to_json, :russian_support


        # Проверка,является ли строка JSON'ом
        def json?
          return true if !self.blank? && ActiveSupport::JSON.decode(self).is_a?(Hash)
        rescue ActiveSupport::JSON::ParseError
          false
        end
      end
      module UrlHelpers
        # can raise URI::InvalidURIError
        # приводит строку к полноценному URL
        def to_url(prefix="http://")
          return nil if self.blank?
          if  URI.parse(self).class != URI::HTTP
            "#{prefix}#{self.strip}"
          else
            self.dup
          end
        end
      end
    end
  end
end


class String
  include HelpfulUtils::CoreExt::String::JSON
  include HelpfulUtils::CoreExt::String::UrlHelpers
end
