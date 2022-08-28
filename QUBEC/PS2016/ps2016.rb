class FindAuthorization

    def initialize(partner)
      # data["city"]
      @@country  = get_csv(partner,true) if !partner.empty?
      binding.break
    end

    def processing_logic()

    end

  private
  # Input file read and prepare struct format
  def get_csv(filename, header)
      require 'csv'
      country = {}
      provinces = {}

      CSV.foreach(File.open(filename), headers: header, :converters => :numeric, :header_converters => :symbol){ |row|
        city_name=[]
        states=[]
        if !provinces.include?(row[:province_name])
            city_name.append(row[:city_name])
            provinces.store(row[:province_name], city_name)
        else
          city_name = provinces[row[:province_name]]
          city_name.append(row[:city_name])
          provinces[row[:province_name]] = city_name
        end

        province = provinces.select{ |p| p == row[:province_name]}
        if !country.include?(row[:country_name])
          states.append(province)
          country.store(row[:country_name],states)
        else
          states = country[row[:country_name]]
          # states[:row[:"province_name"]] = province
          states.append(province)
          country[row[:country_name]]  = states.uniq
        end
      }
      country
  end
end

require 'debug'

# "start of processing"
ab = FindAuthorization.new("PS2016.txt")
# "pS1" - minimum cost
ab.processing_logic()





