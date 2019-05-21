const utils = require('../../utils/util.js');
const app = getApp()
var searchArray=[]
Page({
  /**
   * 页面的初始数据
   */
  data: {
    box: [],//创建数组  
    SearchText: '取消',//按钮变动值 
    keydown_number: 0,//检测input框内是否有内容 
    hiddenName:false
  },
  listenerSearchInput:function(e){
    if(e.detail.cursor !=0){
      this.setData({
        SearchText:"搜索",
        keydown_number:1
      })
    }else{
      this.setData({
        SearchText:"取消",
        keydown_number:0
      })  
    }
  },
  //搜索方法
  searchKey: function (e) {
     this.setData({
       hiddenName:true
     })
    var key = e.detail.value.key;
    if (this.data.keydown_number == 1) {
      let This = this;
      //把获取的input值插入数组里面
      let arr = this.data.box;
      //判断取值是手动输入还是点击赋值
      if (this.data.key == "") {
        // 判断数组中是否已存在
        let arrnum = arr.indexOf(key);
        if (arrnum != -1) {
          // 删除已存在后重新插入至数组
          arr.splice(arrnum, 1)
          arr.unshift(key);
        } else {
          arr.unshift(key);
        }
      } else {
        let arr_num = arr.indexOf(key);
        if (arr_num != -1) {
          arr.splice(arr_num, 1)
          arr.unshift(key);
        } else {
          arr.unshift(key);
        }
      }
      console.log(arr)
      //存储搜索记录
      wx.setStorage({
        key: "boxlist",
        data: arr
      })
      //取出搜索记录
      wx.getStorage({
        key: 'boxlist',
        success: function (res) {
          This.setData({
            box: res.data
          })
        }
      })
      this.setData({
        key: '',
      })
    } else {
      console.log("取消")
    }
    var url = app.globalData.baseUrl + "refer?key=" + key;
    console.log(url)
    wx.request({
      url: url,
      data: { key: key },
       header: {},
      method: 'GET',
      success: (res) => {
        if(key==""){
          wx.showToast({
            title: '搜索内容不能为空',
            icon: 'none',
            duration: 3000
          })
        }else{
          console.log(res.data.data)
          this.setData({
            list1: res.data.data
          });
        }
      },
    })
  },
  //清除搜索记录
  delete_list: function () {
    //清除当前数据
    this.setData({
      box: []
    });
    //清除缓存数据
    wx.removeStorage({
      key: 'boxlist'
    })
  },
  localvalue:function(e){
    let value=e.currentTarget.dataset.text;
    this.setData({
      values: value,
      SearchText:" 搜索",
      keydown_number:1
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
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    let Boxkey = this;
    //读取缓存历史搜索记录
    wx.getStorage({
      key: 'boxlist',
      success: function (res) {
        Boxkey.setData({
          box: res.data
        })
      }
    })
  },
})
