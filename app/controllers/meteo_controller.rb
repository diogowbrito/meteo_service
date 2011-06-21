#Encoding: UTF-8

class MeteoController < ApplicationController

  def metainfo
    @address = get_address
    respond_to :xml

  end

  def status

    respond_to :xml

  end

  def meteo
  conditions = ["Tornado", "Tempestade tropical", "Furacão", "Grande trovoada", "Trovoada", "Chuva e neve", "Chuva e granizo", "Neve e granizo", "Chuvinha gelada", "Chuvinha", "Chuva gelada", "Águaceiros", "Águaceiros", "Nevão", "Águaceiros de neve", "Nevão", "Neve", "Bolas de granizo", "Granizo", "Poeira", "Nevoeiro", "Neblina de areia", "Fumo", "Blustery", "Vento", "Frio", "Enevoado", "Muito enevoado", "Muito enevoado", "Um pouco enevoado", "Um pouco enevoado", "Limpo", "Limpo", "Bom", "Bom", "Chuva e bolas de granizo", "Quente", "Trovoadas isoladas", "Trovoadas separadas", "Algumas trovoadas", "Alguns águaceiros", "Nevão", "Alguns águaceiros de neve", "Nevão", "Um pouco enevoado", "Águaceiros e trovoadas", "Águaceiros de neve", "Águaceiros e trovoadas isoladas"]
  conditions[3200] = "Não disponível"
  @doc = Nokogiri::XML(open("http://weather.yahooapis.com/forecastrss?w=29381860&u=c"), nil, 'UTF-8')
  @doc.remove_namespaces!()

  wind = @doc.at_css "wind"
  weather = @doc.at_css "condition"
  code = weather['code'].to_i
  @forecast = conditions[code]
  @temp = weather['temp']
  @winds = wind['speed']+" km/h"

  @doc2 = Nokogiri::HTML(open("http://www.meteopraias.com/meteopraiascom/mobile/praias_detail.asp?ID=11"), nil, 'UTF-8')
  firstp = @doc2.at_css("p")
  secondp = firstp.next_element()
  datastring = secondp.inner_html()
  dataarray = datastring.split('<br>')

  @forecastb = dataarray[3].strip
  windstemp = dataarray[4]
  ocuptemp = dataarray[6]
  @ocup = ocuptemp.gsub('Ocupação: ', '').strip
  temp1 = dataarray[5]
  temparray = temp1.split(' ')
  @temp2 = temparray[1].strip
  @ond = temparray[4].strip
  @windsb = windstemp.gsub('Vento: ', '').strip

  respond_to :xml

  end

end
