// pages/classify/classify.js
const utils = require('../../utils/util.js');
const app = getApp()
// pages/test/test.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    indexSize: 0,
    indicatorDots: false,
    autoplay: false,
    duration: 0, //可以控制动画
    circular:true,
    list: '',
    detail: [
      {
        id: 1,
        title: '乌龙茶',
        list: [
          {
            img1: 'http://127.0.0.1:3000/img/class/w_01.jpg',
            title: '安溪铁观音',
          },
          {
            img1: 'http://127.0.0.1:3000/img/class/w_02.jpg',
            title: '武夷岩茶',
          },
          {
            img1: 'http://127.0.0.1:3000/img/class/w_03.jpg',
            title: '广东单枞',
          },
          {
            img1: 'http://127.0.0.1:3000/img/class/w_04.jpg',
            title: '漳平水仙',
          },
          {
            img1: 'http://127.0.0.1:3000/img/class/w_05.jpg',
            title: '台湾乌龙茶',
          },
        ],
      },
      {
        id: 2,
        title: '红茶',
        list: [
          {
            img1: 'http://127.0.0.1:3000/img/class/h_01.jpg',
            title: '金骏眉',
          },
          {
            img1: 'http://127.0.0.1:3000/img/class/h_02.jpg',
            title: '正山小种',
          },
          {
            img1: 'http://127.0.0.1:3000/img/class/h_03.jpg',
            title: '滇红',
          },
          {
            img1: 'http://127.0.0.1:3000/img/class/h_04.jpg',
            title: '祁门红茶',
          },
          {
            img1: 'http://127.0.0.1:3000/img/class/h_05.jpg',
            title: '广西红茶',
          },
          {
            img1: 'http://127.0.0.1:3000/img/class/h_06.jpg',
            title: '锡兰红茶',
          },
          {
            img1: 'http://127.0.0.1:3000/img/class/h_07.jpg',
            title: '其它红茶',
          },
          {
            img1: 'http://127.0.0.1:3000/img/class/h_08.jpg',
            title: '安化红针',
          },
        ],
      },
      {
        id: 3,
        title: '绿茶',
        list: [
          {
            img1: 'http://127.0.0.1:3000/img/class/l_01.jpg',
            title: '龙井',
          },
          {
            img1: 'http://127.0.0.1:3000/img/class/l_02.jpg',
            title: '四川绿茶',
          },
          {
            img1: 'http://127.0.0.1:3000/img/class/l_03.jpg',
            title: '安吉白茶',
          },
          {
            img1: 'http://127.0.0.1:3000/img/class/l_04.jpg',
            title: '信阳毛尖',
          },
          {
            img1: 'http://127.0.0.1:3000/img/class/l_05.jpg',
            title: '碧螺春',
          },
          {
            img1: 'http://127.0.0.1:3000/img/class/l_06.jpg',
            title: '黄山毛峰',
          },
          {
            img1: 'http://127.0.0.1:3000/img/class/l_07.jpg',
            title: '六安瓜片',
          },
          {
            img1: 'http://127.0.0.1:3000/img/class/l_08.jpg',
            title: '太平猴魁',
          },
          {
            img1: 'http://127.0.0.1:3000/img/class/l_09.jpg',
            title: '广西绿茶',
          },
          {
            img1: 'http://127.0.0.1:3000/img/class/l_10.jpg',
            title: '其它绿茶',
          },
          {
            img1: 'http://127.0.0.1:3000/img/class/l_11.jpg',
            title: '贵州绿茶',
          },
        ],
      },
      {
        id: 4,
        title: '黑茶',
        list: [
          {
            img1: 'http://127.0.0.1:3000/img/class/b_01.jpg',
            title: '普洱茶',
          },
          {
            img1: 'http://127.0.0.1:3000/img/class/b_02.jpg',
            title: '安化黑茶',
          },
          {
            img1: 'http://127.0.0.1:3000/img/class/b_03.jpg',
            title: '柑普茶',
          },
          {
            img1: 'http://127.0.0.1:3000/img/class/b_04.jpg',
            title: '藏茶',
          },
          {
            img1: 'http://127.0.0.1:3000/img/class/b_05.jpg',
            title: '六堡茶',
          },
          {
            img1: 'http://127.0.0.1:3000/img/class/b_06.jpg',
            title: '陕西黑茶',
          },
        ],
      },
      {
        id: 5,
        title: '白茶',
        list: [
          {
            img1: 'http://127.0.0.1:3000/img/class/f_01.jpg',
            title: '银针',
          },
          {
            img1: 'http://127.0.0.1:3000/img/class/f_02.jpg',
            title: '白牡丹',
          },
          {
            img1: 'http://127.0.0.1:3000/img/class/f_03.jpg',
            title: '寿眉',
          },
          {
            img1: 'http://127.0.0.1:3000/img/class/f_04.jpg',
            title: '其它白茶',
          },
        ],
      },
      {
        id: 6,
        title: '花茶',
        list: [
          {
            img1: 'http://127.0.0.1:3000/img/class/m_01.jpg',
            title: '玫瑰花茶',
          },
          {
            img1: 'http://127.0.0.1:3000/img/class/m_03.jpg',
            title: '菊花茶',
          },
          {
            img1: 'http://127.0.0.1:3000/img/class/m_04.jpg',
            title: '花草茶',
          },
        ],
      },
      {
        id: 7,
        title: '茶具',
        list: [
          {
            img1: 'http://127.0.0.1:3000/img/class/j_01.jpg',
            title: '陶瓷茶具',
          },
          {
            img1: 'http://127.0.0.1:3000/img/class/j_02.jpg',
            title: '紫砂茶具',
          },
          {
            img1: 'http://127.0.0.1:3000/img/class/j_03.jpg',
            title: '玻璃茶具',
          },
          {
            img1: 'http://127.0.0.1:3000/img/class/j_04.jpg',
            title: '茶盘',
          },
          {
            img1: 'http://127.0.0.1:3000/img/class/j_05.jpg',
            title: '建盏',
          },
          {
            img1: 'http://127.0.0.1:3000/img/class/j_06.jpg',
            title: '茶道配件',
          },
          {
            img1: 'http://127.0.0.1:3000/img/class/j_07.jpg',
            title: '银器',
          },
        ],
      }, 
    ],
  },
  // 滚动
  change(e) {
    console.log(e)
    this.setData({
      indexSize: e.detail.current
    })
  },
  //点击
  scrollTo(e) {
    this.setData({
      indexSize: e.target.dataset.index, 
    })
  },

})