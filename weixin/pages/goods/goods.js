const app = getApp()
const ajax = require('../../utils/ajax.js');
const utils = require('../../utils/util.js');
var sectionData = [];
var ifLoadMore = null;
var classifyId = null;
var page = 1;//默认第一页
Page({

  data: {
    scrollH: 0,
    imgWidth: 0,
    loadingCount: 0,
    images: [],
    col1: [],
    col2: [],
    newGoodsData:[],
  },

  onLoad: function (options) {
    // this.brandShow();
    classifyId = options.classifyId;
    page = 1;
    ifLoadMore = null;
    console.log('classifyId:' + classifyId);
    wx.getSystemInfo({
      success: (res) => {
        let ww = res.windowWidth;
        let wh = res.windowHeight;
        let imgWidth = ww * 0.48;
        let scrollH = wh;

        this.setData({
          scrollH: scrollH,
          imgWidth: imgWidth
        });

        //加载首组图片
        // this.loadImages();
        this.brandShow();
      }
    })
  },

  onImageLoad1: function (e) {
    let imageId = e.currentTarget.id;
    let oImgW = e.detail.width;         //图片原始宽度
    let oImgH = e.detail.height;        //图片原始高度
    let imgWidth = this.data.imgWidth;  //图片设置的宽度
    let scale = imgWidth / oImgW;        //比例计算
    let imgHeight = oImgH * scale;      //自适应高度

    let images = this.data.brandGoods;
    let imageObj = null;

    for (let i = 0; i < images.length; i++) {
      let img = images[i];
      if (img.id + "" === imageId) {
        imageObj = img;
        break;
      }
    }

    imageObj.height = imgHeight;

    let loadingCount = this.data.loadingCount - 1;
    let col1 = this.data.col1;
    let col2 = this.data.col2;
    //判断当前图片添加到左列还是右列
    if (col1.length <= col2.length) {
      col1.push(imageObj);
    } else {
      col2.push(imageObj);
    }
   
    let data = {
      loadingCount: loadingCount,
      col1: col1,
      col2: col2,

    };
    //当前这组图片已加载完毕，则清空图片临时加载区域的内容
    if (!loadingCount) {
      data.images = [];
    }
    this.setData(data);
  },

  brandShow: function (success) {
    var that = this;
    console.log(page)
    var url = app.globalData.baseUrl;
    wx.request({
      method: 'GET',
      url:url+ 'details',
      success: (res) => {
        console.log(res.data.data);
        this.setData({
          newGoodsData:res.data.data,
         });
         page += 1;
         if (ifLoadMore) {
          //加载更多
           var newGoodsData=res.data.data;
            wx.showToast({
              title: '暂无更多内容！',
              icon: 'loading',
              duration: 1000
            })
           }
          if (ifLoadMore == null) {
            ifLoadMore = true;
            sectionData['brandGoods'] = res.data.data;//刷新
          }
          else {
            sectionData['brandGoods'] = res.data.data;//刷新
          }
        that.setData({
            brandGoods: sectionData['brandGoods'],
        });
         console.log(that.data.brandGoods)
         wx.stopPullDownRefresh();//结束动画
      }
    })
  },
  catchTapCategory: function (e) {
    var that = this;
    var goodsId = e.currentTarget.dataset.goodsid;
    console.log('lid:' + goodsId);
    //新增商品用户点击数量
    that.goodsClickShow(goodsId);
    //跳转商品详情
    wx.navigateTo({ url: '../detail/detail?lid=' + goodsId })
  },
  goodsClickShow(goodsId) {
    console.log('增加商品用户点击数量');
    var that = this;
    var url = app.globalData.baseUrl;
    wx.request({
      method: 'GET',
      url: url + "details?lid=" + goodsId,
      success: (res) => {
        console.log(res.data.data);
        console.log(res.data.data)
        console.log("用户点击统计返回结果：" + res.data.msg)
      }
    })
  }
})