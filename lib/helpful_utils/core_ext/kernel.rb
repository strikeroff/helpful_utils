module  Kernel # :nodoc:
  # Переключение области видимости на объект.
  # Использовать осторожно. Рекоммендуется применять, когда в коде идет несколько операций
  # над одним объектом. Таким образом следующий код:
  #
  #    Gionet.contexts.set_context(:region, :volga)
  #    Gionet.contexts.set_context(:site, "gionet.ru")
  #    Gionet.contexts.set_context(:special, special_object)
  #    p Gionet.contexts.slice
  #    Gionet.contexts.run
  #
  # можно преобразовать в следующий:
  #
  #    with Gionet.contexts do
  #      set_context(:region, :volga)
  #      set_context(:site, "gionet.ru")
  #      set_context(:special, special_object)
  #      p slice
  #      run
  #    end
  #
  # Внимание при использовании необходимо по причине того, что внутри блока происходит
  # смешивание областей видимости самого объекта и окружения из которого он вызывается.
  def with(object, &block)
    object.instance_eval &block
  end
end
