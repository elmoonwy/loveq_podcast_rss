#!/Users/yuwang/.rvm/rubies/default/bin/ruby

require 'date'
require 'securerandom'

year = ARGV[0]
output_path = "loveq-#{year}.rss"

start_date = Date.parse(year+"-01-01")
end_date = Date.parse(year+"-12-31")

if File.exist? output_path
  throw "Found file #{output_path}, please delete the file to continue"
end

File.open(output_path, "w") do |f|
  f.write '<?xml version="1.0" encoding="UTF-8"?><rss xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:content="http://purl.org/rss/1.0/modules/content/" xmlns:atom="http://www.w3.org/2005/Atom" version="2.0" xmlns:itunes="http://www.itunes.com/dtds/podcast-1.0.dtd" xmlns:anchor="https://anchor.fm/xmlns">'
  f.write "\n"
  f.write ' <channel>'
  f.write "\n"
  f.write "   <title><![CDATA[loveq-#{year}]]></title>"
  f.write "\n"
  f.write '   <description><![CDATA[loveq podcast]]></description>'
  f.write "\n"
  f.write '   <link>https://anchor.fm/gongxifacai</link>'
  f.write "\n"
  f.write '   <image>'
  f.write "\n"
  f.write '     <url>https://d3t3ozftmdmh3i.cloudfront.net/production/podcast_uploaded/10014170/10014170-1603149144647-15a83eee88173.jpg</url>'
  f.write "\n"
  f.write '     <title>床前明月光</title>'
  f.write "\n"
  f.write '     <link>https://anchor.fm/gongxifacai</link>'
  f.write "\n"
  f.write '   </image>'
  f.write "\n"
  f.write '   <generator>Anchor Podcasts</generator>'
  f.write "\n"
  f.write '   <lastBuildDate>Fri, 23 Oct 2020 00:33:18 GMT</lastBuildDate>'
  f.write "\n"
  f.write '   <atom:link href="https://anchor.fm/s/3c48ffa8/podcast/rss" rel="self" type="application/rss+xml"/>'
  f.write "\n"
  f.write '   <author><![CDATA[Marshall]]></author>'
  f.write "\n"
  f.write '   <copyright><![CDATA[Marshall]]></copyright>'
  f.write "\n"
  f.write '   <language><![CDATA[zh]]></language>'
  f.write "\n"
  f.write '   <atom:link rel="hub" href="https://pubsubhubbub.appspot.com/"/>'
  f.write "\n"

  for day in (start_date...end_date) do
    if day.saturday? or day.sunday?
      f.write '   <item>'
      f.write "\n"
      f.write "     <title><![CDATA[#{day.to_s}]]></title>"
      f.write "\n"
      f.write "     <description><![CDATA[<p>#{day.to_s}</p>]]></description>"
      f.write "\n"
      f.write '     <link>https://anchor.fm/gongxifacai/episodes/2020-10-17-elet81</link>'
      f.write "\n"
      f.write "     <guid isPermaLink=\"false\">#{SecureRandom.uuid}</guid>"
      f.write "\n"
      f.write '     <dc:creator><![CDATA[Marshall]]></dc:creator>'
      f.write "\n"
      f.write "     <pubDate>#{day.strftime("%a, %d %b %Y")} 06:00:00 GMT</pubDate>"
      f.write "\n"
      #f.write '     <pubDate>Sun, 11 Oct 2020 01:00:00 GMT</pubDate>'
      f.write "     <enclosure url=\"https://dl1.loveq.cn:8090/program/2020/#{day.to_s.gsub('-', '.')}.mp3\" type=\"audio/mpeg\"/>"
      f.write "\n"
      f.write '   </item>'
      f.write "\n"
    end
  end

  f.write ' </channel>'
  f.write "\n"
  f.write '</rss>'
  f.write "\n"
end
