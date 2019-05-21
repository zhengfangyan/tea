//index.js
//获取应用实例
var  util=require('../../utils/util.js');
let goodsList = [
  { actEndTime: util.formatTime(new Date()).split(" ")[0] + " 24:0:0" },
 ]

let animationShowHeight = 300;
const app = getApp()
Page({
  /*** 页面的初始数据*/
  data: {
    list1: [],
    list2:[],
    list3:[],
    list4:[],
    list5:[],
    list6:[],
    list7:[],
    indicatorDots: true, //是否显示面板指示点
    autoplay:true,
    interval:2000,
    countDownList: [],
    actEndTimeList: [],
    animationData: "",
    showModalStatus: false,
    imageHeight: 0,
    imageWidth: 0,
    weather: [],//实况天气
  },
  onLoad: function (options) {
    this.getAjax();
    this.menu();
    this.sale();
    //倒计时
    let endTimeList = [];
    goodsList.forEach(o => { endTimeList.push(o.actEndTime) })
    this.setData({ actEndTimeList: endTimeList });
    // 执行倒计时函数
    this.countDown();
    this.getapi();
  },
  // 天气
  imageLoad: function (e) {
    this.setData({ imageHeight: e.detail.height, imageWidth: e.detail.width });
  },
  showModal: function () {
    // 显示遮罩
    var animation = wx.createAnimation({})
    animation.translateX(animationShowHeight).step()
    this.setData({
      animationData: animation.export(),
      showModalStatus: true
    })
    setTimeout(function () {
      animation.translateX(0).step()
      this.setData({
        animationData: animation.export()
      })
    }.bind(this), 100)
  },
  hideModal: function () {
    // 隐藏遮罩层
    var animation = wx.createAnimation({})
    animation.translateX(animationShowHeight).step()
    this.setData({
      animationData: animation.export(),
    })
    setTimeout(function () {
      animation.translateX(0).step()
      this.setData({
        animationData: animation.export(),
        showModalStatus: false
      })
    }.bind(this), 200)
  },
  onShow: function () {
    let that = this;
    wx.getSystemInfo({
      success: function (res) {
       animationShowHeight = res.windowHeight;
      }
    })
  },
  getapi: function () {
    var _this = this;
    // 获取IP地址
    wx.request({
      url: 'https://ip.tianqiapi.com/',
      data: {
      },
      method: 'POST',
      header: {
        'content-type': 'application/x-www-form-urlencoded'
      },
      success: function (res) {
        console.log(res);
        // 根据IP获取天气数据
        _this.weathertoday(res.data.ip);
      }
    });
  },
  // 天气api实况天气
  weathertoday: function (ip) {
    var _this = this;
    wx.request({
      url: 'https://www.tianqiapi.com/api/?version=v6',
      data: {
        'ip': ip
      },
      method: 'GET',
      header: {
        'content-type': 'application/x-www-form-urlencoded'
      },
      success: function (res) {
        _this.setData({
          weather: res.data
        });
        console.log(_this.data.weather)
      }
    });
  },
  // 轮播
   getAjax: function () {
     //1.发送请求
     var url = app.globalData.baseUrl;
     wx.request({
       url: url +"imglist",
       data: "",
       method: 'GET',
       success: (res) => {
         this.setData({
          list1: res.data.data
         });
       }
     })
   },
  //菜单
  menu:function(){
    var url=app.globalData.baseUrl;
    wx.request({
      url:url+"menu",
      data:"",
      method:"GET",
      success:(res)=>{
        this.setData({
          list2:res.data.data,
        })
      }
    })
  },
  //计时器
  timeFormat(param) {//小于10的格式化函数
    return param < 10 ? '0' + param : param;
  },
  countDown() {//倒计时函数
    // 获取当前时间，同时得到活动结束时间数组
    let newTime = new Date().getTime();
    let endTimeList = this.data.actEndTimeList;
    let countDownArr = [];
    // 对结束时间进行处理渲染到页面
    endTimeList.forEach(o => {
      let endTime = new Date(o).getTime();
      let obj = null;
      // 如果活动未结束，对时间进行处理
      if (endTime - newTime > 0) {
        let time = (endTime - newTime) / 1000;
        // 获取天、时、分、秒
        let day = parseInt(time / (60 * 60 * 24));
        let hou = parseInt(time % (60 * 60 * 24) / 3600);
        let min = parseInt(time % (60 * 60 * 24) % 3600 / 60);
        let sec = parseInt(time % (60 * 60 * 24) % 3600 % 60);
        obj = {
          day: this.timeFormat(day),
          hou: this.timeFormat(hou),
          min: this.timeFormat(min),
          sec: this.timeFormat(sec)
        }
      } else {//活动已结束，全部设置为'00'
        obj = {
          day: '00',
          hou: '00',
          min: '00',
          sec: '00'
        }
      }
      countDownArr.push(obj);
      
    })
    // 渲染，然后每隔一秒执行一次倒计时函数
    this.setData({ countDownList: countDownArr })
    setTimeout(this.countDown, 1000);
  },
  //f1滚动
  sale:function(){
    var url=app.globalData.baseUrl;
    wx:wx.request({
      url: url+'sale',
      data: '',
      header: {},
      method: 'GET',
      success: (res)=> {
        this.setData({
          list3: res.data.data.splice(0,5),
          list4: res.data.data.splice(0,5),
          list5:res.data.data.splice(0,7),
          list6:res.data.data.splice(0,1),
          list7:res.data.data.splice(0,7),
        })
      },
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
})