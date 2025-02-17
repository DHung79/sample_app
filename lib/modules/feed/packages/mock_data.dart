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
    name: 'stir fried Tom Yum seafood dried spaghetti - Fusion food style',
    fileUrl:
        'https://video-previews.elements.envatousercontent.com/4b17859e-ee17-41e0-a92b-fc221ea32aea/watermarked_preview/watermarked_preview.mp4',
  ),
  SampleVideo(
    name: 'Restaurant, hand and eating sushi for lunch, closeup food and nutrition with seafood',
    fileUrl:
        'https://video-previews.elements.envatousercontent.com/4a234b63-7205-4932-95e7-60bfc04623d1/watermarked_preview/watermarked_preview.mp4',
  ),
  SampleVideo(
    name: 'Expense Food Budgeting Indoor',
    fileUrl:
        'https://video-previews.elements.envatousercontent.com/be32de62-0050-4afa-ab29-b8cc2df4f57c/watermarked_preview/watermarked_preview.mp4',
  ),
  SampleVideo(
    name: 'Aerial view of Dubai frame landmark during the sunset, Dubai, U.A.E',
    fileUrl:
        'https://video-previews.elements.envatousercontent.com/files/c7b61872-0a28-4204-bfdb-ba5c25705b9f/video_preview_h264.mp4',
  ),
  SampleVideo(
    name: 'Cinematic World earth Loop Animation',
    fileUrl:
        'https://video-previews.elements.envatousercontent.com/files/c54cae60-22ba-4497-aac7-6c7c9ca48ed4/video_preview_h264.mp4',
  ),
  SampleVideo(
    name: 'Dramatic Ocean Coast',
    fileUrl:
        'https://video-previews.elements.envatousercontent.com/h264-video-previews/8af44033-2913-4c5b-8b35-9a2fe926c745/2004044.mp4',
  ),
  SampleVideo(
    name: 'Dubai Marina Skyline Showing Skyscrapers Under Construction',
    fileUrl:
        'https://video-previews.elements.envatousercontent.com/5b3185d6-41b1-4853-9077-2db9fd2a36e0/watermarked_preview/watermarked_preview.mp4',
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
