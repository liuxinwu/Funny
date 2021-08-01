// 主要用于父组件调用子组件的方法
// 也可以通过 GlobalKey 的方式 缺点 子组件不能依赖父组件的数据更新

// 短暂处理 需要重写发布订阅者模式
Map eventCenter = {
  'center': [],
  'on': (fn) {
    eventCenter['center'].add(fn);
  },
  'emit': (int curActiveIdx) {
    eventCenter['center'].forEach((e) {
      e(curActiveIdx);
    });
  },
  'off': () {
    eventCenter['center'].length = 0;
  }
};
