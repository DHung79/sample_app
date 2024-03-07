String cloudStorage =
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/';
List<String> widgets = [
  'BigBuckBunny',
  'DesigningForGoogleCast',
  'ElephantsDream',
  'ForBiggerBlazes',
  'ForBiggerEscapes',
  'ForBiggerFun',
  'ForBiggerJoyrides',
  'ForBiggerMeltdowns',
  'GoogleIO-2014-CastingToTheFuture',
  'Google_I_O_2013_Keynote',
  'Sintel',
  'TearsOfSteel',
  'VolkswagenGTIReview',
  'WeAreGoingOnBullrun',
  'WhatCarCanYouGetForAGrand',
];
Map<String, dynamic> mockData = {
  "items": [
    for (var i = 0; i < widgets.length; i++)
      {
        "title": widgets[i],
        "trailer_url": "$cloudStorage${widgets[i]}.mp4",
      },
  ]
};
