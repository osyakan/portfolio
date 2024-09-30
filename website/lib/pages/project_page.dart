import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'dart:math';
import 'package:url_launcher/url_launcher.dart';

class ProjectPage extends StatelessWidget {
  // 'title': 'Project 1',
  // 'image': 'image/project1.png',
  // 'youtubelink': 'https://www.youtube.com/watch?v=123456',
  // 'youtubelink_sub': 'https://www.youtube.com/watch?v=123456',
  // 'description': 'Project 1 description goes here',
  // 'doi': 'https://doi.org/10.12345',
  // 'publication1': 'Publication 1',
  // 'publication2': 'Publication 2',
  // 以上を受け取る
  final String title,
      image,
      youtubelink,
      youtubelink_sub,
      description,
      doi1,
      doi2,
      doi3,
      publication1,
      publication2,
      publication3;
  ProjectPage(
      {Key? key,
      required this.title,
      required this.image,
      required this.youtubelink,
      required this.youtubelink_sub,
      required this.description,
      required this.doi1,
      required this.doi2,
      required this.doi3,
      required this.publication1,
      required this.publication2,
      required this.publication3})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // YouTubeの動画IDを抽出
    String extractVideoId(String url) {
      final uri = Uri.parse(url);
      if (uri.queryParameters.containsKey('v')) {
        return uri.queryParameters['v']!;
      }
      return '';
    }

    final videoId = extractVideoId(youtubelink);
    final videoIdSub = extractVideoId(youtubelink_sub);
    final fixwidth = MediaQuery.of(context).size.width * 0.7;
    final padHeight = 30.0;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.04),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: padHeight),
                    // 16:9のアスペクト比で表示
                    Container(
                      width: fixwidth,
                      height: fixwidth * 9 / 16,
                      child: Image.asset(image),
                    ),
                    SizedBox(height: padHeight),
                    Container(
                      width: fixwidth,
                      child: Text(
                        description,
                        textAlign: TextAlign.left,
                        // screensizeに合わせてフォントサイズを変更
                        style: TextStyle(
                          fontSize: min(
                              max(MediaQuery.of(context).size.width * 0.024, 5),
                              25),
                        ),
                      ),
                    ),
                    // youtubeを埋め込み
                    if (videoId.isNotEmpty) SizedBox(height: padHeight),
                    if (videoId.isNotEmpty)
                      Container(
                        width: fixwidth,
                        height: fixwidth * 9 / 16,
                        child: YoutubePlayerIFrame(
                          controller: YoutubePlayerController(
                            initialVideoId: videoId,
                            params: YoutubePlayerParams(
                              showControls: true,
                              showFullscreenButton: true,
                            ),
                          ),
                        ),
                      ),
                    if (videoId.isNotEmpty) SizedBox(height: padHeight),
                    if (videoIdSub.isNotEmpty) SizedBox(height: padHeight),
                    if (videoIdSub.isNotEmpty)
                      Container(
                        width: fixwidth,
                        height: fixwidth * 9 / 16,
                        child: YoutubePlayerIFrame(
                          controller: YoutubePlayerController(
                            initialVideoId: videoIdSub,
                            params: YoutubePlayerParams(
                              showControls: true,
                              showFullscreenButton: true,
                            ),
                          ),
                        ),
                      ),
                    if (publication1 != '')
                      makePublication(
                          padHeight, fixwidth, publication1, doi1, context),
                    if (publication2 != '')
                      makePublication(
                          padHeight, fixwidth, publication2, doi2, context),

                    SizedBox(height: 150),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Column makePublication(double padHeight, double fixwidth, String publication,
      String doi, BuildContext context) {
    return Column(
      children: [
        SizedBox(height: padHeight),
        Container(
          width: fixwidth,
          // 左寄せにする
          alignment: Alignment.centerLeft,
          child: Column(
            // 左寄せにする
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                publication1,
                style: TextStyle(
                  fontSize:
                      min(max(MediaQuery.of(context).size.width * 0.02, 4), 20),
                ),
              ),
              if (doi != '')
                InkWell(
                  child: Text(
                    'DOI: $doi',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      fontSize: min(
                          max(MediaQuery.of(context).size.width * 0.02, 4), 20),
                    ),
                  ),
                  onTap: () => launchUrl(Uri.parse(doi)),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
