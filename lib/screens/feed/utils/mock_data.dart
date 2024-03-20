import 'dart:math';

String cloudStorage =
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/';
List<String> names = [
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
        "avatar": avatars[Random().nextInt(avatars.length)],
      },
    for (var i = 0; i < names.length; i++)
      {
        "title": names[i],
        "trailer_url": "$cloudStorage${names[i]}.mp4",
        "avatar": avatars[Random().nextInt(avatars.length)],
      },
  ]
};

List<String> avatars = [
  'https://img.freepik.com/free-psd/3d-illustration-person-with-sunglasses_23-2149436188.jpg?size=626&ext=jpg&ga=GA1.1.1391464843.1710838680&semt=ais',
  'https://img.freepik.com/free-psd/3d-illustration-human-avatar-profile_23-2150671142.jpg?size=626&ext=jpg&ga=GA1.1.1391464843.1710838680&semt=ais',
  'https://img.freepik.com/free-psd/3d-render-avatar-character_23-2150611716.jpg?size=626&ext=jpg&ga=GA1.1.1391464843.1710838680&semt=ais',
  'https://img.freepik.com/premium-psd/3d-illustration-business-man-with-glasses_23-2149436193.jpg?size=626&ext=jpg&ga=GA1.1.1391464843.1710838680&semt=ais',
  'https://img.freepik.com/free-psd/3d-illustration-person-with-glasses_23-2149436185.jpg?size=626&ext=jpg&ga=GA1.1.1391464843.1710838680&semt=ais',
  'https://img.freepik.com/free-psd/3d-rendering-avatar_23-2150833572.jpg?size=626&ext=jpg&ga=GA1.1.1391464843.1710838680&semt=ais',
  'https://img.freepik.com/free-psd/3d-rendering-avatar_23-2150833554.jpg?size=626&ext=jpg&ga=GA1.1.1391464843.1710838680&semt=ais',
  'https://img.freepik.com/premium-psd/3d-illustration-person-with-purple-hair-glasses_23-2149436204.jpg?size=626&ext=jpg&ga=GA1.1.1391464843.1710838680&semt=ais',
  'https://img.freepik.com/free-psd/3d-illustration-person-with-sunglasses_23-2149436180.jpg?size=626&ext=jpg&ga=GA1.1.1391464843.1710838680&semt=ais',
  'https://img.freepik.com/free-psd/3d-illustration-person-with-sunglasses_23-2149436178.jpg?size=626&ext=jpg&ga=GA1.1.1391464843.1710838680&semt=ais',
  'https://img.freepik.com/free-psd/3d-render-avatar-character_23-2150611746.jpg?size=626&ext=jpg&ga=GA1.1.1391464843.1710838680&semt=ais',
  'https://img.freepik.com/premium-psd/3d-render-avatar-character_23-2150611774.jpg?size=626&ext=jpg&ga=GA1.1.1391464843.1710838680&semt=ais',
];

class SampleVideo {
  final String name;
  final String fileUrl;
  SampleVideo({
    required this.name,
    required this.fileUrl,
  });
}
