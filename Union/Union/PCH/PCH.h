//
//  PCH.h
//  Union
//
//  Created by 李响 on 15/7/13.
//  Copyright (c) 2015年 Lee. All rights reserved.
//

#ifndef Union_PCH_h
#define Union_PCH_h

#import <AFNetworking.h>

#import <AFURLRequestSerialization.h>

#import <AFURLResponseSerialization.h>

#import <UIImageView+WebCache.h>



#import "UIView+LXAlertView.h"



//主题颜色

#define MAINCOLOER [UIColor colorWithRed:105/255.0 green:149/255.0 blue:246/255.0 alpha:1]


/**
 *
 *  =Union_News=
 *
 *  Interface
 *
 **/


#define kNews_ListURL @"http://box.dwstatic.com/apiNewsList.php?action=l&newsTag=%@&p=%@"

#define News_PrettyPicturesURL @"http://box.dwstatic.com/apiAlbum.php?action=l&albumsTag=beautifulWoman&p=%@"

#define News_SorryFigureURL @"http://box.dwstatic.com/apiAlbum.php?action=l&albumsTag=jiongTu&p=%@"

#define News_WallpaperURL @"http://box.dwstatic.com/apiAlbum.php?action=l&albumsTag=wallpaper&p=%@"

#define News_TopicURL  @"http://box.dwstatic.com/apiNewsList.php?action=topic&topicId=68"

#define News_LPLLiveURL  @"http://lol.duowan.com/1501/m_285071449546.html"

#define News_LPLItegralURL  @"http://lol.duowan.com/1501/m_285071469977.html"

#define News_WebViewURl  @"http://box.dwstatic.com/apiNewsList.php?action=d&newsId="

#define News_PicturesURL @"http://box.dwstatic.com/apiAlbum.php?action=d&albumId="



/**
 *
 *  =Union_News=
 *
 *  Interface
 *
 *  ===END===
 **/




/**
 *
 *  =Union_Video=
 *
 *  Interface
 *
 **/



//分类视图URL
#define kUnion_Video_SortURL @"http://box.dwstatic.com/apiVideoesNormalDuowan.php?src=duowan&action=c&sk=&sn=&pn="

//最新视图URL
#define kUnion_Video_NewURL @"http://box.dwstatic.com/apiVideoesNormalDuowan.php?src=duowan&action=l&sk=&pageUrl=&heroEnName=&tag=newest&p=%ld"

//分类中点击cell后URL
#define kUnion_Video_URL @"http://box.dwstatic.com/apiVideoesNormalDuowan.php?v=117&action=l&p=%@&tag=%@&src=letv"

//视频搜索URL

#define kUnion_Video_SearchURL @"http://box.dwstatic.com/apiVideoesNormalDuowan.php?searchKey=%@&p=%@&v=118&action=search"

//视频详情URL

#define kUnion_VideoDetailsURL @"http://box.dwstatic.com/apiVideoesNormalDuowan.php?action=f&vid=%@"


/**
 *
 *  =Union_Video=
 *
 *  Interface
 *
 *  ===END===
 **/


/**
 *
 *  =Union_Ency=
 *
 *  Interface
 *
 **/

//联盟百科菜单URL

#define kUnion_EncyMenuURL @"http://box.dwstatic.com/apiToolMenu.php?category=database&v=117&OSType=iOS8.4&versionName=2.2.7"

//英雄列表URL

#define kUnion_Ency_HeroListURL @"http://lolbox.duowan.com/phone/apiHeroes.php?type=%@"

//我的英雄列表URL

#define kUnion_Ency_MyHeroListURL @"http://lolbox.duowan.com/phone/apiMyHeroes.php?serverName=%@&target=%@&v=108"

//英雄详情URL

#define kUnion_Ency_HeroDetailURL @"http://lolbox.duowan.com/phone/apiHeroDetail.php?heroName=%@"


//英雄 —— 英雄图片 (PNG)

//http://img.lolbox.duowan.com/champions/英雄名_120x120.jpg

#define kUnion_Ency_HeroImageURL @"http://img.lolbox.duowan.com/champions/%@_120x120.jpg"


//装备分类列表URL

#define kUnion_Equip_Type_ListURL @"http://lolbox.duowan.com/phone/apiZBCategory.php"

//装备列表URL

#define kUnion_Equip_ListURl @"http://lolbox.duowan.com/phone/apiZBItemList.php?tag=%@"

//装备图片URL

#define kUnion_Equip_ListImageURL @"http://img.lolbox.duowan.com/zb/%ld_64x64.png"

//装备详情URL

#define kUnion_Equip_DetailsURL @"http://lolbox.duowan.com/phone/apiItemDetail.php?id=%ld"













/**
 *
 *  =Union_Ency=
 *
 *  Interface
 *
 *  ===END===
 **/





/**
 *
 *  =Union_MyUnion=
 *
 *  Interface
 *
 **/


//添加召唤师URL

#define kUnion_MyUion_AddSummonerURL @"http://lolbox.duowan.com/phone/apiCheckUser.php?action=getPlayersInfo&serverName=%@&target=%@"

//我的信息URL

#define kUnion_MyUnion_URL @"http://zdl.mbox.duowan.com/phone/playerDetailNew.php?sn=%@&target=%@&v=108&OSType=iOS8.4&versionName=2.2.5"

//召唤师头像URL

#define kUnion_MyUnion_IconURL @"http://img.lolbox.duowan.com/profileIcon/profileIcon%@.jpg"

/**
 *
 *  =Union_MyUnion=
 *
 *  Interface
 *
 *  ===END===
 **/















#endif
