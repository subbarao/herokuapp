require 'open-uri'
class Mp < Seat
  def self.results(url)
    page = Nokogiri::HTML(open(url))
    state, name = page.css("table[style][border] tr:first td").text.split("-").map(&:strip).map(&:titleize)

    state = State.find_or_create_by(name: state)
    current_seat = create(name: name, state: state)

    page.css("table[style][border] tr:first td").text.split("-").last

    page.css("table[style][border] tr[style='font-size:12px;']").each_with_index  do | seat, index |
      candidate, party, votes = seat.css("td").map(&:text).map(&:titleize)
      party = Party.find_or_create_by(name: party)
      putc "."
      current_seat.nominations.create(candidate: candidate, party: party, votes: votes.to_i, position: index + 1 )
    end
  end
  def self.scrape_all
    url = "http://eciresults.nic.in/ConstituencywiseU011.htm"
    page = Nokogiri::HTML(open(url))
    statePage = page.css("#ddlState").first
    statePage.css("option").each_with_index do | state, outer |
      next if outer  == 0
      state_link = state.attributes['value'].value
      id= findUrl(state_link)
      strValues = page.css("##{id}").first.attributes["value"].text
      strac = strValues.split(';');
      baseURL = "http://eciresults.nic.in/Constituencywise"+ state_link + strac[0].split(',')[0] + '.htm'
      strac.each do | seatVal |
        seatUrl = "#{baseURL}?ac=#{seatVal.split(',')[0].strip}"
        results(seatUrl)
      end
    end
  end

  def self.findUrl(state)
    states = %w(HdnFldAndhraPradesh
                HdnFldArunachalPradesh
                HdnFldAssam
                HdnFldBihar
                HdnFldGoa
                HdnFldGujarat
                HdnFldHaryana
                                HdnFldHimachalPradesh
                                HdnFldJammuKashmir
                                HdnFldKarnataka
                                HdnFldKerala
                                HdnFldMadhyaPradesh
                                HdnFldMaharashtra
                                HdnFldManipur
                                HdnFldMeghalaya
                                HdnFldMizoram
                                HdnFldNagaland
                                HdnFldOdisha
                                HdnFldPunjab
                                HdnFldRajasthan
                                HdnFldSikkim
                                HdnFldTamilNadu
                                HdnFldTripura
                                HdnFldUttarPradesh
                                HdnFldWestBengal
                                HdnFldChhatisgharh
                                HdnFldJharkhand
                                HdnFldUttarakhand
    )

    unions = %w(
                                HdnFldAndamanNicobar
                                HdnFldChandigarh
                                HdnFldDadarNagarHaveli
                                HdnFldDamanDiu
                                HdnFldDelhi
                                HdnFldLakshadweep
                                HdnFldPuducherry
    )
    if state =~ /S\d+/
      states[state.scan(/\d/).join.to_i - 1]
    else
      unions[state.scan(/\d/).join.to_i - 1]
    end

  end
end
