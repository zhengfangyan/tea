// pages/collect/collect.js
const app = getApp()
Page({

  /**
   * 页面的初始数据
   */
  data: {
    collects: [], //数据 
    iscart: false,
    hidden: null,
    isAllSelect: false,
 
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {

  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {

  },

  delGoods: function (e) {
    this.data.collects.splice(e.target.id.substring(3), 1);
    // 更新data数据对象  
    if (this.data.collects.length > 0) {
      this.setData({
        collects: this.data.collects
      })
      wx.setStorageSync('cart', this.data.collects);
    } else {
      this.setData({
        cart: this.data.collects,
        iscart: false,
        hidden: true,
      })
      wx.setStorageSync('cart', []);
    }
  },
  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {
    // 获取产品展示页保存的缓存数据（购物车的缓存数组，没有数据，则赋予一个空数组）  
    var arr = wx.getStorageSync('cart') || [];
    console.info("缓存数据：" + arr);
    // 有数据的话，就遍历数据，计算总金额 和 总数量  
    if (arr.length > 0) {
      // 更新数据  
      this.setData({
        collects: arr,
        iscart: true,
        hidden: false
      });
      console.info("缓存数据：" + this.data.collects);
    } else {
      this.setData({
        iscart: false,
        hidden: true,
      });
    }
  },
})