// pages/mine/mine.js
 const app=getApp()
 Page({
   /**
    * 页面的初始数据
    */
   data: {
     userInfo: {},
     hasUserInfo: false,
     canIUse: wx.canIUse('button.open-type.getUserInfo'),
     orderItems: [
       {
         typeId: 0,
         name: '待付款',
         url: 'bill',
         imageurl: 'http://127.0.0.1:3000/img/login/df.png',
       },
       {
         typeId: 1,
         name: '待收货',
         url: 'bill',
         imageurl: 'http://127.0.0.1:3000/img/login/ds.png',
       },
       {
         typeId: 2,
         name: '待评价',
         url: 'bill',
         imageurl: 'http://127.0.0.1:3000/img/login/dp.png'
       },
       {
         typeId: 3,
         name: '退换/售后',
         url: 'bill',
         imageurl: 'http://127.0.0.1:3000/img/login/sh.png'
       }
     ],
   },
   //事件处理函数
   onLoad: function () {
     if (app.globalData.userInfo) {
       this.setData({
         userInfo: app.globalData.userInfo,
         hasUserInfo: true
       })
     } else if (this.data.canIUse) {
       // 由于 getUserInfo 是网络请求，可能会在 Page.onLoad 之后才返回
       // 所以此处加入 callback 以防止这种情况
       app.userInfoReadyCallback = res => {
         this.setData({
           userInfo: res.userInfo,
           hasUserInfo: true
         })
       }
     } else {
       // 在没有 open-type=getUserInfo 版本的兼容处理
       wx.getUserInfo({
         success: res => {
           app.globalData.userInfo = res.userInfo
           this.setData({
             userInfo: res.data.data
           })
         }
       })
     }
   },
  getUserInfo: function (e) {
    console.log(e)
    var uname=e.detail.userInfo.nickName;
    var uimg=e.detail.userInfo.avatarUrl;
    var url = app.globalData.baseUrl;
    wx:wx.request({
      url: url+'login?uname='+uname+'&uimg='+uimg,
      success:res=>{
        this.setData({
         userInfo: e.detail.userInfo,
        })
      },
    })
   },
   myAddress: function (e) {
     console.log(e)
     if (app.globalData.baseuser>0){
       wx.showToast({
         title: '请登陆',
       })
     }else{
       wx.navigateTo({ url: '../addressList/addressList' });
     }
   },
   mines:function(e){
     if(app.globalData.baseuser>0){
       wx:wx.showToast({
         title: '请登陆',
       })
     }else{
       wx.navigateTo({ url: '../other/other', })
     }
   },
   collect:function(e){
     if (app.globalData.baseuser >0) {
       wx: wx.showToast({
         title: '请登陆',
       })
     } else {
     wx.navigateTo({
       url: '../collect/collect',
     })
   }}
 })

