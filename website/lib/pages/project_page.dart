import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart' as youtube;

// プロジェクトページのフォーマット
// mainから呼び出される
// 変数には、以下を受け取る
// title: String型で、プロジェクトのタイトル
// youtube_urls: List<String>型で、プロジェクトを説明するYouTube動画のURL
// doi: String型で、プロジェクトのDOI
// description: String型で、プロジェクトの説明
// publication: String型で、プロジェクトの論文

class ProjectPage extends StatelessWidget {
  final String title;
  final List<String>? youtube_urls;
  final String? doi;
  final String description;
  final String? publication;
  final Image? image;

  ProjectPage({
    required this.title,
    this.youtube_urls = null,
    this.doi = null,
    required this.description,
    this.publication = null,
    this.image = null,
  });
  // 戻るボタン付きのページを作成
  // 戻るボタンを押すと、前のページに戻る
  // ページは、縦にtitle, image, description, youtube_urls, doi, publicationの順で表示
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: [
          if (image != null) image!,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 24),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              description,
              style: TextStyle(fontSize: 16),
            ),
          ),
          if (youtube_urls != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  // youtubeの動画を表示
                  for (var url in youtube_urls!)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      // youtubeの動画を表示
                      child: youtube.YoutubePlayerControllerProvider(
                        controller: youtube.YoutubePlayerController(
                          initialVideoId:
                              youtube.YoutubePlayerController.convertUrlToId(
                                  url)!,
                          params: youtube.YoutubePlayerParams(
                            showControls: true,
                            showFullscreenButton: true,
                          ),
                        ),
                        child: youtube.YoutubePlayerIFrame(),
                      ),
                    ),
                ],
              ),
            ),
          if (doi != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'DOI: $doi',
                style: TextStyle(fontSize: 16),
              ),
            ),
          if (publication != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                publication!,
                style: TextStyle(fontSize: 16),
              ),
            ),
        ],
      ),
    );
  }
}
