namespace java com.fitbit.core.thrift.thriftjava

/*
  This type is used for object ids.
 */
typedef string Id

/*
  Long value representation of timestamp.
  The milliseconds of the datetime instant from the Java epoch of 1970-01-01T00:00:00Z
 */
typedef i64 DateTime


/*
  This type is used to represent timezone
  Reference: com.fitbit.util.timezone.FitbitTimeZone
 */
enum TimeZone {
    HAWAII = 1,
    ALASKA = 2,
    PACIFIC_TIME_US_CANADA = 3,
    ARIZONA = 4,
    MOUNTAIN_TIME_US_CANADA = 5,
    CENTRAL_TIME_US_CANADA = 6,
    EASTERN_TIME_US_CANADA = 7,
    INDIANA = 8,
    MIDWAY_ISLAND = 9,
    SAMOA = 10,
    TIJUANA = 11,
    VANCOUVER = 12,
    CHIHUAHUA = 13,
    MAZATLAN = 14,
    CANCUN = 15,
    CENTRAL_AMERICA = 16,
    MEXICO_CITY = 17,
    MONTERREY = 18,
    SASKATCHEWAN = 19,
    WINNIPEG = 20,
    BOGOTA = 21,
    HAVANA = 22,
    KINGSTON = 23,
    LIMA = 24,
    MONTREAL = 25,
    PANAMA = 26,
    QUITO = 27,
    TORONTO = 28,
    CARACAS = 29,
    ASUNCION = 30,
    ATLANTIC_TIME_CANADA = 31,
    BERMUDA = 32,
    CAMPO_GRANDE = 33,
    LA_PAZ = 34,
    MANAUS = 35,
    SAN_JUAN = 36,
    SANTO_DOMINGO = 37,
    SANTIAGO = 38,
    NEWFOUNDLAND = 39,
    BUENOS_AIRES = 40,
    CORDOBA = 41,
    FORTALEZA = 42,
    GEORGETOWN = 43,
    GREENLAND = 44,
    MENDOZA = 45,
    MONTEVIDEO = 46,
    RIO_DE_JANEIRO = 47,
    MID_ATLANTIC = 48,
    AZORES = 49,
    CAPE_VERDE_IS = 50,
    CASABLANCA = 51,
    DAKAR = 52,
    DUBLIN = 53,
    LISBON = 54,
    LONDON = 55,
    REYKJAVIK = 56,
    UTC = 0,
    AMSTERDAM = 57,
    BELGRADE = 58,
    BERLIN = 59,
    BRATISLAVA = 60,
    BRUSSELS = 61,
    BUDAPEST = 62,
    COPENHAGEN = 63,
    LJUBLJANA = 64,
    MADRID = 65,
    OSLO = 66,
    PARIS = 67,
    PRAGUE = 68,
    ROME = 69,
    SARAJEVO = 70,
    SKOPJE = 71,
    STOCKHOLM = 72,
    TIRANE = 73,
    VIENNA = 74,
    WARSAW = 75,
    WEST_CENTRAL_AFRICA = 76,
    WINDHOEK = 77,
    ZURICH = 78,
    ZAGREB = 79,
    ATHENS = 80,
    BEIRUT = 81,
    BUCHAREST = 82,
    CAIRO = 83,
    HARARE = 84,
    HELSINKI = 85,
    ISTANBUL = 86,
    JERUSALEM = 87,
    KYIV = 88,
    JOHANNESBURG = 89,
    RIGA = 90,
    SOFIA = 91,
    TALLINN = 92,
    TRIPOLI = 93,
    VILNIUS = 94,
    ADDIS_ABABA = 95,
    ANTANANARIVO = 96,
    BAGHDAD = 97,
    KALININGRAD = 98,
    KUWAIT = 99,
    MINSK = 100,
    NAIROBI = 101,
    RIYADH = 102,
    TEHRAN = 103,
    BAKU = 104,
    DUBAI = 105,
    MOSCOW = 106,
    MUSCAT = 107,
    PORT_LOUIS = 108,
    TBILISI = 109,
    YEREVAN = 110,
    KABUL = 111,
    ASHGABAT = 112,
    DUSHANBE = 113,
    KARACHI = 114,
    TASHKENT = 115,
    COLOMBO = 116,
    KOLKATA = 117,
    KATHMANDU = 118,
    ALMATY = 119,
    BISHKEK = 120,
    DHAKA = 121,
    EKATERINBURG = 122,
    RANGOON = 123,
    BANGKOK = 124,
    HANOI = 125,
    JAKARTA = 126,
    NOVOSIBIRSK = 127,
    CHONGQING = 128,
    HONG_KONG = 129,
    KRASNOYARSK = 130,
    KUALA_LUMPUR = 131,
    MACAU = 132,
    PERTH = 133,
    SHANGHAI = 134,
    SINGAPORE = 135,
    TAIPEI = 136,
    ULAAN_BATAAR = 137,
    URUMQI = 138,
    EUCLA = 139,
    DILI = 140,
    IRKUTSK = 141,
    MELEKEOK = 142,
    PYONGYANG = 143,
    SEOUL = 144,
    TOKYO = 145,
    ADELAIDE = 146,
    DARWIN = 147,
    BRISBANE = 148,
    GUAM = 149,
    HOBART = 150,
    MELBOURNE = 151,
    PORT_MORESBY = 152,
    SYDNEY = 153,
    YAKUTSK = 154,
    NEW_CALEDONIA = 155,
    POHNPEI = 156,
    SOLOMON_IS = 157,
    VLADIVOSTOK = 158,
    AUCKLAND = 159,
    FIJI = 160,
    KAMCHATKA = 161,
    MARSHALL_IS = 162,
    NUKU_ALOFA = 163,
    APIA = 164,
    DETROIT = 165,
    BAHIA_BANDERAS = 166,
    BOISE = 167,
    DAWSON = 168,
    ATIKOKAN = 169,
    MANILA = 170,
    COSTA_RICA = 171,
    SAMARA = 172,
    LUXEMBOURG = 173,
    EDMONTON = 174
}

/*
 * Represents a Date and Time, with the additional option to preserve Time Zone information. Contains :
 * 1. A Timestamp when an event occurred, as milliseconds since the UTC epoch.
 * 2. The Time Zone where the event occurred.
 *
 * Reference: org.joda.time.DateTime
 */
struct DateTimeWithTimeZone {
  1: optional DateTime timestamp
  2: optional TimeZone timeZone = TimeZone.UTC
}

/*
  represents an inclusive DateTime range
 */
struct DateTimeRange {
  1: optional DateTime startTime
  2: optional DateTime endTime
}

struct DateTimeWithTimeZoneRange {
  1: optional DateTimeWithTimeZone startTime
  2: optional DateTimeWithTimeZone endTime
}

enum TimeUnit {
    MILLIS = 1,
    SECONDS = 2,
    HOURS = 3,
    DAYS = 4,
    MONTHS = 5,
    YEARS = 6,
    MINUTES = 7,
    WEEKS = 8
}

/*
  Duration struct describes time to live
*/
struct Duration {
    1: required TimeUnit timeUnit
    2: required i64 time
}

enum MeasurementUnit {
    // Metric distances
    MILLIMETER = 100
    CENTIMETER = 101
    METER = 102
    KILOMETER = 103
    // Imperial distances
    INCH = 110
    FOOT = 111
    YARD = 112
    MILE = 113
    // Human distances
    STEP = 120
    FLOOR = 121

    // Metric weights
    GRAM = 200
    KILOGRAM = 201
    // Imperial weights
    POUND = 210
    STONE = 211
}