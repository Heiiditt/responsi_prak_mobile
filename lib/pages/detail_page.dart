import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailMenu extends StatelessWidget {
  late final menu ? menu;

  DetailMenu({required this.menu});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: Text('Detail Menu'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      '${menu?.strTeam ?? 'Unknown'} (${menu?.Categori})',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 200,
                    child: Image.network(
                      '${menu?.Makan}',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(CupertinoIcons.globe),
                        onPressed: () {
                          launcher('${menu?.snak}');
                        },
                      ),
                      IconButton(
                        icon: Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/Instagram_logo_2022.svg/2048px-Instagram_logo_2022.svg.png'),
                        onPressed: () {
                          launcher('${menu?.Categories}');
                        },
                      ),
                      IconButton(
                        icon: Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Logo_of_Twitter.svg/512px-Logo_of_Twitter.svg.png'),
                        onPressed: () {
                          launcher('${menu?.strTwitter}');
                        },
                      ),
                      IconButton(
                        icon: Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Facebook_f_logo_%282019%29.svg/2048px-Facebook_f_logo_%282019%29.svg.png'),
                        onPressed: () {
                          launcher('${menu?.strFacebook}');
                        },
                      ),
                      IconButton(
                        icon: Image.network('https://upload.wikimedia.org/wikipedia/commons/e/ef/Youtube_logo.png?20220706172052'),
                        onPressed: () {
                          launcher('${menu?.strYoutube}');
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: Column(
                      children: [
                        Text(
                            'Formed Year',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            )
                        ),
                        Text(
                            '${menu?.intFormedYear}',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal
                            )
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: Column(
                      children: [
                        Text(
                            'Description',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            )
                        ),
                        Text(
                          '${menu?.strDescriptionEN}',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Stadium',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Image.network('${menu?.strStadiumThumb}'),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        children: [
                          TextSpan(
                            text: 'Nama Masakan: ',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          TextSpan(
                              text: '${menu?.masakan}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold
                              )
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        children: [
                          TextSpan(
                            text: 'Stadium Capacity: ',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          TextSpan(
                              text: '${menu?.intStadiumCapacity}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold
                              )
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        children: [
                          TextSpan(
                            text: 'Stadium Location: ',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          TextSpan(
                              text: '${menu?.strStadiumLocation}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold
                              )
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Stadium Description: ',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 16
                      ),
                    ),
                    Text(
                      '${menu?.strStadiumDescription}',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 16
                      ),
                      textAlign: TextAlign.justify,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> launcher(String url) async {
    final Uri _url = Uri.parse(url.startsWith('http') ? url : 'https://$url');
    if (!await launchUrl(_url)) {
      throw Exception("Failed to launch URL: $_url");
    }
  }
}