#!perl -T

use strict;
use warnings;
use Test::More;
use FlickrPress;

my $rss = do { local $/ = <DATA> };

my $rs = FlickrPress::parse_rss($rss);

plan tests => 10;

cmp_ok($rs->[0]{title}, "eq", "I don't like looking like this either", "title correctly extracted");
cmp_ok($rs->[0]{author}, "eq", "serialized", "author correctly extracted");
cmp_ok($rs->[0]{id}, "eq", "4002529898", "id correctly extracted");
cmp_ok($rs->[0]{'link'}, "eq", "http://www.flickr.com/photos/serialized/4002529898/", "link correctly extracted");
cmp_ok($rs->[0]{img_src}, "eq", "http://farm3.static.flickr.com/2547/4002529898_712e9db740.jpg", "img_src correctly extracted");
cmp_ok($rs->[0]{width}, "eq", "375", "width correctly calculated");
cmp_ok($rs->[0]{height}, "eq", "500", "height correctly calculated");
cmp_ok($rs->[0]{description}, "eq", "", "entry has no description");
cmp_ok($rs->[3]{description}, "eq", "Glasses from build-a-bear workshop", "entry correctly has a description");
cmp_ok($rs->[4]{title}, "eq", "3957285378 by harmoniousmanic", "title generated when none supplied");

__DATA__
<?xml version="1.0" encoding="utf-8"?>
<rss version="2.0"
        xmlns:media="http://search.yahoo.com/mrss/"
	    xmlns:dc="http://purl.org/dc/elements/1.1/"
	    	    xmlns:flickr="urn:flickr:" >
	<channel>


		<title>Recent Uploads tagged carterbarratt</title>
		<link>http://www.flickr.com/photos/tags/carterbarratt/</link>
 		<description></description>
		<pubDate>Sun, 11 Oct 2009 13:49:24 -0700</pubDate>
		<lastBuildDate>Sun, 11 Oct 2009 13:49:24 -0700</lastBuildDate>
		<generator>http://www.flickr.com/</generator>
		<image>
			<url>http://l.yimg.com/g/images/buddyicon.jpg</url>
			<title>Recent Uploads tagged carterbarratt</title>
			<link>http://www.flickr.com/photos/tags/carterbarratt/</link>
		</image>

		<item>
			<title>I don't like looking like this either</title>
			<link>http://www.flickr.com/photos/serialized/4002529898/</link>
			<description>&lt;p&gt;&lt;a href=&quot;http://www.flickr.com/people/serialized/&quot;&gt;joshuarbarratt&lt;/a&gt; posted a photo:&lt;/p&gt;
&lt;p&gt;&lt;a href=&quot;http://www.flickr.com/photos/serialized/4002529898/&quot; title=&quot;I don't like looking like this either&quot;&gt;&lt;img src=&quot;http://farm3.static.flickr.com/2547/4002529898_712e9db740_m.jpg&quot; width=&quot;180&quot; height=&quot;240&quot; alt=&quot;I don't like looking like this either&quot; /&gt;&lt;/a&gt;&lt;/p&gt;

</description>
			<pubDate>Sun, 11 Oct 2009 13:49:24 -0700</pubDate>
			                        <dc:date.Taken>2009-10-11T13:49:09-08:00</dc:date.Taken>
            			<author flickr:profile="http://www.flickr.com/people/serialized/">nobody@flickr.com (joshuarbarratt)</author>
			<guid isPermaLink="false">tag:flickr.com,2004:/photo/4002529898</guid>
                            			<media:content url="http://farm3.static.flickr.com/2547/4002529898_a0d75670d4_o.jpg" 
				       type="image/jpeg"
				       height="1536"
				       width="1152"/>
            <media:title>I don't like looking like this either</media:title>
        <media:thumbnail url="http://farm3.static.flickr.com/2547/4002529898_712e9db740_s.jpg" height="75" width="75" />
        <media:credit role="photographer">joshuarbarratt</media:credit>
		<media:category scheme="urn:flickr:tags">carterbarratt</media:category>


		</item>
		<item>
			<title>Just my size</title>
			<link>http://www.flickr.com/photos/serialized/3981778185/</link>
			<description>&lt;p&gt;&lt;a href=&quot;http://www.flickr.com/people/serialized/&quot;&gt;joshuarbarratt&lt;/a&gt; posted a photo:&lt;/p&gt;
&lt;p&gt;&lt;a href=&quot;http://www.flickr.com/photos/serialized/3981778185/&quot; title=&quot;Just my size&quot;&gt;&lt;img src=&quot;http://farm3.static.flickr.com/2597/3981778185_cd681d243f_m.jpg&quot; width=&quot;180&quot; height=&quot;240&quot; alt=&quot;Just my size&quot; /&gt;&lt;/a&gt;&lt;/p&gt;

</description>
			<pubDate>Sun, 04 Oct 2009 19:06:57 -0700</pubDate>
			                        <dc:date.Taken>2009-10-04T19:06:48-08:00</dc:date.Taken>
            			<author flickr:profile="http://www.flickr.com/people/serialized/">nobody@flickr.com (joshuarbarratt)</author>
			<guid isPermaLink="false">tag:flickr.com,2004:/photo/3981778185</guid>
                            			<media:content url="http://farm3.static.flickr.com/2597/3981778185_680e26ae6d_o.jpg" 
				       type="image/jpeg"
				       height="1536"
				       width="1152"/>
            <media:title>Just my size</media:title>
        <media:thumbnail url="http://farm3.static.flickr.com/2597/3981778185_cd681d243f_s.jpg" height="75" width="75" />
        <media:credit role="photographer">joshuarbarratt</media:credit>
		<media:category scheme="urn:flickr:tags">carterbarratt</media:category>


		</item>
		<item>
			<title>Big Beatles fan</title>
			<link>http://www.flickr.com/photos/serialized/3966667904/</link>
			<description>&lt;p&gt;&lt;a href=&quot;http://www.flickr.com/people/serialized/&quot;&gt;joshuarbarratt&lt;/a&gt; posted a photo:&lt;/p&gt;
&lt;p&gt;&lt;a href=&quot;http://www.flickr.com/photos/serialized/3966667904/&quot; title=&quot;Big Beatles fan&quot;&gt;&lt;img src=&quot;http://farm3.static.flickr.com/2459/3966667904_9ff28af0ef_m.jpg&quot; width=&quot;180&quot; height=&quot;240&quot; alt=&quot;Big Beatles fan&quot; /&gt;&lt;/a&gt;&lt;/p&gt;

</description>
			<pubDate>Tue, 29 Sep 2009 10:20:26 -0700</pubDate>
			                        <dc:date.Taken>2009-09-29T10:20:18-08:00</dc:date.Taken>
            			<author flickr:profile="http://www.flickr.com/people/serialized/">nobody@flickr.com (joshuarbarratt)</author>
			<guid isPermaLink="false">tag:flickr.com,2004:/photo/3966667904</guid>
                            			<media:content url="http://farm3.static.flickr.com/2459/3966667904_55562e016c_o.jpg" 
				       type="image/jpeg"
				       height="1536"
				       width="1152"/>
            <media:title>Big Beatles fan</media:title>
        <media:thumbnail url="http://farm3.static.flickr.com/2459/3966667904_9ff28af0ef_s.jpg" height="75" width="75" />
        <media:credit role="photographer">joshuarbarratt</media:credit>
		<media:category scheme="urn:flickr:tags">carterbarratt</media:category>


		</item>
		<item>
			<title>I'm gonna have to ask you to pull over the stroller</title>
			<link>http://www.flickr.com/photos/serialized/3959097483/</link>
			<description>&lt;p&gt;&lt;a href=&quot;http://www.flickr.com/people/serialized/&quot;&gt;joshuarbarratt&lt;/a&gt; posted a photo:&lt;/p&gt;
&lt;p&gt;&lt;a href=&quot;http://www.flickr.com/photos/serialized/3959097483/&quot; title=&quot;I'm gonna have to ask you to pull over the stroller&quot;&gt;&lt;img src=&quot;http://farm3.static.flickr.com/2626/3959097483_35f2c03637_m.jpg&quot; width=&quot;180&quot; height=&quot;240&quot; alt=&quot;I'm gonna have to ask you to pull over the stroller&quot; /&gt;&lt;/a&gt;&lt;/p&gt;

&lt;p&gt;Glasses from build-a-bear workshop&lt;/p&gt;</description>
			<pubDate>Sun, 27 Sep 2009 11:53:24 -0700</pubDate>
			                        <dc:date.Taken>2009-09-27T11:53:01-08:00</dc:date.Taken>
            			<author flickr:profile="http://www.flickr.com/people/serialized/">nobody@flickr.com (joshuarbarratt)</author>
			<guid isPermaLink="false">tag:flickr.com,2004:/photo/3959097483</guid>
                            			<media:content url="http://farm3.static.flickr.com/2626/3959097483_8413389155_o.jpg" 
				       type="image/jpeg"
				       height="1536"
				       width="1152"/>
            <media:title>I'm gonna have to ask you to pull over the stroller</media:title>
        <media:description type="html">&lt;p&gt;Glasses from build-a-bear workshop&lt;/p&gt;</media:description>
        <media:thumbnail url="http://farm3.static.flickr.com/2626/3959097483_35f2c03637_s.jpg" height="75" width="75" />
        <media:credit role="photographer">joshuarbarratt</media:credit>
		<media:category scheme="urn:flickr:tags">carterbarratt</media:category>


		</item>
		<item>
			<title></title>
			<link>http://www.flickr.com/photos/harmoniousmanic/3957285378/</link>
			<description>&lt;p&gt;&lt;a href=&quot;http://www.flickr.com/people/harmoniousmanic/&quot;&gt;harmoniousmanic&lt;/a&gt; posted a photo:&lt;/p&gt;
&lt;p&gt;&lt;a href=&quot;http://www.flickr.com/photos/harmoniousmanic/3957285378/&quot; title=&quot;&quot;&gt;&lt;img src=&quot;http://farm4.static.flickr.com/3146/3957285378_e99c0fb509_m.jpg&quot; width=&quot;160&quot; height=&quot;240&quot; alt=&quot;&quot; /&gt;&lt;/a&gt;&lt;/p&gt;

</description>
			<pubDate>Sat, 26 Sep 2009 16:29:31 -0700</pubDate>
			                        <dc:date.Taken>2009-09-26T11:08:17-08:00</dc:date.Taken>
            			<author flickr:profile="http://www.flickr.com/people/harmoniousmanic/">nobody@flickr.com (harmoniousmanic)</author>
			<guid isPermaLink="false">tag:flickr.com,2004:/photo/3957285378</guid>
                            			<media:content url="http://farm4.static.flickr.com/3146/3957285378_bce2f9f56b_o.jpg" 
				       type="image/jpeg"
				       height="800"
				       width="533"/>
            <media:title></media:title>
        <media:thumbnail url="http://farm4.static.flickr.com/3146/3957285378_e99c0fb509_s.jpg" height="75" width="75" />
        <media:credit role="photographer">harmoniousmanic</media:credit>
		<media:category scheme="urn:flickr:tags">carterbarratt</media:category>


		</item>
		<item>
			<title>Fun new toy</title>
			<link>http://www.flickr.com/photos/serialized/3943249402/</link>
			<description>&lt;p&gt;&lt;a href=&quot;http://www.flickr.com/people/serialized/&quot;&gt;joshuarbarratt&lt;/a&gt; posted a photo:&lt;/p&gt;
&lt;p&gt;&lt;a href=&quot;http://www.flickr.com/photos/serialized/3943249402/&quot; title=&quot;Fun new toy&quot;&gt;&lt;img src=&quot;http://farm3.static.flickr.com/2504/3943249402_6cc0d7ff25_m.jpg&quot; width=&quot;180&quot; height=&quot;240&quot; alt=&quot;Fun new toy&quot; /&gt;&lt;/a&gt;&lt;/p&gt;

&lt;p&gt;This ones cool even when we don't put him inside!&lt;/p&gt;</description>
			<pubDate>Mon, 21 Sep 2009 18:15:31 -0700</pubDate>
			                        <dc:date.Taken>2009-09-21T18:15:21-08:00</dc:date.Taken>
            			<author flickr:profile="http://www.flickr.com/people/serialized/">nobody@flickr.com (joshuarbarratt)</author>
			<guid isPermaLink="false">tag:flickr.com,2004:/photo/3943249402</guid>
                            			<media:content url="http://farm3.static.flickr.com/2504/3943249402_ce23ac357e_o.jpg" 
				       type="image/jpeg"
				       height="2048"
				       width="1536"/>
            <media:title>Fun new toy</media:title>
        <media:description type="html">&lt;p&gt;This ones cool even when we don't put him inside!&lt;/p&gt;</media:description>
        <media:thumbnail url="http://farm3.static.flickr.com/2504/3943249402_6cc0d7ff25_s.jpg" height="75" width="75" />
        <media:credit role="photographer">joshuarbarratt</media:credit>
		<media:category scheme="urn:flickr:tags">carterbarratt</media:category>


		</item>
		<item>
			<title>Hey, if they play with MY toys...</title>
			<link>http://www.flickr.com/photos/serialized/3925706057/</link>
			<description>&lt;p&gt;&lt;a href=&quot;http://www.flickr.com/people/serialized/&quot;&gt;joshuarbarratt&lt;/a&gt; posted a photo:&lt;/p&gt;
&lt;p&gt;&lt;a href=&quot;http://www.flickr.com/photos/serialized/3925706057/&quot; title=&quot;Hey, if they play with MY toys...&quot;&gt;&lt;img src=&quot;http://farm3.static.flickr.com/2507/3925706057_0da43860d2_m.jpg&quot; width=&quot;180&quot; height=&quot;240&quot; alt=&quot;Hey, if they play with MY toys...&quot; /&gt;&lt;/a&gt;&lt;/p&gt;

</description>
			<pubDate>Wed, 16 Sep 2009 09:03:07 -0700</pubDate>
			                        <dc:date.Taken>2009-09-16T09:03:07-08:00</dc:date.Taken>
            			<author flickr:profile="http://www.flickr.com/people/serialized/">nobody@flickr.com (joshuarbarratt)</author>
			<guid isPermaLink="false">tag:flickr.com,2004:/photo/3925706057</guid>
                            			<media:content url="http://farm3.static.flickr.com/2507/3925706057_f2d993948d_o.jpg" 
				       type="image/jpeg"
				       height="1536"
				       width="1152"/>
            <media:title>Hey, if they play with MY toys...</media:title>
        <media:thumbnail url="http://farm3.static.flickr.com/2507/3925706057_0da43860d2_s.jpg" height="75" width="75" />
        <media:credit role="photographer">joshuarbarratt</media:credit>
		<media:category scheme="urn:flickr:tags">carterbarratt</media:category>


		</item>
		<item>
			<title>Carter doing pullups</title>
			<link>http://www.flickr.com/photos/serialized/3918154410/</link>
			<description>&lt;p&gt;&lt;a href=&quot;http://www.flickr.com/people/serialized/&quot;&gt;joshuarbarratt&lt;/a&gt; posted a photo:&lt;/p&gt;
&lt;p&gt;&lt;a href=&quot;http://www.flickr.com/photos/serialized/3918154410/&quot; title=&quot;Carter doing pullups&quot;&gt;&lt;img src=&quot;http://farm4.static.flickr.com/3536/3918154410_1352c1c220_m.jpg&quot; width=&quot;180&quot; height=&quot;240&quot; alt=&quot;Carter doing pullups&quot; /&gt;&lt;/a&gt;&lt;/p&gt;

&lt;p&gt;We have installed a bar because Amber and I need to improve. Carter loves it too.&lt;/p&gt;</description>
			<pubDate>Sun, 13 Sep 2009 18:39:02 -0700</pubDate>
			                        <dc:date.Taken>2009-09-13T18:39:02-08:00</dc:date.Taken>
            			<author flickr:profile="http://www.flickr.com/people/serialized/">nobody@flickr.com (joshuarbarratt)</author>
			<guid isPermaLink="false">tag:flickr.com,2004:/photo/3918154410</guid>
                            			<media:content url="http://farm4.static.flickr.com/3536/3918154410_78060b43a0_o.jpg" 
				       type="image/jpeg"
				       height="1536"
				       width="1154"/>
            <media:title>Carter doing pullups</media:title>
        <media:description type="html">&lt;p&gt;We have installed a bar because Amber and I need to improve. Carter loves it too.&lt;/p&gt;</media:description>
        <media:thumbnail url="http://farm4.static.flickr.com/3536/3918154410_1352c1c220_s.jpg" height="75" width="75" />
        <media:credit role="photographer">joshuarbarratt</media:credit>
		<media:category scheme="urn:flickr:tags">carterbarratt</media:category>


		</item>
		<item>
			<title>Acquiring dangerous new skills</title>
			<link>http://www.flickr.com/photos/serialized/3917264427/</link>
			<description>&lt;p&gt;&lt;a href=&quot;http://www.flickr.com/people/serialized/&quot;&gt;joshuarbarratt&lt;/a&gt; posted a photo:&lt;/p&gt;
&lt;p&gt;&lt;a href=&quot;http://www.flickr.com/photos/serialized/3917264427/&quot; title=&quot;Acquiring dangerous new skills&quot;&gt;&lt;img src=&quot;http://farm3.static.flickr.com/2592/3917264427_43c7818033_m.jpg&quot; width=&quot;180&quot; height=&quot;240&quot; alt=&quot;Acquiring dangerous new skills&quot; /&gt;&lt;/a&gt;&lt;/p&gt;

</description>
			<pubDate>Sun, 13 Sep 2009 18:06:53 -0700</pubDate>
			                        <dc:date.Taken>2009-09-13T18:06:53-08:00</dc:date.Taken>
            			<author flickr:profile="http://www.flickr.com/people/serialized/">nobody@flickr.com (joshuarbarratt)</author>
			<guid isPermaLink="false">tag:flickr.com,2004:/photo/3917264427</guid>
                            			<media:content url="http://farm3.static.flickr.com/2592/3917264427_55e442b782_o.jpg" 
				       type="image/jpeg"
				       height="1536"
				       width="1152"/>
            <media:title>Acquiring dangerous new skills</media:title>
        <media:thumbnail url="http://farm3.static.flickr.com/2592/3917264427_43c7818033_s.jpg" height="75" width="75" />
        <media:credit role="photographer">joshuarbarratt</media:credit>
		<media:category scheme="urn:flickr:tags">carterbarratt</media:category>


		</item>
		<item>
			<title>Carter and Zealand meet for the first time</title>
			<link>http://www.flickr.com/photos/serialized/3903660685/</link>
			<description>&lt;p&gt;&lt;a href=&quot;http://www.flickr.com/people/serialized/&quot;&gt;joshuarbarratt&lt;/a&gt; posted a video:&lt;/p&gt;
&lt;p&gt;&lt;a href=&quot;http://www.flickr.com/photos/serialized/3903660685/&quot; title=&quot;Carter and Zealand meet for the first time&quot;&gt;&lt;img src=&quot;http://farm3.static.flickr.com/2422/3903660685_b0322fd6c5_m.jpg&quot; width=&quot;180&quot; height=&quot;240&quot; alt=&quot;Carter and Zealand meet for the first time&quot; /&gt;&lt;/a&gt;&lt;/p&gt;

</description>
			<pubDate>Wed, 09 Sep 2009 09:59:44 -0700</pubDate>
			                        <dc:date.Taken>2009-09-09T09:59:44-08:00</dc:date.Taken>
            			<author flickr:profile="http://www.flickr.com/people/serialized/">nobody@flickr.com (joshuarbarratt)</author>
			<guid isPermaLink="false">tag:flickr.com,2004:/photo/3903660685</guid>
                                        <media:content url="http://www.flickr.com/apps/video/stewart.swf?v=71377&amp;photo_id=3903660685" 
                    type="application/x-shockwave-flash"
                    width="360"
                    height="480" />
			       
            <media:title>Carter and Zealand meet for the first time</media:title>
        <media:thumbnail url="http://farm3.static.flickr.com/2422/3903660685_b0322fd6c5_s.jpg" height="75" width="75" />
        <media:credit role="photographer">joshuarbarratt</media:credit>
		<media:category scheme="urn:flickr:tags">carterbarratt</media:category>
            <enclosure url="http://www.flickr.com/apps/video/stewart.swf?v=71377&amp;photo_id=3903660685" type="application/x-shockwave-flash" />


		</item>
		<item>
			<title>So happy standing</title>
			<link>http://www.flickr.com/photos/harmoniousmanic/3837921855/</link>
			<description>&lt;p&gt;&lt;a href=&quot;http://www.flickr.com/people/harmoniousmanic/&quot;&gt;harmoniousmanic&lt;/a&gt; posted a photo:&lt;/p&gt;
&lt;p&gt;&lt;a href=&quot;http://www.flickr.com/photos/harmoniousmanic/3837921855/&quot; title=&quot;So happy standing&quot;&gt;&lt;img src=&quot;http://farm3.static.flickr.com/2620/3837921855_e64399951d_m.jpg&quot; width=&quot;160&quot; height=&quot;240&quot; alt=&quot;So happy standing&quot; /&gt;&lt;/a&gt;&lt;/p&gt;

</description>
			<pubDate>Wed, 19 Aug 2009 18:35:30 -0700</pubDate>
			                        <dc:date.Taken>2009-08-17T12:27:40-08:00</dc:date.Taken>
            			<author flickr:profile="http://www.flickr.com/people/harmoniousmanic/">nobody@flickr.com (harmoniousmanic)</author>
			<guid isPermaLink="false">tag:flickr.com,2004:/photo/3837921855</guid>
                            			<media:content url="http://farm3.static.flickr.com/2620/3837921855_71f7f65be5_o.jpg" 
				       type="image/jpeg"
				       height="800"
				       width="533"/>
            <media:title>So happy standing</media:title>
        <media:thumbnail url="http://farm3.static.flickr.com/2620/3837921855_e64399951d_s.jpg" height="75" width="75" />
        <media:credit role="photographer">harmoniousmanic</media:credit>
		<media:category scheme="urn:flickr:tags">carterbarratt</media:category>


		</item>
		<item>
			<title>Carter and his new friend Quinn</title>
			<link>http://www.flickr.com/photos/harmoniousmanic/3838716526/</link>
			<description>&lt;p&gt;&lt;a href=&quot;http://www.flickr.com/people/harmoniousmanic/&quot;&gt;harmoniousmanic&lt;/a&gt; posted a photo:&lt;/p&gt;
&lt;p&gt;&lt;a href=&quot;http://www.flickr.com/photos/harmoniousmanic/3838716526/&quot; title=&quot;Carter and his new friend Quinn&quot;&gt;&lt;img src=&quot;http://farm4.static.flickr.com/3466/3838716526_104549d6bc_m.jpg&quot; width=&quot;240&quot; height=&quot;160&quot; alt=&quot;Carter and his new friend Quinn&quot; /&gt;&lt;/a&gt;&lt;/p&gt;

</description>
			<pubDate>Wed, 19 Aug 2009 18:37:23 -0700</pubDate>
			                        <dc:date.Taken>2009-08-18T21:06:59-08:00</dc:date.Taken>
            			<author flickr:profile="http://www.flickr.com/people/harmoniousmanic/">nobody@flickr.com (harmoniousmanic)</author>
			<guid isPermaLink="false">tag:flickr.com,2004:/photo/3838716526</guid>
                            			<media:content url="http://farm4.static.flickr.com/3466/3838716526_9031e22782_o.jpg" 
				       type="image/jpeg"
				       height="533"
				       width="800"/>
            <media:title>Carter and his new friend Quinn</media:title>
        <media:thumbnail url="http://farm4.static.flickr.com/3466/3838716526_104549d6bc_s.jpg" height="75" width="75" />
        <media:credit role="photographer">harmoniousmanic</media:credit>
		<media:category scheme="urn:flickr:tags">carterbarratt</media:category>


		</item>
		<item>
			<title>4:30 am baby</title>
			<link>http://www.flickr.com/photos/harmoniousmanic/3837927699/</link>
			<description>&lt;p&gt;&lt;a href=&quot;http://www.flickr.com/people/harmoniousmanic/&quot;&gt;harmoniousmanic&lt;/a&gt; posted a photo:&lt;/p&gt;
&lt;p&gt;&lt;a href=&quot;http://www.flickr.com/photos/harmoniousmanic/3837927699/&quot; title=&quot;4:30 am baby&quot;&gt;&lt;img src=&quot;http://farm3.static.flickr.com/2564/3837927699_61ec8828a1_m.jpg&quot; width=&quot;160&quot; height=&quot;240&quot; alt=&quot;4:30 am baby&quot; /&gt;&lt;/a&gt;&lt;/p&gt;

</description>
			<pubDate>Wed, 19 Aug 2009 18:37:51 -0700</pubDate>
			                        <dc:date.Taken>2009-08-19T06:15:10-08:00</dc:date.Taken>
            			<author flickr:profile="http://www.flickr.com/people/harmoniousmanic/">nobody@flickr.com (harmoniousmanic)</author>
			<guid isPermaLink="false">tag:flickr.com,2004:/photo/3837927699</guid>
                            			<media:content url="http://farm3.static.flickr.com/2564/3837927699_b1f796f485_o.jpg" 
				       type="image/jpeg"
				       height="800"
				       width="533"/>
            <media:title>4:30 am baby</media:title>
        <media:thumbnail url="http://farm3.static.flickr.com/2564/3837927699_61ec8828a1_s.jpg" height="75" width="75" />
        <media:credit role="photographer">harmoniousmanic</media:credit>
		<media:category scheme="urn:flickr:tags">carterbarratt</media:category>


		</item>
		<item>
			<title>Dad and Son</title>
			<link>http://www.flickr.com/photos/harmoniousmanic/3837925147/</link>
			<description>&lt;p&gt;&lt;a href=&quot;http://www.flickr.com/people/harmoniousmanic/&quot;&gt;harmoniousmanic&lt;/a&gt; posted a photo:&lt;/p&gt;
&lt;p&gt;&lt;a href=&quot;http://www.flickr.com/photos/harmoniousmanic/3837925147/&quot; title=&quot;Dad and Son&quot;&gt;&lt;img src=&quot;http://farm3.static.flickr.com/2658/3837925147_2aaa5c9bbe_m.jpg&quot; width=&quot;160&quot; height=&quot;240&quot; alt=&quot;Dad and Son&quot; /&gt;&lt;/a&gt;&lt;/p&gt;

</description>
			<pubDate>Wed, 19 Aug 2009 18:36:49 -0700</pubDate>
			                        <dc:date.Taken>2009-08-17T16:58:02-08:00</dc:date.Taken>
            			<author flickr:profile="http://www.flickr.com/people/harmoniousmanic/">nobody@flickr.com (harmoniousmanic)</author>
			<guid isPermaLink="false">tag:flickr.com,2004:/photo/3837925147</guid>
                            			<media:content url="http://farm3.static.flickr.com/2658/3837925147_6e231118f8_o.jpg" 
				       type="image/jpeg"
				       height="800"
				       width="533"/>
            <media:title>Dad and Son</media:title>
        <media:thumbnail url="http://farm3.static.flickr.com/2658/3837925147_2aaa5c9bbe_s.jpg" height="75" width="75" />
        <media:credit role="photographer">harmoniousmanic</media:credit>
		<media:category scheme="urn:flickr:tags">carterbarratt</media:category>


		</item>
		<item>
			<title>Cuddles</title>
			<link>http://www.flickr.com/photos/harmoniousmanic/3838711420/</link>
			<description>&lt;p&gt;&lt;a href=&quot;http://www.flickr.com/people/harmoniousmanic/&quot;&gt;harmoniousmanic&lt;/a&gt; posted a photo:&lt;/p&gt;
&lt;p&gt;&lt;a href=&quot;http://www.flickr.com/photos/harmoniousmanic/3838711420/&quot; title=&quot;Cuddles&quot;&gt;&lt;img src=&quot;http://farm3.static.flickr.com/2581/3838711420_0292f9d6e0_m.jpg&quot; width=&quot;240&quot; height=&quot;160&quot; alt=&quot;Cuddles&quot; /&gt;&lt;/a&gt;&lt;/p&gt;

</description>
			<pubDate>Wed, 19 Aug 2009 18:35:17 -0700</pubDate>
			                        <dc:date.Taken>2009-08-15T13:03:45-08:00</dc:date.Taken>
            			<author flickr:profile="http://www.flickr.com/people/harmoniousmanic/">nobody@flickr.com (harmoniousmanic)</author>
			<guid isPermaLink="false">tag:flickr.com,2004:/photo/3838711420</guid>
                            			<media:content url="http://farm3.static.flickr.com/2581/3838711420_b18e56f4f9_o.jpg" 
				       type="image/jpeg"
				       height="533"
				       width="800"/>
            <media:title>Cuddles</media:title>
        <media:thumbnail url="http://farm3.static.flickr.com/2581/3838711420_0292f9d6e0_s.jpg" height="75" width="75" />
        <media:credit role="photographer">harmoniousmanic</media:credit>
		<media:category scheme="urn:flickr:tags">carterbarratt</media:category>


		</item>
		<item>
			<title>&quot; Ahhhh I love Canada eh.&quot;</title>
			<link>http://www.flickr.com/photos/harmoniousmanic/3837925263/</link>
			<description>&lt;p&gt;&lt;a href=&quot;http://www.flickr.com/people/harmoniousmanic/&quot;&gt;harmoniousmanic&lt;/a&gt; posted a photo:&lt;/p&gt;
&lt;p&gt;&lt;a href=&quot;http://www.flickr.com/photos/harmoniousmanic/3837925263/&quot; title=&quot;&amp;quot; Ahhhh I love Canada eh.&amp;quot;&quot;&gt;&lt;img src=&quot;http://farm4.static.flickr.com/3496/3837925263_4d4051c5b1_m.jpg&quot; width=&quot;240&quot; height=&quot;160&quot; alt=&quot;&amp;quot; Ahhhh I love Canada eh.&amp;quot;&quot; /&gt;&lt;/a&gt;&lt;/p&gt;

</description>
			<pubDate>Wed, 19 Aug 2009 18:36:51 -0700</pubDate>
			                        <dc:date.Taken>2009-08-17T17:12:06-08:00</dc:date.Taken>
            			<author flickr:profile="http://www.flickr.com/people/harmoniousmanic/">nobody@flickr.com (harmoniousmanic)</author>
			<guid isPermaLink="false">tag:flickr.com,2004:/photo/3837925263</guid>
                            			<media:content url="http://farm4.static.flickr.com/3496/3837925263_73b16b5127_o.jpg" 
				       type="image/jpeg"
				       height="533"
				       width="800"/>
            <media:title>&quot; Ahhhh I love Canada eh.&quot;</media:title>
        <media:thumbnail url="http://farm4.static.flickr.com/3496/3837925263_4d4051c5b1_s.jpg" height="75" width="75" />
        <media:credit role="photographer">harmoniousmanic</media:credit>
		<media:category scheme="urn:flickr:tags">carterbarratt</media:category>


		</item>
		<item>
			<title>Zonked out baby</title>
			<link>http://www.flickr.com/photos/harmoniousmanic/3837925409/</link>
			<description>&lt;p&gt;&lt;a href=&quot;http://www.flickr.com/people/harmoniousmanic/&quot;&gt;harmoniousmanic&lt;/a&gt; posted a photo:&lt;/p&gt;
&lt;p&gt;&lt;a href=&quot;http://www.flickr.com/photos/harmoniousmanic/3837925409/&quot; title=&quot;Zonked out baby&quot;&gt;&lt;img src=&quot;http://farm3.static.flickr.com/2525/3837925409_023c9f51c1_m.jpg&quot; width=&quot;240&quot; height=&quot;160&quot; alt=&quot;Zonked out baby&quot; /&gt;&lt;/a&gt;&lt;/p&gt;

</description>
			<pubDate>Wed, 19 Aug 2009 18:36:55 -0700</pubDate>
			                        <dc:date.Taken>2009-08-18T11:01:54-08:00</dc:date.Taken>
            			<author flickr:profile="http://www.flickr.com/people/harmoniousmanic/">nobody@flickr.com (harmoniousmanic)</author>
			<guid isPermaLink="false">tag:flickr.com,2004:/photo/3837925409</guid>
                            			<media:content url="http://farm3.static.flickr.com/2525/3837925409_5e6dba162c_o.jpg" 
				       type="image/jpeg"
				       height="533"
				       width="800"/>
            <media:title>Zonked out baby</media:title>
        <media:thumbnail url="http://farm3.static.flickr.com/2525/3837925409_023c9f51c1_s.jpg" height="75" width="75" />
        <media:credit role="photographer">harmoniousmanic</media:credit>
		<media:category scheme="urn:flickr:tags">carterbarratt</media:category>


		</item>
		<item>
			<title>Sun drentched baby</title>
			<link>http://www.flickr.com/photos/harmoniousmanic/3837918625/</link>
			<description>&lt;p&gt;&lt;a href=&quot;http://www.flickr.com/people/harmoniousmanic/&quot;&gt;harmoniousmanic&lt;/a&gt; posted a photo:&lt;/p&gt;
&lt;p&gt;&lt;a href=&quot;http://www.flickr.com/photos/harmoniousmanic/3837918625/&quot; title=&quot;Sun drentched baby&quot;&gt;&lt;img src=&quot;http://farm3.static.flickr.com/2453/3837918625_24dff544a6_m.jpg&quot; width=&quot;160&quot; height=&quot;240&quot; alt=&quot;Sun drentched baby&quot; /&gt;&lt;/a&gt;&lt;/p&gt;

</description>
			<pubDate>Wed, 19 Aug 2009 18:34:05 -0700</pubDate>
			                        <dc:date.Taken>2009-08-12T19:47:12-08:00</dc:date.Taken>
            			<author flickr:profile="http://www.flickr.com/people/harmoniousmanic/">nobody@flickr.com (harmoniousmanic)</author>
			<guid isPermaLink="false">tag:flickr.com,2004:/photo/3837918625</guid>
                            			<media:content url="http://farm3.static.flickr.com/2453/3837918625_ccbbdeda35_o.jpg" 
				       type="image/jpeg"
				       height="800"
				       width="533"/>
            <media:title>Sun drentched baby</media:title>
        <media:thumbnail url="http://farm3.static.flickr.com/2453/3837918625_24dff544a6_s.jpg" height="75" width="75" />
        <media:credit role="photographer">harmoniousmanic</media:credit>
		<media:category scheme="urn:flickr:tags">carterbarratt</media:category>


		</item>
		<item>
			<title>Rockin'</title>
			<link>http://www.flickr.com/photos/harmoniousmanic/3837920051/</link>
			<description>&lt;p&gt;&lt;a href=&quot;http://www.flickr.com/people/harmoniousmanic/&quot;&gt;harmoniousmanic&lt;/a&gt; posted a photo:&lt;/p&gt;
&lt;p&gt;&lt;a href=&quot;http://www.flickr.com/photos/harmoniousmanic/3837920051/&quot; title=&quot;Rockin'&quot;&gt;&lt;img src=&quot;http://farm3.static.flickr.com/2638/3837920051_4cb362d8fd_m.jpg&quot; width=&quot;160&quot; height=&quot;240&quot; alt=&quot;Rockin'&quot; /&gt;&lt;/a&gt;&lt;/p&gt;

</description>
			<pubDate>Wed, 19 Aug 2009 18:34:42 -0700</pubDate>
			                        <dc:date.Taken>2009-08-13T13:05:05-08:00</dc:date.Taken>
            			<author flickr:profile="http://www.flickr.com/people/harmoniousmanic/">nobody@flickr.com (harmoniousmanic)</author>
			<guid isPermaLink="false">tag:flickr.com,2004:/photo/3837920051</guid>
                            			<media:content url="http://farm3.static.flickr.com/2638/3837920051_331d9dcd77_o.jpg" 
				       type="image/jpeg"
				       height="800"
				       width="533"/>
            <media:title>Rockin'</media:title>
        <media:thumbnail url="http://farm3.static.flickr.com/2638/3837920051_4cb362d8fd_s.jpg" height="75" width="75" />
        <media:credit role="photographer">harmoniousmanic</media:credit>
		<media:category scheme="urn:flickr:tags">carterbarratt</media:category>


		</item>
		<item>
			<title>@ Sculputre Garden in Seattle</title>
			<link>http://www.flickr.com/photos/harmoniousmanic/3837920187/</link>
			<description>&lt;p&gt;&lt;a href=&quot;http://www.flickr.com/people/harmoniousmanic/&quot;&gt;harmoniousmanic&lt;/a&gt; posted a photo:&lt;/p&gt;
&lt;p&gt;&lt;a href=&quot;http://www.flickr.com/photos/harmoniousmanic/3837920187/&quot; title=&quot;@ Sculputre Garden in Seattle&quot;&gt;&lt;img src=&quot;http://farm3.static.flickr.com/2515/3837920187_88a73c3a84_m.jpg&quot; width=&quot;240&quot; height=&quot;160&quot; alt=&quot;@ Sculputre Garden in Seattle&quot; /&gt;&lt;/a&gt;&lt;/p&gt;

</description>
			<pubDate>Wed, 19 Aug 2009 18:34:45 -0700</pubDate>
			                        <dc:date.Taken>2009-08-13T14:24:55-08:00</dc:date.Taken>
            			<author flickr:profile="http://www.flickr.com/people/harmoniousmanic/">nobody@flickr.com (harmoniousmanic)</author>
			<guid isPermaLink="false">tag:flickr.com,2004:/photo/3837920187</guid>
                            			<media:content url="http://farm3.static.flickr.com/2515/3837920187_08b0910d45_o.jpg" 
				       type="image/jpeg"
				       height="533"
				       width="800"/>
            <media:title>@ Sculputre Garden in Seattle</media:title>
        <media:thumbnail url="http://farm3.static.flickr.com/2515/3837920187_88a73c3a84_s.jpg" height="75" width="75" />
        <media:credit role="photographer">harmoniousmanic</media:credit>
		<media:category scheme="urn:flickr:tags">carterbarratt</media:category>


		</item>

	</channel>
</rss>
