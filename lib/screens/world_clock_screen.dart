import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;
import 'dart:async';

const worldTimeZones = [
  // Asia
  {'country': 'Vietnam', 'timezone': 'Asia/Ho_Chi_Minh', 'continent': 'Asia'},
  {'country': 'Japan', 'timezone': 'Asia/Tokyo', 'continent': 'Asia'},
  {'country': 'China', 'timezone': 'Asia/Shanghai', 'continent': 'Asia'},
  {'country': 'India', 'timezone': 'Asia/Kolkata', 'continent': 'Asia'},
  {'country': 'South Korea', 'timezone': 'Asia/Seoul', 'continent': 'Asia'},
  {'country': 'Thailand', 'timezone': 'Asia/Bangkok', 'continent': 'Asia'},
  {'country': 'Indonesia', 'timezone': 'Asia/Jakarta', 'continent': 'Asia'},
  {'country': 'Malaysia', 'timezone': 'Asia/Kuala_Lumpur', 'continent': 'Asia'},
  {'country': 'Philippines', 'timezone': 'Asia/Manila', 'continent': 'Asia'},
  {'country': 'Singapore', 'timezone': 'Asia/Singapore', 'continent': 'Asia'},
  {'country': 'Bangladesh', 'timezone': 'Asia/Dhaka', 'continent': 'Asia'},
  {'country': 'Pakistan', 'timezone': 'Asia/Karachi', 'continent': 'Asia'},
  {'country': 'Afghanistan', 'timezone': 'Asia/Kabul', 'continent': 'Asia'},
  {'country': 'Iran', 'timezone': 'Asia/Tehran', 'continent': 'Asia'},
  {'country': 'Iraq', 'timezone': 'Asia/Baghdad', 'continent': 'Asia'},
  {'country': 'Saudi Arabia', 'timezone': 'Asia/Riyadh', 'continent': 'Asia'},
  {
    'country': 'United Arab Emirates',
    'timezone': 'Asia/Dubai',
    'continent': 'Asia'
  },
  {'country': 'Israel', 'timezone': 'Asia/Jerusalem', 'continent': 'Asia'},
  {'country': 'Turkey', 'timezone': 'Europe/Istanbul', 'continent': 'Asia'},
  {'country': 'Georgia', 'timezone': 'Asia/Tbilisi', 'continent': 'Asia'},
  {'country': 'Armenia', 'timezone': 'Asia/Yerevan', 'continent': 'Asia'},
  {'country': 'Nepal', 'timezone': 'Asia/Kathmandu', 'continent': 'Asia'},
  {'country': 'Kazakhstan', 'timezone': 'Asia/Almaty', 'continent': 'Asia'},
  {'country': 'Uzbekistan', 'timezone': 'Asia/Tashkent', 'continent': 'Asia'},
  {'country': 'Kyrgyzstan', 'timezone': 'Asia/Bishkek', 'continent': 'Asia'},
  {'country': 'Sri Lanka', 'timezone': 'Asia/Colombo', 'continent': 'Asia'},
  {'country': 'Maldives', 'timezone': 'Indian/Maldives', 'continent': 'Asia'},
  {'country': 'Myanmar', 'timezone': 'Asia/Yangon', 'continent': 'Asia'},
  {'country': 'Mongolia', 'timezone': 'Asia/Ulaanbaatar', 'continent': 'Asia'},

  // Europe
  {'country': 'UK', 'timezone': 'Europe/London', 'continent': 'Europe'},
  {'country': 'France', 'timezone': 'Europe/Paris', 'continent': 'Europe'},
  {'country': 'Germany', 'timezone': 'Europe/Berlin', 'continent': 'Europe'},
  {'country': 'Italy', 'timezone': 'Europe/Rome', 'continent': 'Europe'},
  {'country': 'Spain', 'timezone': 'Europe/Madrid', 'continent': 'Europe'},
  {
    'country': 'Netherlands',
    'timezone': 'Europe/Amsterdam',
    'continent': 'Europe'
  },
  {'country': 'Belgium', 'timezone': 'Europe/Brussels', 'continent': 'Europe'},
  {'country': 'Portugal', 'timezone': 'Europe/Lisbon', 'continent': 'Europe'},
  {
    'country': 'Switzerland',
    'timezone': 'Europe/Zurich',
    'continent': 'Europe'
  },
  {'country': 'Austria', 'timezone': 'Europe/Vienna', 'continent': 'Europe'},
  {'country': 'Sweden', 'timezone': 'Europe/Stockholm', 'continent': 'Europe'},
  {'country': 'Norway', 'timezone': 'Europe/Oslo', 'continent': 'Europe'},
  {
    'country': 'Denmark',
    'timezone': 'Europe/Copenhagen',
    'continent': 'Europe'
  },
  {'country': 'Finland', 'timezone': 'Europe/Helsinki', 'continent': 'Europe'},
  {'country': 'Ireland', 'timezone': 'Europe/Dublin', 'continent': 'Europe'},
  {'country': 'Poland', 'timezone': 'Europe/Warsaw', 'continent': 'Europe'},
  {
    'country': 'Czech Republic',
    'timezone': 'Europe/Prague',
    'continent': 'Europe'
  },
  {'country': 'Hungary', 'timezone': 'Europe/Budapest', 'continent': 'Europe'},
  {'country': 'Greece', 'timezone': 'Europe/Athens', 'continent': 'Europe'},
  {'country': 'Turkey', 'timezone': 'Europe/Istanbul', 'continent': 'Europe'},
  {'country': 'Romania', 'timezone': 'Europe/Bucharest', 'continent': 'Europe'},
  {'country': 'Bulgaria', 'timezone': 'Europe/Sofia', 'continent': 'Europe'},
  {
    'country': 'Russia (Moscow)',
    'timezone': 'Europe/Moscow',
    'continent': 'Europe'
  },
  {'country': 'Ukraine', 'timezone': 'Europe/Kiev', 'continent': 'Europe'},
  {'country': 'Serbia', 'timezone': 'Europe/Belgrade', 'continent': 'Europe'},
  {'country': 'Croatia', 'timezone': 'Europe/Zagreb', 'continent': 'Europe'},
  {
    'country': 'Slovenia',
    'timezone': 'Europe/Ljubljana',
    'continent': 'Europe'
  },
  {
    'country': 'Iceland',
    'timezone': 'Atlantic/Reykjavik',
    'continent': 'Europe'
  },
  {
    'country': 'Luxembourg',
    'timezone': 'Europe/Luxembourg',
    'continent': 'Europe'
  },

  // North America
  {
    'country': 'USA (New York)',
    'timezone': 'America/New_York',
    'continent': 'North America'
  },
  {
    'country': 'Canada (Toronto)',
    'timezone': 'America/Toronto',
    'continent': 'North America'
  },
  {
    'country': 'Mexico',
    'timezone': 'America/Mexico_City',
    'continent': 'North America'
  },
  {
    'country': 'Cuba',
    'timezone': 'America/Havana',
    'continent': 'North America'
  },
  {
    'country': 'Jamaica',
    'timezone': 'America/Jamaica',
    'continent': 'North America'
  },
  {
    'country': 'Bahamas',
    'timezone': 'America/Nassau',
    'continent': 'North America'
  },
  {
    'country': 'Panama',
    'timezone': 'America/Panama',
    'continent': 'North America'
  },
  {
    'country': 'Guatemala',
    'timezone': 'America/Guatemala',
    'continent': 'North America'
  },
  {
    'country': 'Costa Rica',
    'timezone': 'America/Costa_Rica',
    'continent': 'North America'
  },
  {
    'country': 'Honduras',
    'timezone': 'America/Tegucigalpa',
    'continent': 'North America'
  },
  {
    'country': 'El Salvador',
    'timezone': 'America/El_Salvador',
    'continent': 'North America'
  },
  {
    'country': 'Nicaragua',
    'timezone': 'America/Managua',
    'continent': 'North America'
  },
  {
    'country': 'Haiti',
    'timezone': 'America/Port-au-Prince',
    'continent': 'North America'
  },
  {
    'country': 'Dominican Republic',
    'timezone': 'America/Santo_Domingo',
    'continent': 'North America'
  },
  {
    'country': 'Barbados',
    'timezone': 'America/Barbados',
    'continent': 'North America'
  },
  {
    'country': 'Belize',
    'timezone': 'America/Belize',
    'continent': 'North America'
  },
  {
    'country': 'Saint Lucia',
    'timezone': 'America/St_Lucia',
    'continent': 'North America'
  },
  {
    'country': 'Trinidad and Tobago',
    'timezone': 'America/Port_of_Spain',
    'continent': 'North America'
  },
  {
    'country': 'Saint Vincent',
    'timezone': 'America/St_Vincent',
    'continent': 'North America'
  },
  {
    'country': 'Grenada',
    'timezone': 'America/Grenada',
    'continent': 'North America'
  },
  {
    'country': 'Antigua and Barbuda',
    'timezone': 'America/Antigua',
    'continent': 'North America'
  },
  {
    'country': 'Saint Kitts',
    'timezone': 'America/St_Kitts',
    'continent': 'North America'
  },
  {
    'country': 'Cayman Islands',
    'timezone': 'America/Cayman',
    'continent': 'North America'
  },
  {
    'country': 'Bermuda',
    'timezone': 'Atlantic/Bermuda',
    'continent': 'North America'
  },
  {
    'country': 'Greenland',
    'timezone': 'America/Godthab',
    'continent': 'North America'
  },
  {
    'country': 'Puerto Rico',
    'timezone': 'America/Puerto_Rico',
    'continent': 'North America'
  },
  {
    'country': 'Aruba',
    'timezone': 'America/Aruba',
    'continent': 'North America'
  },
  {
    'country': 'Martinique',
    'timezone': 'America/Martinique',
    'continent': 'North America'
  },
  {
    'country': 'Guadeloupe',
    'timezone': 'America/Guadeloupe',
    'continent': 'North America'
  },

  // Australia
  {
    'country': 'Australia (Sydney)',
    'timezone': 'Australia/Sydney',
    'continent': 'Australia'
  },
  {
    'country': 'Australia (Perth)',
    'timezone': 'Australia/Perth',
    'continent': 'Australia'
  },
  {
    'country': 'Australia (Melbourne)',
    'timezone': 'Australia/Melbourne',
    'continent': 'Australia'
  },
  {
    'country': 'New Zealand',
    'timezone': 'Pacific/Auckland',
    'continent': 'Australia'
  },
  {'country': 'Fiji', 'timezone': 'Pacific/Fiji', 'continent': 'Australia'},
  {
    'country': 'Papua New Guinea',
    'timezone': 'Pacific/Port_Moresby',
    'continent': 'Australia'
  },
  {
    'country': 'Solomon Islands',
    'timezone': 'Pacific/Guadalcanal',
    'continent': 'Australia'
  },
  {'country': 'Vanuatu', 'timezone': 'Pacific/Efate', 'continent': 'Australia'},
  {'country': 'Samoa', 'timezone': 'Pacific/Apia', 'continent': 'Australia'},
  {
    'country': 'Tonga',
    'timezone': 'Pacific/Tongatapu',
    'continent': 'Australia'
  },
  {
    'country': 'Micronesia',
    'timezone': 'Pacific/Chuuk',
    'continent': 'Australia'
  },
  {
    'country': 'Kiribati (Tarawa)',
    'timezone': 'Pacific/Tarawa',
    'continent': 'Australia'
  },
  {'country': 'Palau', 'timezone': 'Pacific/Palau', 'continent': 'Australia'},
  {
    'country': 'Marshall Islands',
    'timezone': 'Pacific/Majuro',
    'continent': 'Australia'
  },
  {
    'country': 'New Caledonia',
    'timezone': 'Pacific/Noumea',
    'continent': 'Australia'
  },
  {
    'country': 'French Polynesia',
    'timezone': 'Pacific/Tahiti',
    'continent': 'Australia'
  },
  {
    'country': 'Cook Islands',
    'timezone': 'Pacific/Rarotonga',
    'continent': 'Australia'
  },
  {'country': 'Nauru', 'timezone': 'Pacific/Nauru', 'continent': 'Australia'},
  {
    'country': 'Tuvalu',
    'timezone': 'Pacific/Funafuti',
    'continent': 'Australia'
  },
  {
    'country': 'Wallis and Futuna',
    'timezone': 'Pacific/Wallis',
    'continent': 'Australia'
  },
  {'country': 'Niue', 'timezone': 'Pacific/Niue', 'continent': 'Australia'},
  {
    'country': 'Tokelau',
    'timezone': 'Pacific/Fakaofo',
    'continent': 'Australia'
  },
  {
    'country': 'Pitcairn Islands',
    'timezone': 'Pacific/Pitcairn',
    'continent': 'Australia'
  },
  {
    'country': 'Norfolk Island',
    'timezone': 'Pacific/Norfolk',
    'continent': 'Australia'
  },
  {
    'country': 'Christmas Island',
    'timezone': 'Indian/Christmas',
    'continent': 'Australia'
  },
  {
    'country': 'Cocos Islands',
    'timezone': 'Indian/Cocos',
    'continent': 'Australia'
  },
  {'country': 'Niue', 'timezone': 'Pacific/Niue', 'continent': 'Australia'},
];

class WorldClockScreen extends StatefulWidget {
  @override
  _WorldClockScreenState createState() => _WorldClockScreenState();
}

class _WorldClockScreenState extends State<WorldClockScreen> {
  late Timer _timer;
  late Map<String, DateTime> _currentTimes;
  String _selectedContinent = "All";
  String _searchText = "";

  @override
  void initState() {
    super.initState();
    tz.initializeTimeZones(); // Initialize timezone database
    _currentTimes = _initializeTimes();
    _startTimer();
  }

  Map<String, DateTime> _initializeTimes() {
    return {
      for (var entry in worldTimeZones)
        entry['timezone']!: tz.TZDateTime.now(
          tz.getLocation(entry['timezone']!),
        ),
    };
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _currentTimes = _initializeTimes();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  List<Map<String, String>> _filterTimeZones() {
    return worldTimeZones.where((entry) {
      final matchesContinent = _selectedContinent == "All" ||
          entry['continent'] == _selectedContinent;
      final matchesSearch =
          entry['country']!.toLowerCase().contains(_searchText.toLowerCase());
      return matchesContinent && matchesSearch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filteredTimeZones = _filterTimeZones();

    return Scaffold(
      appBar: AppBar(
          title: Text("Giờ thế giới", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blueAccent,
          automaticallyImplyLeading: false),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: _selectedContinent,
                    items: [
                      "All",
                      "Asia",
                      "Europe",
                      "North America",
                      "Australia",
                    ]
                        .map((continent) => DropdownMenuItem<String>(
                              value: continent,
                              child: Text(continent),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedContinent = value!;
                      });
                    },
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Tìm kiếm quốc gia",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _searchText = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two cards per row
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: filteredTimeZones.length,
                itemBuilder: (context, index) {
                  final timezone = filteredTimeZones[index]['timezone']!;
                  final country = filteredTimeZones[index]['country']!;
                  final time = _currentTimes[timezone]!;

                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            country,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 8),
                          Text(
                            DateFormat('hh:mm:ss a').format(time),
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
