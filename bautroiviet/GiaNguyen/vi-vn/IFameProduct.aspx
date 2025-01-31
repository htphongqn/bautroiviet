﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IFameProduct.aspx.cs" Inherits="THVDev.vi_vn.IFameProduct" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script src="/Scripts/jquery-1.8.3.min.js" type="text/javascript"></script>
<!--Zoom-->
<link rel="stylesheet" href="/Styles/jquery.jqzoom.css" type="text/css">
<style type="text/css">
body { font: normal 13px/1.5 Arial, Helvetica, sans-serif }
.cf:after{clear:both;content:".";display:block;font-size:0;height:0;line-height:0;visibility:hidden;}
.cf{display:block;zoom:1}
h1 {
	color: #034285;
	font-size: 1.6em;
	font-weight: bold;
	margin: 10px 0;
	text-align: left;
}
.large_img_iframe {
	float: left;
	width: 60%;
	height:100%;
	text-align: center
}
.main_image_iframe { max-width: 500px; max-height: 500px }
#thumblist_iframe {
	position: relative;
	float: right;
	width: 210px;
	margin-top:15px;
	list-style: none
}
.zoomContainer {
	cursor: -moz-zoom-in;
	cursor: -webkit-zoom-in;
}
#thumblist_iframe  ul { padding: 0; margin: 0 }
#thumblist_iframe li {
	list-style: none;
	float: left;
	width: 60px;
	margin: 0 3px
}
#thumblist_iframe li a {
	display: table-cell;
	vertical-align: middle;
	width: 60px;
	height: 60px;
	text-align: center;
	border: 1px solid #CACACA
}
#thumblist_iframe li a.zoomThumbActive {
	border-color: red;
}
#thumblist_iframe li img {
	max-width: 60px;
	max-height: 60px
}
#prev_thumb, #next_thumb {
	text-decoration:none;
	display: inline-block;
	line-height: 20px;
	z-index: 10;
	cursor: pointer;
	text-align: center;
	padding-top: 15px
}
</style>
</head>
<body style="overflow:hidden;">
    <form id="form1" runat="server">
    <div style="width: 100%;">
  <!--Zoom-->
  <link rel="stylesheet" href="/Styles/jquery.jqzoom.css" type="text/css">
  <script src="/Scripts/jquery.jqzoom-core.js" type="text/javascript"></script>
  <!--ColorBox-->
  <link rel="stylesheet" href="/Styles/colorbox.css" />
  <script type="text/javascript" src="/Scripts/jquery.colorbox.js"></script>

  
  <div class="large_img_iframe"> <a href="http://media.bizwebmedia.net/sites/102040/data/images/2015/3/2351327duong_vat_cam_tay_cao_cap_26_2637982.jpg" class="jqzoom_iframe" rel='gal1'  title="triumph"> 
  <img class="main_image_iframe" src="http://media.bizwebmedia.net/sites/102040/data/images/2015/3/2351327duong_vat_cam_tay_cao_cap_26_2637982.jpg"  title="triumph" ></a></div>
  <div id="thumblist_iframe" class="cf">
  <h1>
    <div style="position: relative;" class="ProductImageName"> Âm đạo đèn pin có điều khiển Spider - DC45B</div>
  </h1>
    <ul>
      <asp:Repeater ID="Rpimg_small" runat="server">
            <ItemTemplate>
                <li><a class="zoomThumbActive" href='javascript:void(0);' 
                rel="{gallery: 'gal1', smallimage: '<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMG_IMAGE1")) %>'
                ,largeimage: '<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMG_IMAGE1")) %>'}">
                <img src='<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMG_IMAGE1")) %>'></a></li>
            </ItemTemplate>
        </asp:Repeater>
    </ul>
    <div align="center"><a class="prev" id="prev_thumb" href="#">« Quay lại</a> | <a class="next" id="next_thumb" href="#">Tiếp theo »</a></div></div>
  <!--end Zoom-->
</div>
<!--Carousel-->
<script type="text/javascript" src="/Scripts/jquery.carouFredSel.js"></script>
<script src="/Scripts/jquery.jqzoom-core.js" type="text/javascript"></script>
<script type="text/javascript" src="/Scripts/all_scripts_iframe.js"></script>
    </form>
</body>
</html>
