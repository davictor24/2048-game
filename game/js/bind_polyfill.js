Object.defineProperty(Function.prototype, "bind", {
  value: Function.prototype.bind || function (target) {
    var self = this;
    return function (args) {
      if (!(args instanceof Array)) {
        args = [args];
      }
      self.apply(target, args);
    };
  }
});