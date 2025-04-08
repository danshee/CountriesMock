import Foundation

enum NetworkError: Error {
    case badUrl(String)
    case badResponse(URLResponse)
}

class Network {
    func fetchCountries() async throws -> [Country] {
        guard let data = json.data(using: .utf8) else {
            return [Country]()
        }

        let countries = try JSONDecoder().decode([Country].self, from: data)
        
        return countries
    }
}

fileprivate let json = """
[
  {
    "capital": "Kabul",
    "code": "AF",
    "name": "Afghanistan",
    "region": "AS"
  },
  {
    "capital": "Mariehamn",
    "code": "AX",
    "name": "Åland Islands",
    "region": "EU"
  },
  {
    "capital": "Tirana",
    "code": "AL",
    "name": "Albania",
    "region": "EU"
  },
  {
    "capital": "Algiers",
    "code": "DZ",
    "name": "Algeria",
    "region": "AF"
  },
  {
    "capital": "Pago Pago",
    "code": "AS",
    "name": "American Samoa",
    "region": "OC"
  },
  {
    "capital": "Andorra la Vella",
    "code": "AD",
    "name": "Andorra",
    "region": "EU"
  },
  {
    "capital": "Luanda",
    "code": "AO",
    "name": "Angola",
    "region": "AF"
  },
  {
    "capital": "The Valley",
    "code": "AI",
    "name": "Anguilla",
    "region": "NA"
  },
  {
    "capital": "Saint John's",
    "code": "AG",
    "name": "Antigua and Barbuda",
    "region": "NA"
  },
  {
    "capital": "Buenos Aires",
    "code": "AR",
    "name": "Argentina",
    "region": "SA"
  },
  {
    "capital": "Yerevan",
    "code": "AM",
    "name": "Armenia",
    "region": "AS"
  },
  {
    "capital": "Oranjestad",
    "code": "AW",
    "name": "Aruba",
    "region": "SA"
  },
  {
    "capital": "Canberra",
    "code": "AU",
    "name": "Australia",
    "region": "OC"
  },
  {
    "capital": "Vienna",
    "code": "AT",
    "name": "Austria",
    "region": "EU"
  },
  {
    "capital": "Baku",
    "code": "AZ",
    "name": "Azerbaijan",
    "region": "AS"
  },
  {
    "capital": "Nassau",
    "code": "BS",
    "name": "Bahamas",
    "region": "NA"
  },
  {
    "capital": "Manama",
    "code": "BH",
    "name": "Bahrain",
    "region": "AS"
  },
  {
    "capital": "Dhaka",
    "code": "BD",
    "name": "Bangladesh",
    "region": "AS"
  },
  {
    "capital": "Bridgetown",
    "code": "BB",
    "name": "Barbados",
    "region": "NA"
  },
  {
    "capital": "Minsk",
    "code": "BY",
    "name": "Belarus",
    "region": "EU"
  },
  {
    "capital": "Brussels",
    "code": "BE",
    "name": "Belgium",
    "region": "EU"
  },
  {
    "capital": "Belmopan",
    "code": "BZ",
    "name": "Belize",
    "region": "NA"
  },
  {
    "capital": "Porto-Novo",
    "code": "BJ",
    "name": "Benin",
    "region": "AF"
  },
  {
    "capital": "Hamilton",
    "code": "BM",
    "name": "Bermuda",
    "region": "NA"
  },
  {
    "capital": "Thimphu",
    "code": "BT",
    "name": "Bhutan",
    "region": "AS"
  },
  {
    "capital": "Sucre",
    "code": "BO",
    "name": "Bolivia (Plurinational State of)",
    "region": "SA"
  },
  {
    "capital": "Kralendijk",
    "code": "BQ",
    "name": "Bonaire, Sint Eustatius and Saba",
    "region": "SA"
  },
  {
    "capital": "Sarajevo",
    "code": "BA",
    "name": "Bosnia and Herzegovina",
    "region": "EU"
  },
  {
    "capital": "Gaborone",
    "code": "BW",
    "name": "Botswana",
    "region": "AF"
  },
  {
    "capital": "",
    "code": "BV",
    "name": "Bouvet Island",
    "region": "AN"
  },
  {
    "capital": "Brasília",
    "code": "BR",
    "name": "Brazil",
    "region": "SA"
  },
  {
    "capital": "Diego Garcia",
    "code": "IO",
    "name": "British Indian Ocean Territory",
    "region": "AF"
  },
  {
    "capital": "",
    "code": "UM",
    "name": "United States Minor Outlying Islands",
    "region": "NA"
  },
  {
    "capital": "Road Town",
    "code": "VG",
    "name": "Virgin Islands (British)",
    "region": "NA"
  },
  {
    "capital": "Charlotte Amalie",
    "code": "VI",
    "name": "Virgin Islands (U.S.)",
    "region": "NA"
  },
]
"""
