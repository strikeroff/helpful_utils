class Configuration
  # Загрузка конфигурационных файлов в окружение Configuration из папки RAILS_ROOT/config/project(по умолчанию).  
  # Для каждого найденного yaml файла в папке project мы производим загрузку в окружение.
  # Все это делается в целях удобства обращения к конфигурации.
  # Доступ к конфигам из проекта -  Configuration.НАЗВАНИЕ_ФАЙЛА.КЛЮЧ

  cattr_accessor :path_to_config_dir
  @@path_to_config_dir =  "#{::RAILS_ROOT}/config/project"

  def self.load_configurations
    if defined? ::RAILS_ROOT
      Dir["#{path_to_config_dir}/*.yaml"].each do |config_file|
        load_configuration_from_file(config_file)
      end
    end

  end

  def self.has?(config_name)
    self.method_defined? config_name
  end


  def self.load_configuration_from_file ( config_file )
    config = YAML.load_file( config_file )    
    if config.instance_of? Hash
      attrs = []
      config.each_key { |key| attrs << key.to_sym } # извлекаем имена полей
      config_struct = Struct.new *attrs             # создаем структуру с этими полями
      new_config = config_struct.new                # создаем объект этой структуры
      config_struct.members.each do |attr_name|     # инициализируем значения полей объекта
        new_config.send( "#{attr_name}=", config[attr_name] )
      end
      config = new_config                           # отображаем трансформацию в конфиг
    end
    attr_name = File.basename( config_file, ".yaml" )

    self.class_eval do
      cattr_accessor attr_name.to_sym               # создаем в модуле аттрибут
    end

    self.send("#{attr_name}=", config)
  end


end


Configuration.load_configurations

