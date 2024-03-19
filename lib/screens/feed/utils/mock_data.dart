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
List<SampleVideo> videos = [
  SampleVideo(
    name: 'Waves in the water',
    fileUrl:
        'https://assets.mixkit.co/videos/preview/mixkit-waves-in-the-water-1164-large.mp4',
  ),
  SampleVideo(
    name: 'Girl in neon sign',
    fileUrl:
        'https://assets.mixkit.co/videos/preview/mixkit-girl-in-neon-sign-1232-large.mp4',
  ),
  SampleVideo(
    name: 'Woman\'s feet splashing in the pool',
    fileUrl:
        'https://assets.mixkit.co/videos/preview/mixkit-womans-feet-splashing-in-the-pool-1261-large.mp4',
  ),
  SampleVideo(
    name: 'Tree with yellow flowers',
    fileUrl:
        'https://assets.mixkit.co/videos/preview/mixkit-tree-with-yellow-flowers-1173-large.mp4',
  ),
  SampleVideo(
    name: 'Abstract video of a man with heads like matrushka',
    fileUrl:
        'https://assets.mixkit.co/videos/preview/mixkit-abstract-video-of-a-man-with-heads-like-matrushka-32647-large.mp4',
  ),
  SampleVideo(
    name: 'Mother with her little daughter eating a marshmallow in nature',
    fileUrl:
        'https://assets.mixkit.co/videos/preview/mixkit-mother-with-her-little-daughter-eating-a-marshmallow-in-nature-39764-large.mp4',
  ),
  SampleVideo(
    name: 'Hands holding a smart watch with the stopwatch running',
    fileUrl:
        'https://assets.mixkit.co/videos/preview/mixkit-hands-holding-a-smart-watch-with-the-stopwatch-running-32808-large.mp4',
  ),
];
Map<String, dynamic> mockData = {
  "items": [
    for (var video in videos)
      {
        "title": video.name,
        "trailer_url": video.fileUrl,
      },
    for (var i = 0; i < widgets.length; i++)
      {
        "title": widgets[i],
        "trailer_url": "$cloudStorage${widgets[i]}.mp4",
      },
  ]
};

class SampleVideo {
  final String name;
  final String fileUrl;
  SampleVideo({
    required this.name,
    required this.fileUrl,
  });
}
