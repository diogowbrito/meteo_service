xml.record(:title => "Serviço de Informação Metereologica") do
  xml.text("Este serviço fornece a informação metereologica relativa ao Monte da Caparica e à praia da Costa da Caparica")
  xml.text(:title => "Monte da Caparica") do
    xml.text(@forecast, :title => "Condição")
    xml.text(@temp+' ºC', :title => "Temperatura")
    xml.text(@winds, :title => "Velocidade do Vento")
  end
  xml.text(:title => 'Praia da Costa da Caparica') do
    xml.text(@forecastb, :title => "Condição")
    xml.text(@windsb, :title => "Vento")
    xml.text(@temp+' ºC', :title => "Temperatura")
    xml.text(@ond+'M', :title => "Ondulação")
  end
end