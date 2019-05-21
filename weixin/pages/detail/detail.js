/// pages/detail/detail.js
const app = getApp()
const ajax = require('../../utils/ajax.js');
const utils = require('../../utils/util.js');
var imgUrls = [];
var detailImg = [];
var goodsId = null;
var goods = null;
Page({

  /**
   * 页面的初始数据
   */
  data: {
    currentTab: '',
    isLike: false,
    showDialog: false,
    goods: null,
    indicatorDots: true, //是否显示面板指示点
    autoplay: true, //是否自动切换
    interval: 3000, //自动切换时间间隔,3s
    duration: 1000, //  滑动动画时长1s
  },
  /*** 滑动切换tab***/
  bindChange: function (e) {
    var that = this;
    that.setData({ currentTab: e.detail.current });
  },
  /*** 点击tab切换***/
  swichNav: function (e) {
    var that = this;
    that.setData({
      currentTab: e.target.dataset.current
    });
  },
  //预览图片
  previewImage: function (e) {
    var current = e.target.dataset.src;
    console.log(current)
    wx.previewImage({
      current: current, // 当前显示图片的http链接  
      urls: this.data.imgUrls // 需要预览的图片http链接列表  
    })
  },
  // 收藏
  addLike() {
    if(app.globalData.baseuser>0){
      wx.showToast({
        title: '请登陆',
      })
    }else{
    this.setData({
      isLike: !this.data.isLike,
    });
    var goods = this.data.goods;
    goods.isSelect = false;
    // 获取购物车的缓存数组（没有数据，则赋予一个空数组）  
    var arr = wx.getStorageSync('cart') || [];
    console.log("arr,{}", arr);
    if (arr.length > 0) {
      // 遍历购物车数组  
      for (var j in arr) {
        // 判断购物车内的item的id，和事件传递过来的id，是否相等 
        if (arr[j].goodsId == goodsId) {
          // 相等的话，给count+1（即再次添加入购物车，数量+1）  
          arr[j].count = arr[j].count + 1;
          // 最后，把购物车数据，存放入缓存（此处不用再给购物车数组push元素进去，因为这个是购物车有的，直接更新当前数组即可）  
          try {
            wx.setStorageSync('cart', arr)
          } catch (e) {
            console.log(e)
          }
          //关闭窗口
          wx.showToast({
            title: '收藏成功！',
            icon: 'success',
            duration: 2000
          });
          this.closeDialog();
          // 返回（在if内使用return，跳出循环节约运算，节约性能） 
          return;
        }
      }
      // 遍历完购物车后，没有对应的item项，把goodslist的当前项放入购物车数组  
      arr.push(goods);
    }
    // 最后，把购物车数据，存放入缓存  
    try {
      wx.setStorageSync('cart', arr)
      // 返回（在if内使用return，跳出循环节约运算，节约性能） 
      //关闭窗口
      this.closeDialog();
      return;
    } catch (e) {
      console.log(e)
    }
  }
  },
  // 跳到购物车
  toCar() {
    if(app.globalData.baseuser>0){
      wx.showToast({
        title: '请先登陆',
      })
    }else{
      wx.switchTab({ url: '../cart1/cart1' })
    }
  },
  // 立即购买
  immeBuy(e) {
    console.log(e)
    if (app.globalData.baseuser>0){
      wx.showToast({
        title: ' 请登陆',
      })
    }else{
      // var pro = e.detail.userInfo.nickName;
      // var uimg = e.detail.userInfo.avatarUrl;
      // var url = app.globalData.baseUrl;
      // wx: wx.request({
      //   url: url + 'login?uname=' + uname + '&uimg=' + uimg,
      //   success: res => {
      //     this.setData({
      //       userInfo: e.detail.userInfo,
      //     })
      //   },
      // })
      wx.showToast({
        title: '购买成功',
        icon: 'success',
        duration: 2000
      });
    }
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    goodsId = options.lid;
    console.log('lid:' + goodsId);
    //加载商品详情
    this.goodsInfoShow();
  },
  goodsInfoShow: function (success) {
    var url = app.globalData.baseUrl;
    wx.request({
      method: 'GET',
      url: url+'det?lid=' + goodsId,
      success:(res) => {
        var goodsItem = res.data.data;
         console.log(goodsItem)
         goods = {
           imgUrl1: goodsItem[0].limg1,
           imgUrl2: goodsItem[0].limg2,
           imgUrl3: goodsItem[0].limg3,
           imgUrl4: goodsItem[0].limg4,
           imgUrl5: goodsItem[0].limg5,
           imgUrl6: goodsItem[0].limg6,
           imgUrl7: goodsItem[0].limg7,
           title: goodsItem[0].title,
           price: goodsItem[0].price.toFixed(2),
           detailImg: detailImg,
           buyRate: goodsItem.buyRate,
           goodsId: goodsId,
           count: 1,
           totalMoney: goodsItem[0].price,
         }
         console.log(goods)
         this.setData({
           goods: goods
         })
       }
     })
  },
  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {
  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {

  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function () {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function () {

  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {

  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {

  },
  /**
   * sku 弹出
   */
  toggleDialog: function () {
    if (app.globalData.baseuser>0){
      wx.showToast({
        title: ' 请登陆',
      })
    }else{
      this.setData({
        showDialog: !this.data.showDialog
      });
    }
  },
  /**
   * sku 关闭
   */
  closeDialog: function () {
    console.info("关闭");
    this.setData({
      showDialog: false
    });
  },
  /* 减数 */
  delCount: function (e) {
    console.log("刚刚您点击了减1");
    var count = this.data.goods.count;
    // 商品总数量-1
    if (count > 1) {
      this.data.goods.count--;
    }
    // 将数值与状态写回  
    this.setData({
      goods: this.data.goods
    });
    this.priceCount();
  },
  /* 加数 */
  addCount: function (e) {
    console.log("刚刚您点击了加1");
    var count = this.data.goods.count;
    // 商品总数量-1  
    if (count < 10) {
      this.data.goods.count++;
    }
    // 将数值与状态写回  
    this.setData({
      goods: this.data.goods
    });
    this.priceCount();
  },
  //价格计算
  priceCount: function (e) {
    this.data.goods.totalMoney = this.data.goods.price * this.data.goods.count;
    this.setData({
      goods: this.data.goods
    })
  },
  /**
   * 加入购物车
   */
  addCar: function (e) {
    // var url = app.globalData.baseUrl;
    // var oid = e.currentTarget.dataset.goodid; 
    // var pName = this.data.goods.title;
    // var count = this.data.goods.count;
    // console.log(pName,count,oid)
    // wx.request({
    //   method: 'GET',
    //   url: url+'shopping?oid='+oid+'&pName='+pName+'&count='+count,
    //   success: (res) => {
    //     console.log(res.data.data)
    //     this.setData({ 
    //       goodsItem: res.data.data
    //     })
    //   }
    // })
    var goods = this.data.goods;
    goods.isSelect = false;
    var count = this.data.goods.count;
    // 获取购物车的缓存数组（没有数据，则赋予一个空数组）  
    var arr = wx.getStorageSync('cart') || [];
    console.log("arr,{}", arr);
    if (arr.length > 0) {
      // 遍历购物车数组  
      for (var j in arr) {
        // 判断购物车内的item的id，和事件传递过来的id，是否相等  
        if (arr[j].goodsId == goodsId) {
          console.log()
          // 相等的话，给count+1（即再次添加入购物车，数量+1）  
          arr[j].count = arr[j].count + 1;
          // 最后，把购物车数据，存放入缓存（此处不用再给购物车数组push元素进去，因为这个是购物车有的，直接更新当前数组即可）  
          try {
            wx.setStorageSync('cart', arr)
          } catch (e) {
            console.log(e)
          }
          //关闭窗口
          wx.showToast({
            title: '加入购物车成功！',
            icon: 'success',
            duration: 2000
          });
          this.closeDialog();
          // 返回（在if内使用return，跳出循环节约运算，节约性能） 
          return;
        }
      }
      // 遍历完购物车后，没有对应的item项，把goodslist的当前项放入购物车数组  
      arr.push(goods);
    } else {
      arr.push(goods);
    }
    // 最后，把购物车数据，存放入缓存  
    try {
      wx.setStorageSync('cart', arr)
      // 返回（在if内使用return，跳出循环节约运算，节约性能） 
      //关闭窗口
      this.closeDialog();
      return;
    } catch (e) {
      console.log(e)
    }


  }
})